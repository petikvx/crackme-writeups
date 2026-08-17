#!/usr/bin/env bash
# installe la boîte à outils minimale pour les crackmes de ce repo
# (ELF + PE32, analyse + Wine). Idempotent : relancer ne casse rien.
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
# diec : « detectiteasy » s'il est dans tes dépôts (souvent un .deb hors archive)
# glow : snap install glow (après les paquets apt)
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
  wine
  wine64
  wine32
  7zip
)

OPTIONAL=(
  detectiteasy
)

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

for p in "${OPTIONAL[@]}"; do
  if pkg_available "$p"; then
    TO_INSTALL+=("$p")
  else
    echo "SKIP $p  (hors dépôts Ubuntu — .deb : https://github.com/horsicq/DIE-engine/releases)"
    echo "     chez toi il est déjà là si « diec » répond (paquet local detectiteasy)."
  fi
done

echo "-> apt-get install ${TO_INSTALL[*]}"
run "${SUDO[@]}" DEBIAN_FRONTEND=noninteractive apt-get install -y "${TO_INSTALL[@]}"

# pefile aussi dans le venv courant, si on est dedans
if [[ -n "${VIRTUAL_ENV:-}" ]]; then
  echo "-> pip install pefile  (venv $VIRTUAL_ENV)"
  run python3 -m pip install -q pefile
fi

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
check diec
check 7z
check glow

python3 -c "import pefile; print('OK   pefile         ', pefile.__file__)" 2>/dev/null \
  || echo "MISS pefile"

echo
echo "wine : $(wine --version 2>/dev/null || echo absent)"
echo "fini."
