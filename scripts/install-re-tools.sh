#!/usr/bin/env bash
# installe la boîte à outils minimale pour les crackmes de ce repo
# (ELF + PE32, analyse + Wine + Go + Python). Idempotent : relancer ne casse rien.
#
# Priorité : outils en **ligne de commande** (agent, CI, serveur sans display).
# Pas de suites GUI (Ghidra/Cutter/IDA interactive, etc.) — IDA headless via
# decc/decasm côté machine si dispo ; Wine GUI → xvfb-run.
#
#   ./scripts/install-re-tools.sh
#   ./scripts/install-re-tools.sh --dry-run
#
# Debian / Ubuntu. Il faut sudo pour apt.

set -euo pipefail

DRY=0
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY=1
fi

# paquet apt  →  binaire(s) attendu(s)
# xxd : paquet « xxd » (vim)
# strings/objdump/readelf/nm : binutils
# 7z : paquet « 7zip » (Ubuntu 24.04) ; « p7zip-full » en repli
# diec : binaire Detect It Easy — .deb GitHub DIE-engine (pas de paquet apt standard)
# GoReSym : binaire Mandiant — zip GitHub (pclntab / symboles Go stripés)
# golang-go : toolchain Go (`go version -m` sur binaires non stripés / buildinfo)
# pycdc : décompileur bytecode Python (build depuis zrax/pycdc) — après pyinstxtractor
# cmake / git / g++ / make : deps build pycdc
# YARA : build depuis sources VirusTotal (comme postinstall ~/.bash_aliases) — pas le paquet apt
# automake / libtool / gcc / flex / bison / libssl-dev / autoconf / pkg-config : deps build YARA
# glow : snap install glow (après les paquets apt)
# xvfb : framebuffer virtuel pour Wine headless (serveur dédié sans display)
# mingw-w64 : cross GCC/G++ Win32 (i686) + Win64 (x86_64) pour recon PE
PACKAGES=(
  file
  binutils
  xxd
  gdb
  strace
  nasm
  python3
  python3-pip
  python3-pefile
  curl
  ca-certificates
  wine
  wine64
  wine32
  xvfb
  7zip
  mingw-w64
  golang-go
  cmake
  git
  g++
  gcc
  make
  automake
  autoconf
  libtool
  pkg-config
  flex
  bison
  libssl-dev
)

DIE_RELEASES_API="https://api.github.com/repos/horsicq/DIE-engine/releases/latest"
DIE_RELEASES_PAGE="https://github.com/horsicq/DIE-engine/releases"

GORESYM_RELEASES_API="https://api.github.com/repos/mandiant/GoReSym/releases/latest"
GORESYM_RELEASES_PAGE="https://github.com/mandiant/GoReSym/releases"
GORESYM_INSTALL_DIR="/usr/local/bin"

PYCDC_REPO="https://github.com/zrax/pycdc.git"
PYCDC_INSTALL_DIR="/usr/local/bin"

# Aligné sur postinstall (~/.bash_aliases) : tree ~/yara + symlinks /usr/local/bin
YARA_VERSION="4.5.4"
YARA_SRC_URL="https://github.com/VirusTotal/yara/archive/refs/tags/v${YARA_VERSION}.zip"
YARA_HOME="${HOME}/yara"
YARA_BIN_DIR="/usr/local/bin"

need_sudo() {
  if [[ "$(id -u)" -eq 0 ]]; then
    return
  fi
  if ! command -v sudo >/dev/null; then
    echo "il faut root ou sudo" >&2
    exit 1
  fi
}

run() {
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  $*"
    return 0
  fi
  "$@"
}

pkg_available() {
  # connu d'apt (dépôt ou déjà installé). pas de madison+pipefail :
  # grep -q ferme le pipe trop tôt → SIGPIPE aléatoire.
  apt-cache show "$1" >/dev/null 2>&1
}

echo "=== crackme-writeups : outils reverse ==="
if [[ "$DRY" -eq 1 ]]; then
  echo "(dry-run : aucune installation)"
fi

need_sudo
SUDO=()
if [[ "$(id -u)" -ne 0 ]]; then
  SUDO=(sudo)
fi

# PE32 → wine32 → arch i386
if ! dpkg --print-foreign-architectures | grep -qx i386; then
  echo "-> dpkg --add-architecture i386"
  run "${SUDO[@]}" dpkg --add-architecture i386
fi

echo "-> apt-get update"
run "${SUDO[@]}" apt-get update -y

TO_INSTALL=()
for p in "${PACKAGES[@]}"; do
  if [[ "$p" == "7zip" ]] && ! pkg_available 7zip && pkg_available p7zip-full; then
    p=p7zip-full
  fi
  if ! pkg_available "$p"; then
    echo "SKIP $p  (pas dans les dépôts)"
    continue
  fi
  TO_INSTALL+=("$p")
done

echo "-> apt-get install ${TO_INSTALL[*]}"
run "${SUDO[@]}" DEBIAN_FRONTEND=noninteractive apt-get install -y "${TO_INSTALL[@]}"

# pefile aussi dans le venv courant, si on est dedans
if [[ -n "${VIRTUAL_ENV:-}" ]]; then
  echo "-> pip install pefile  (venv $VIRTUAL_ENV)"
  run python3 -m pip install -q pefile
fi

# --- Detect It Easy : binaire « diec » via .deb GitHub (pas d’apt « detectiteasy ») ---
detect_distro() {
  # ID + VERSION_ID (ex. ubuntu / 24.04)
  if [[ -r /etc/os-release ]]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    DISTRO_ID="${ID:-}"
    DISTRO_VER="${VERSION_ID:-}"
    DISTRO_CODENAME="${VERSION_CODENAME:-}"
  fi
  if command -v lsb_release >/dev/null 2>&1; then
    DISTRO_ID="${DISTRO_ID:-$(lsb_release -is 2>/dev/null | tr '[:upper:]' '[:lower:]')}"
    DISTRO_VER="${DISTRO_VER:-$(lsb_release -rs 2>/dev/null)}"
    DISTRO_DESC="$(lsb_release -ds 2>/dev/null || true)"
  fi
  DISTRO_ID="${DISTRO_ID:-unknown}"
  DISTRO_VER="${DISTRO_VER:-unknown}"
  DISTRO_DESC="${DISTRO_DESC:-$DISTRO_ID $DISTRO_VER}"
}

# Choisit le tag Ubuntu/Debian le plus proche parmi les .deb de la release.
# stdout : nom de fichier asset (ex. die_3.21_Ubuntu_24.04_amd64.deb)
pick_die_deb_name() {
  local assets_file=$1
  local id=$2
  local ver=$3
  local want_prefix candidates nearest

  case "$id" in
    ubuntu|linuxmint|pop)
      want_prefix="Ubuntu"
      ;;
    debian)
      want_prefix="Debian"
      ;;
    kali)
      want_prefix="Kali"
      ;;
    *)
      # défaut : Ubuntu LTS le plus récent listé
      want_prefix="Ubuntu"
      ;;
  esac

  # liste des assets .deb pour ce préfixe
  mapfile -t candidates < <(
    grep -oE "die_[0-9.]+_${want_prefix}_[^\" ]+_amd64\\.deb" "$assets_file" | sort -u
  )
  if [[ ${#candidates[@]} -eq 0 ]]; then
    # repli Ubuntu
    want_prefix="Ubuntu"
    mapfile -t candidates < <(
      grep -oE "die_[0-9.]+_Ubuntu_[^\" ]+_amd64\\.deb" "$assets_file" | sort -u
    )
  fi
  if [[ ${#candidates[@]} -eq 0 ]]; then
    return 1
  fi

  # match exact VERSION_ID (ex. 24.04)
  for c in "${candidates[@]}"; do
    if [[ "$c" == *"_${want_prefix}_${ver}_amd64.deb" ]]; then
      echo "$c"
      return 0
    fi
  done

  # match majeur.mineur « proche » : pour 24.10 → 24.04, 25.04 → 24.04, 22.10 → 22.04
  local major minor
  if [[ "$ver" =~ ^([0-9]+)\.([0-9]+) ]]; then
    major="${BASH_REMATCH[1]}"
    minor="${BASH_REMATCH[2]}"
    # essayer exact puis LTS pairs 04 décroissants sous le même majeur
    for try in "${ver}" "${major}.04" "${major}.10"; do
      for c in "${candidates[@]}"; do
        if [[ "$c" == *"_${want_prefix}_${try}_amd64.deb" ]]; then
          echo "$c"
          return 0
        fi
      done
    done
    # plus proche numériquement (ex. 26.04 dispo, host 25.10)
    nearest=$(
      python3 - "$ver" "$want_prefix" "${candidates[@]}" <<'PY'
import sys
host = sys.argv[1]
prefix = sys.argv[2]
cands = sys.argv[3:]
def parse_ver(name):
    # die_3.21_Ubuntu_24.04_amd64.deb
    parts = name.replace(".deb", "").split("_")
    for i, p in enumerate(parts):
        if p == prefix and i + 1 < len(parts):
            v = parts[i + 1]
            try:
                maj, mino = v.split(".", 1)
                return float(maj) + float(mino) / 100.0, name
            except ValueError:
                return None
    return None
try:
    hmaj, hmin = host.split(".", 1)
    hv = float(hmaj) + float(hmin) / 100.0
except ValueError:
    print(cands[-1]); raise SystemExit
parsed = [parse_ver(c) for c in cands]
parsed = [p for p in parsed if p]
if not parsed:
    print(cands[-1]); raise SystemExit
parsed.sort(key=lambda x: abs(x[0] - hv))
print(parsed[0][1])
PY
    )
    echo "$nearest"
    return 0
  fi

  # dernier recours : dernier asset de la liste
  echo "${candidates[-1]}"
}

install_die_deb() {
  if command -v diec >/dev/null 2>&1; then
    echo "OK   diec déjà présent : $(command -v diec)"
    return 0
  fi

  detect_distro
  echo "-> DIE/diec : distro détectée : ${DISTRO_DESC} (id=${DISTRO_ID} ver=${DISTRO_VER})"

  if ! command -v curl >/dev/null 2>&1; then
    echo "SKIP diec  (curl absent — impossible de télécharger le .deb)" >&2
    echo "     manuel : ${DIE_RELEASES_PAGE}" >&2
    return 0
  fi

  local tmp_json tmp_deb asset url
  tmp_json="$(mktemp)"
  tmp_deb="$(mktemp --suffix=.deb)"
  # shellcheck disable=SC2064
  trap "rm -f '$tmp_json' '$tmp_deb'" RETURN

  echo "-> curl ${DIE_RELEASES_API}"
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  curl -fsSL ${DIE_RELEASES_API}"
    # assets fictifs pour afficher le choix en dry-run
    cat >"$tmp_json" <<'EOF'
{"assets":[
  {"name":"die_3.21_Ubuntu_20.04_amd64.deb","browser_download_url":"https://example/20"},
  {"name":"die_3.21_Ubuntu_22.04_amd64.deb","browser_download_url":"https://example/22"},
  {"name":"die_3.21_Ubuntu_24.04_amd64.deb","browser_download_url":"https://example/24"},
  {"name":"die_3.21_Ubuntu_26.04_amd64.deb","browser_download_url":"https://example/26"},
  {"name":"die_3.21_Debian_12_amd64.deb","browser_download_url":"https://example/d12"}
]}
EOF
  else
    if ! curl -fsSL -o "$tmp_json" "$DIE_RELEASES_API"; then
      echo "SKIP diec  (API GitHub injoignable — ${DIE_RELEASES_PAGE})" >&2
      return 0
    fi
  fi

  # extraire noms d'assets pour le picker
  local assets_list
  assets_list="$(mktemp)"
  python3 - "$tmp_json" >"$assets_list" <<'PY'
import json, sys
with open(sys.argv[1], encoding="utf-8") as f:
    r = json.load(f)
for a in r.get("assets") or []:
    name = a.get("name") or ""
    if name.endswith(".deb"):
        print(name)
PY

  asset="$(pick_die_deb_name "$assets_list" "$DISTRO_ID" "$DISTRO_VER" || true)"
  rm -f "$assets_list"
  if [[ -z "${asset:-}" ]]; then
    echo "SKIP diec  (aucun .deb compatible dans la release — ${DIE_RELEASES_PAGE})" >&2
    return 0
  fi

  url="$(
    python3 - "$tmp_json" "$asset" <<'PY'
import json, sys
with open(sys.argv[1], encoding="utf-8") as f:
    r = json.load(f)
want = sys.argv[2]
for a in r.get("assets") or []:
    if a.get("name") == want:
        print(a.get("browser_download_url") or "")
        break
PY
  )"
  if [[ -z "$url" ]]; then
    echo "SKIP diec  (URL introuvable pour $asset)" >&2
    return 0
  fi

  echo "-> DIE asset : $asset"
  echo "-> téléchargement $url"
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  curl -fL -o …deb $url"
    echo "DRY  dpkg -i …deb && apt-get install -f -y"
    return 0
  fi

  if ! curl -fL --retry 3 -o "$tmp_deb" "$url"; then
    echo "SKIP diec  (téléchargement échoué)" >&2
    return 0
  fi

  echo "-> dpkg -i $asset"
  # deps manquantes possibles (Qt…) : -f les résout
  if ! run "${SUDO[@]}" dpkg -i "$tmp_deb"; then
    echo "-> apt-get install -f (deps DIE)"
    run "${SUDO[@]}" DEBIAN_FRONTEND=noninteractive apt-get install -f -y
    run "${SUDO[@]}" dpkg -i "$tmp_deb" || true
  fi
}

install_die_deb

# --- GoReSym : symboles / pclntab Go (zip GitHub Mandiant) ---
install_goresym() {
  if command -v GoReSym >/dev/null 2>&1; then
    echo "OK   GoReSym déjà présent : $(command -v GoReSym)"
    return 0
  fi

  local arch
  arch="$(uname -m)"
  if [[ "$arch" != "x86_64" && "$arch" != "amd64" ]]; then
    echo "SKIP GoReSym  (asset linux amd64 seulement ; host=$arch — ${GORESYM_RELEASES_PAGE})" >&2
    return 0
  fi

  if ! command -v curl >/dev/null 2>&1; then
    echo "SKIP GoReSym  (curl absent — ${GORESYM_RELEASES_PAGE})" >&2
    return 0
  fi

  local tmp_json tmp_zip tmp_dir url tag dest
  tmp_json="$(mktemp)"
  tmp_zip="$(mktemp --suffix=.zip)"
  tmp_dir="$(mktemp -d)"
  # shellcheck disable=SC2064
  trap "rm -rf '$tmp_json' '$tmp_zip' '$tmp_dir'" RETURN

  echo "-> curl ${GORESYM_RELEASES_API}"
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  curl -fsSL ${GORESYM_RELEASES_API}"
    cat >"$tmp_json" <<'EOF'
{"tag_name":"v3.4","assets":[
  {"name":"GoReSym-linux.zip","browser_download_url":"https://github.com/mandiant/GoReSym/releases/download/v3.4/GoReSym-linux.zip"}
]}
EOF
  else
    if ! curl -fsSL -o "$tmp_json" "$GORESYM_RELEASES_API"; then
      echo "SKIP GoReSym  (API GitHub injoignable — ${GORESYM_RELEASES_PAGE})" >&2
      return 0
    fi
  fi

  tag="$(
    python3 - "$tmp_json" <<'PY'
import json, sys
with open(sys.argv[1], encoding="utf-8") as f:
    print(json.load(f).get("tag_name") or "")
PY
  )"
  url="$(
    python3 - "$tmp_json" <<'PY'
import json, sys
with open(sys.argv[1], encoding="utf-8") as f:
    r = json.load(f)
for a in r.get("assets") or []:
    if a.get("name") == "GoReSym-linux.zip":
        print(a.get("browser_download_url") or "")
        break
PY
  )"
  if [[ -z "$url" ]]; then
    echo "SKIP GoReSym  (GoReSym-linux.zip introuvable dans la release — ${GORESYM_RELEASES_PAGE})" >&2
    return 0
  fi

  echo "-> GoReSym ${tag:-?} : $url"
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  curl -fL -o …zip $url"
    echo "DRY  install → ${GORESYM_INSTALL_DIR}/GoReSym (+ symlink goresym)"
    return 0
  fi

  if ! curl -fL --retry 3 -o "$tmp_zip" "$url"; then
    echo "SKIP GoReSym  (téléchargement échoué)" >&2
    return 0
  fi

  python3 - "$tmp_zip" "$tmp_dir" <<'PY'
import sys, zipfile
zf = zipfile.ZipFile(sys.argv[1])
zf.extractall(sys.argv[2])
PY

  if [[ ! -f "$tmp_dir/GoReSym" ]]; then
    echo "SKIP GoReSym  (binaire absent dans le zip)" >&2
    return 0
  fi

  dest="${GORESYM_INSTALL_DIR}/GoReSym"
  echo "-> install $dest"
  run "${SUDO[@]}" install -m 755 "$tmp_dir/GoReSym" "$dest"
  # alias minuscule pratique en CLI
  run "${SUDO[@]}" ln -sfn "$dest" "${GORESYM_INSTALL_DIR}/goresym"
}

install_goresym

# --- pycdc : décompile .pyc (PyInstaller / frozen Python) — build zrax/pycdc ---
install_pycdc() {
  if command -v pycdc >/dev/null 2>&1; then
    echo "OK   pycdc déjà présent : $(command -v pycdc)"
    return 0
  fi

  # En dry-run, apt n’a pas encore posé cmake/git/g++ — on simule quand même.
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  git clone --depth 1 ${PYCDC_REPO}"
    echo "DRY  cmake + build → ${PYCDC_INSTALL_DIR}/pycdc (+ pycdas si produit)"
    return 0
  fi

  local miss=()
  command -v git >/dev/null 2>&1 || miss+=(git)
  command -v cmake >/dev/null 2>&1 || miss+=(cmake)
  command -v g++ >/dev/null 2>&1 || miss+=(g++)
  command -v make >/dev/null 2>&1 || miss+=(make)
  if [[ ${#miss[@]} -gt 0 ]]; then
    echo "SKIP pycdc  (deps manquantes : ${miss[*]} — relancer après apt)" >&2
    return 0
  fi

  local tmp_dir
  tmp_dir="$(mktemp -d)"
  # shellcheck disable=SC2064
  trap "rm -rf '$tmp_dir'" RETURN

  echo "-> git clone --depth 1 ${PYCDC_REPO}"
  if ! git clone --depth 1 "$PYCDC_REPO" "$tmp_dir/pycdc"; then
    echo "SKIP pycdc  (clone GitHub échoué — ${PYCDC_REPO})" >&2
    return 0
  fi

  echo "-> cmake / build pycdc"
  if ! cmake -S "$tmp_dir/pycdc" -B "$tmp_dir/build"; then
    echo "SKIP pycdc  (cmake configure échoué)" >&2
    return 0
  fi
  if ! cmake --build "$tmp_dir/build" -j"$(nproc 2>/dev/null || echo 2)"; then
    echo "SKIP pycdc  (build échoué)" >&2
    return 0
  fi

  if [[ ! -x "$tmp_dir/build/pycdc" ]]; then
    echo "SKIP pycdc  (binaire pycdc absent après build)" >&2
    return 0
  fi

  echo "-> install ${PYCDC_INSTALL_DIR}/pycdc"
  run "${SUDO[@]}" install -m 755 "$tmp_dir/build/pycdc" "${PYCDC_INSTALL_DIR}/pycdc"
  if [[ -x "$tmp_dir/build/pycdas" ]]; then
    echo "-> install ${PYCDC_INSTALL_DIR}/pycdas"
    run "${SUDO[@]}" install -m 755 "$tmp_dir/build/pycdas" "${PYCDC_INSTALL_DIR}/pycdas"
  fi
}

install_pycdc

# --- YARA : build depuis sources (même schéma que postinstall ~/.bash_aliases) ---
# Pas de paquet apt « yara » : on compile v${YARA_VERSION} → ~/yara + liens /usr/local/bin.
install_yara_from_source() {
  if [[ -x "${YARA_HOME}/yara" && -x "${YARA_HOME}/yarac" ]]; then
    echo "OK   YARA déjà compilé dans ${YARA_HOME}"
    # (re)poser les symlinks si besoin
    if [[ "$DRY" -eq 0 ]]; then
      run "${SUDO[@]}" rm -f "${YARA_BIN_DIR}/yara" "${YARA_BIN_DIR}/yarac"
      run "${SUDO[@]}" ln -sfn "${YARA_HOME}/yara" "${YARA_BIN_DIR}/yara"
      run "${SUDO[@]}" ln -sfn "${YARA_HOME}/yarac" "${YARA_BIN_DIR}/yarac"
    else
      echo "DRY  ln -sfn ${YARA_HOME}/yara → ${YARA_BIN_DIR}/yara (+ yarac)"
    fi
    return 0
  fi

  if command -v yara >/dev/null 2>&1 && command -v yarac >/dev/null 2>&1; then
    echo "OK   yara déjà présent : $(command -v yara)  ($(yara -v 2>/dev/null || echo '?'))"
    echo "     (pas de tree ${YARA_HOME} — skip rebuild ; lancer postinstall pour aligner si besoin)"
    return 0
  fi

  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  curl -fL -o …zip ${YARA_SRC_URL}"
    echo "DRY  extract → ${YARA_HOME}  (bootstrap/configure/make/make install)"
    echo "DRY  ln -sfn ${YARA_HOME}/yara → ${YARA_BIN_DIR}/yara (+ yarac)"
    return 0
  fi

  local miss=()
  for b in curl make gcc flex bison; do
    command -v "$b" >/dev/null 2>&1 || miss+=("$b")
  done
  # bootstrap.sh a besoin d'autoconf/automake/libtool
  for b in autoconf automake libtool; do
    command -v "$b" >/dev/null 2>&1 || miss+=("$b")
  done
  if [[ ${#miss[@]} -gt 0 ]]; then
    echo "SKIP yara  (deps manquantes : ${miss[*]} — relancer après apt)" >&2
    return 0
  fi
  if [[ ! -f /usr/include/openssl/ssl.h ]] && [[ ! -f /usr/include/x86_64-linux-gnu/openssl/ssl.h ]]; then
    echo "SKIP yara  (libssl-dev absent — headers OpenSSL introuvables)" >&2
    return 0
  fi

  local tmp_zip tmp_extract
  tmp_zip="$(mktemp --suffix=.zip)"
  tmp_extract="$(mktemp -d)"
  # shellcheck disable=SC2064
  trap "rm -rf '$tmp_zip' '$tmp_extract'" RETURN

  echo "-> téléchargement YARA v${YARA_VERSION}"
  if ! curl -fL --retry 3 -o "$tmp_zip" "$YARA_SRC_URL"; then
    echo "SKIP yara  (téléchargement échoué — ${YARA_SRC_URL})" >&2
    return 0
  fi

  echo "-> extract → ${YARA_HOME}"
  if command -v 7z >/dev/null 2>&1; then
    if ! 7z x -y "-o${tmp_extract}" "$tmp_zip" >/dev/null; then
      echo "SKIP yara  (7z extract échoué)" >&2
      return 0
    fi
  else
    python3 - "$tmp_zip" "$tmp_extract" <<'PY'
import sys, zipfile
zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])
PY
  fi

  if [[ ! -d "${tmp_extract}/yara-${YARA_VERSION}" ]]; then
    echo "SKIP yara  (dossier yara-${YARA_VERSION} absent après extract)" >&2
    return 0
  fi

  rm -rf "${YARA_HOME}"
  mv "${tmp_extract}/yara-${YARA_VERSION}" "${YARA_HOME}"

  echo "-> bootstrap / configure / make (YARA v${YARA_VERSION})"
  if ! (
    cd "${YARA_HOME}" \
      && ./bootstrap.sh \
      && ./configure \
      && make -j"$(nproc 2>/dev/null || echo 2)"
  ); then
    echo "SKIP yara  (build échoué dans ${YARA_HOME})" >&2
    return 0
  fi

  if [[ ! -x "${YARA_HOME}/yara" || ! -x "${YARA_HOME}/yarac" ]]; then
    echo "SKIP yara  (binaires absents après make — ${YARA_HOME}/yara)" >&2
    return 0
  fi

  # make install système (headers/libs) + liens CLI vers le tree ~/yara (comme postinstall)
  echo "-> make install + symlinks ${YARA_BIN_DIR}/yara"
  (
    cd "${YARA_HOME}" && run "${SUDO[@]}" make install
  ) || echo "WARN yara  make install a échoué (binaires ~/yara OK — on link quand même)" >&2

  run "${SUDO[@]}" rm -f "${YARA_BIN_DIR}/yara" "${YARA_BIN_DIR}/yarac"
  run "${SUDO[@]}" ln -sfn "${YARA_HOME}/yara" "${YARA_BIN_DIR}/yara"
  run "${SUDO[@]}" ln -sfn "${YARA_HOME}/yarac" "${YARA_BIN_DIR}/yarac"
  echo "OK   YARA v${YARA_VERSION} → ${YARA_HOME}  (yara=$(command -v yara 2>/dev/null || echo pending))"
}

install_yara_from_source

# glow (rendu markdown terminal) — snap
if command -v glow >/dev/null 2>&1; then
  echo "OK   glow déjà présent : $(command -v glow)"
elif ! command -v snap >/dev/null 2>&1; then
  echo "SKIP glow  (snap absent — installer snapd puis relancer, ou : snap install glow)"
else
  echo "-> snap install glow"
  run "${SUDO[@]}" snap install glow
fi

echo
echo "=== vérif ==="
check() {
  local bin=$1
  if command -v "$bin" >/dev/null 2>&1; then
    printf "OK   %-14s %s\n" "$bin" "$(command -v "$bin")"
  else
    printf "MISS %-14s\n" "$bin"
  fi
}
check file
check strings
check xxd
check objdump
check readelf
check nm
check gdb
check strace
check nasm
check python3
check wine
check wineconsole
check xvfb-run
check Xvfb
check diec
check GoReSym
check goresym
check go
check pycdc
check pycdas
check yara
check yarac
check 7z
check glow
check x86_64-w64-mingw32-gcc
check x86_64-w64-mingw32-g++
check i686-w64-mingw32-gcc
check i686-w64-mingw32-g++

python3 -c "import pefile; print('OK   pefile         ', pefile.__file__)" 2>/dev/null \
  || echo "MISS pefile"

echo
echo "wine : $(wine --version 2>/dev/null || echo absent)"
echo "wine headless (serveur) : xvfb-run -a wine original/CFB1.exe"
echo "mingw PE64 : x86_64-w64-mingw32-gcc  |  PE32 : i686-w64-mingw32-gcc"
echo "Go : go version -m original/<bin>  |  GoReSym original/<bin>  # strip / pclntab"
echo "PyInstaller : python3 tools/pyinstxtractor.py …  puis  pycdc analysis/…/*.pyc"
echo "YARA (build) : yara rules.yar original/<bin>   # tree ${YARA_HOME} → ${YARA_BIN_DIR}/yara"
echo "fini."
