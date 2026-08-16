#!/usr/bin/env bash
# add-crackme.sh — scaffold un crackme depuis crackmes.one (ID ou URL)
#
# Usage :
#   ./scripts/add-crackme.sh https://crackmes.one/crackme/6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh https://crackmes.one/download/crackme/6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh 6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh --author timotei 64e275ead931496abf908ff7
#   ./scripts/add-crackme.sh --force <id>          # re-télécharge même si l’ID existe
#   ./scripts/add-crackme.sh --skip-existing <id>  # exit 0 si déjà là (CI / boucles)
#
# Si l’ID existe déjà : pas de téléchargement automatique. En TTY, menu
# (annuler / skip / re-télécharger le binaire / forcer scaffold). Hors TTY :
# erreur, sauf --force / --skip-existing.
#
# ZIP crackmes.one : password = crackmes.one  (extrait avec 7z -p…)
#
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASSWORD="crackmes.one"
USER_AGENT="crackme-writeups-add-crackme/1.0 (+https://github.com/petikvx/crackme-writeups)"
AUTHOR_FORCE=""
DRY_RUN=0
NO_DOWNLOAD=0
FORCE=0
SKIP_EXISTING=0
# none | abort | skip | redl | rescaffold
EXISTING_ACTION=""

usage() {
  sed -n '2,20p' "$0" | sed 's/^# \?//'
  exit "${1:-0}"
}

log()  { printf '==> %s\n' "$*"; }
warn() { printf '!!  %s\n' "$*" >&2; }
die()  { printf 'error: %s\n' "$*" >&2; exit 1; }

need() {
  command -v "$1" >/dev/null 2>&1 || die "commande requise introuvable: $1"
}

# --- args ---
ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) usage 0 ;;
    --author) AUTHOR_FORCE="${2:-}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --no-download) NO_DOWNLOAD=1; shift ;;
    --force|-f) FORCE=1; shift ;;
    --skip-existing) SKIP_EXISTING=1; shift ;;
    --) shift; ARGS+=("$@"); break ;;
    -*) die "option inconnue: $1" ;;
    *) ARGS+=("$1"); shift ;;
  esac
done
[[ ${#ARGS[@]} -ge 1 ]] || usage 1
INPUT="${ARGS[0]}"
if [[ "$FORCE" -eq 1 && "$SKIP_EXISTING" -eq 1 ]]; then
  die "--force et --skip-existing sont mutuellement exclusifs"
fi

# --- parse ID (24 hex) ---
extract_id() {
  local s="$1"
  if [[ "$s" =~ ([0-9a-fA-F]{24}) ]]; then
    printf '%s\n' "${BASH_REMATCH[1],,}"
    return 0
  fi
  return 1
}

ID="$(extract_id "$INPUT" || true)"
[[ -n "$ID" ]] || die "impossible d'extraire un ID crackmes.one (24 hex) depuis: $INPUT"

PAGE_URL="https://crackmes.one/crackme/${ID}"
DL_URL="https://crackmes.one/download/crackme/${ID}"

# Recherche précoce authors/*/<id> (avant curl métadonnées / download)
find_existing_dirs() {
  local id="$1"
  local d
  [[ -d "$ROOT/authors" ]] || return 0
  shopt -s nullglob
  for d in "$ROOT/authors"/*/"$id"; do
    [[ -d "$d" ]] && printf '%s\n' "$d"
  done
  shopt -u nullglob
}

mapfile -t EXISTING_DIRS_EARLY < <(find_existing_dirs "$ID")
if [[ ${#EXISTING_DIRS_EARLY[@]} -gt 0 && "$SKIP_EXISTING" -eq 1 ]]; then
  log "id           : $ID"
  log "existant     : ${EXISTING_DIRS_EARLY[0]}"
  log "skip : ID déjà présent (--skip-existing) — pas de réseau / download"
  exit 0
fi

need curl
need 7z
need sha256sum
need python3

# --- fetch page metadata (best-effort) ---
fetch_meta() {
  python3 - "$PAGE_URL" "$USER_AGENT" <<'PY'
import re, sys, urllib.request

url, ua = sys.argv[1], sys.argv[2]
req = urllib.request.Request(url, headers={"User-Agent": ua})
try:
    html = urllib.request.urlopen(req, timeout=30).read().decode("utf-8", "replace")
except Exception as e:
    print(f"FETCH_ERROR\t{e}", file=sys.stderr)
    sys.exit(2)

def grab(pat, flags=0):
    m = re.search(pat, html, flags)
    return m.group(1).strip() if m else ""

# title: often <title>… · crackmes.one or h3
title = grab(r"<title>\s*([^|<]+)", re.I)
title = re.sub(r"\s*[-|].*$", "", title).strip()
if not title:
    title = grab(r"<h[123][^>]*>\s*([^<]+)", re.I)

# author link /user/NAME
author = grab(r'href="/user/([^"]+)"', re.I)

# platform / arch tables are messy — light heuristics
platform = ""
for label, key in [
    (r"Windows", "Windows"),
    (r"Unix/linux", "Unix/linux etc."),
    (r"Multiplatform", "Multiplatform"),
    (r"Android", "Android"),
]:
    if re.search(label, html, re.I):
        platform = key
        break

arch = ""
if re.search(r"x86-64|x86_64|amd64", html, re.I):
    arch = "x86-64"
elif re.search(r"\bx86\b", html, re.I):
    arch = "x86"

print(f"title\t{title}")
print(f"author\t{author}")
print(f"platform\t{platform}")
print(f"arch\t{arch}")
PY
}

TITLE=""
AUTHOR_ON_SITE=""
PLATFORM=""
ARCH=""
if META="$(fetch_meta 2>/dev/null)"; then
  while IFS=$'\t' read -r k v; do
    case "$k" in
      title) TITLE="$v" ;;
      author) AUTHOR_ON_SITE="$v" ;;
      platform) PLATFORM="$v" ;;
      arch) ARCH="$v" ;;
    esac
  done <<< "$META"
else
  warn "métadonnées page non récupérées (réseau / HTML) — ORIGIN minimal"
fi

# --- resolve local author slug ---
resolve_author() {
  local on_site="$1"
  local forced="$2"
  if [[ -n "$forced" ]]; then
    printf '%s\n' "$forced"
    return
  fi
  # scan authors/*/author.yml for aliases
  local d slug
  if [[ -d "$ROOT/authors" ]]; then
    for d in "$ROOT/authors"/*/; do
      [[ -f "${d}author.yml" ]] || continue
      slug="$(basename "$d")"
      if [[ -z "$on_site" ]]; then
        continue
      fi
      if grep -qiE "^[[:space:]]*-[[:space:]]*${on_site}[[:space:]]*$" "${d}author.yml" 2>/dev/null \
        || grep -qiE "^slug:[[:space:]]*${on_site}[[:space:]]*$" "${d}author.yml" 2>/dev/null \
        || grep -qiE "^display_name:[[:space:]]*${on_site}[[:space:]]*$" "${d}author.yml" 2>/dev/null; then
        printf '%s\n' "$slug"
        return
      fi
    done
  fi
  # fallback: slugify site author or unsorted
  if [[ -n "$on_site" ]]; then
    printf '%s\n' "$(echo "$on_site" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9_-]/-/g')"
  else
    printf '%s\n' "_unsorted"
  fi
}

AUTHOR_LOCAL="$(resolve_author "$AUTHOR_ON_SITE" "$AUTHOR_FORCE")"
CHALLENGE_DIR="$ROOT/authors/${AUTHOR_LOCAL}/${ID}"
ORIG_DIR="$CHALLENGE_DIR/original"
ANALYSIS_DIR="$CHALLENGE_DIR/analysis"
TOOLS_DIR="$CHALLENGE_DIR/tools"
TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/add-crackme.XXXXXX")"
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

# true si le dossier a l’air d’un write-up déjà travaillé (ne pas écraser à la légère)
looks_worked() {
  local d="$1"
  [[ -d "$d/analysis" ]] && [[ -n "$(find "$d/analysis" -type f 2>/dev/null | head -1)" ]] && return 0
  [[ -d "$d/tools" ]] && [[ -n "$(find "$d/tools" -type f 2>/dev/null | head -1)" ]] && return 0
  if [[ -f "$d/ORIGIN.yml" ]] && grep -qiE '^status:[[:space:]]*solved' "$d/ORIGIN.yml" 2>/dev/null; then
    return 0
  fi
  if [[ -f "$d/README.md" ]] && [[ "$(wc -l < "$d/README.md")" -gt 40 ]]; then
    return 0
  fi
  return 1
}

prompt_existing() {
  # stdout: abort|skip|redl|rescaffold
  # Lit stdin (TTY ou pipe). EOF / vide → abort. Scripts non interactifs :
  # préférer --force / --skip-existing.
  local existing="$1"
  warn "ID déjà présent — aucun téléchargement tant qu’on n’a pas choisi."
  printf '\n' >&2
  printf '  Dossier existant : %s\n' "$existing" >&2
  if [[ -f "$existing/ORIGIN.yml" ]]; then
    printf '  ORIGIN.yml       : %s\n' "$existing/ORIGIN.yml" >&2
  fi
  if looks_worked "$existing"; then
    printf '  (semble déjà travaillé : analysis/tools/write-up ou status solved)\n' >&2
  fi
  printf '\n' >&2
  printf 'Que faire ?\n' >&2
  printf '  [a] annuler          — exit 1, rien téléchargé (défaut)\n' >&2
  printf '  [s] skip             — exit 0, rien modifier\n' >&2
  printf '  [r] re-télécharger   — ZIP → original/ seulement (garde README, analysis, tools)\n' >&2
  printf '  [f] force scaffold   — réécrit ORIGIN.yml + README squelette + re-télécharge\n' >&2
  if [[ ! -t 0 ]]; then
    printf '(stdin non-TTY : répondre a/s/r/f sur stdin, ou utiliser --force / --skip-existing)\n' >&2
  fi
  printf 'Choix [a/s/r/f] : ' >&2
  local ans=""
  if ! read -r ans; then
    ans=""
  fi
  case "${ans,,}" in
    s|skip) printf 'skip\n' ;;
    r|redl|re|redownload) printf 'redl\n' ;;
    f|force|rescaffold) printf 'rescaffold\n' ;;
    ""|a|abort|q|n|no) printf 'abort\n' ;;
    *)
      warn "choix inconnu « ${ans} » → annuler"
      printf 'abort\n'
      ;;
  esac
}

EXISTING_DIRS=("${EXISTING_DIRS_EARLY[@]+"${EXISTING_DIRS_EARLY[@]}"}")
if [[ ${#EXISTING_DIRS[@]} -eq 0 ]]; then
  mapfile -t EXISTING_DIRS < <(find_existing_dirs "$ID")
fi
EXISTING_DIR=""
if [[ ${#EXISTING_DIRS[@]} -gt 0 ]]; then
  EXISTING_DIR="${EXISTING_DIRS[0]}"
  if [[ ${#EXISTING_DIRS[@]} -gt 1 ]]; then
    warn "plusieurs dossiers pour le même ID :"
    for d in "${EXISTING_DIRS[@]}"; do warn "  - $d"; done
  fi
fi

log "id           : $ID"
log "page         : $PAGE_URL"
log "download     : $DL_URL"
log "author_site  : ${AUTHOR_ON_SITE:-?}"
log "author_local : $AUTHOR_LOCAL"
log "title        : ${TITLE:-?}"
log "dest         : $CHALLENGE_DIR"
if [[ -n "$EXISTING_DIR" ]]; then
  log "existant     : $EXISTING_DIR"
fi

if [[ "$DRY_RUN" -eq 1 ]]; then
  if [[ -n "$EXISTING_DIR" ]]; then
    log "dry-run: ID déjà présent → pas de download (utilisez --force pour forcer)"
  else
    log "dry-run: stop avant création / download"
  fi
  exit 0
fi

# --- gestion collision ID ---
WRITE_ORIGIN=1
WRITE_README=1
DO_DOWNLOAD=1
[[ "$NO_DOWNLOAD" -eq 1 ]] && DO_DOWNLOAD=0

if [[ -n "$EXISTING_DIR" ]]; then
  # Aligner dest sur le dossier déjà là (évite un second authors/x/id)
  if [[ "$EXISTING_DIR" != "$CHALLENGE_DIR" ]]; then
    if [[ -n "$AUTHOR_FORCE" && "$CHALLENGE_DIR" != "$EXISTING_DIR" ]]; then
      warn "ID déjà sous $(dirname "${EXISTING_DIR#$ROOT/}") — on ignore --author pour cette passe"
    fi
    CHALLENGE_DIR="$EXISTING_DIR"
    AUTHOR_LOCAL="$(basename "$(dirname "$EXISTING_DIR")")"
    ORIG_DIR="$CHALLENGE_DIR/original"
    ANALYSIS_DIR="$CHALLENGE_DIR/analysis"
    TOOLS_DIR="$CHALLENGE_DIR/tools"
    log "dest (réel)  : $CHALLENGE_DIR"
  fi

  if [[ "$FORCE" -eq 1 ]]; then
    EXISTING_ACTION="rescaffold"
  elif [[ "$SKIP_EXISTING" -eq 1 ]]; then
    EXISTING_ACTION="skip"
  else
    EXISTING_ACTION="$(prompt_existing "$EXISTING_DIR")"
  fi

  case "$EXISTING_ACTION" in
    skip)
      log "skip : ID $ID déjà présent → $CHALLENGE_DIR"
      exit 0
      ;;
    abort)
      die "ID $ID déjà présent : $CHALLENGE_DIR (relancer avec --force, --skip-existing, ou répondre au menu)"
      ;;
    redl)
      log "mode re-téléchargement : original/ seulement (pas d’écrasement README/ORIGIN)"
      WRITE_ORIGIN=0
      WRITE_README=0
      DO_DOWNLOAD=1
      mkdir -p "$ORIG_DIR" "$ANALYSIS_DIR" "$TOOLS_DIR"
      # vider original/ avant re-extract pour éviter bascules de binaire
      if [[ -d "$ORIG_DIR" ]]; then
        find "$ORIG_DIR" -mindepth 1 -maxdepth 1 ! -name 'source' -exec rm -rf {} +
        # garde original/source/ (décompilé local) si présent
      fi
      ;;
    rescaffold)
      if looks_worked "$CHALLENGE_DIR" && [[ "$FORCE" -ne 1 ]]; then
        # double confirm en interactif si write-up déjà là
        if [[ -t 0 && -t 1 ]]; then
          printf '!!  ce challenge a l’air déjà résolu/documenté. Écraser ORIGIN/README squelette ? [y/N] : ' >&2
          read -r conf || true
          [[ "${conf,,}" == "y" || "${conf,,}" == "yes" ]] || die "annulé (write-up préservé)"
        else
          die "challenge déjà travaillé — refuse rescaffold hors TTY sans --force"
        fi
      fi
      log "mode force scaffold : ORIGIN + README squelette + download"
      WRITE_ORIGIN=1
      WRITE_README=1
      DO_DOWNLOAD=1
      mkdir -p "$ORIG_DIR" "$ANALYSIS_DIR" "$TOOLS_DIR"
      ;;
    *)
      die "action existante inconnue: $EXISTING_ACTION"
      ;;
  esac
else
  mkdir -p "$ORIG_DIR" "$ANALYSIS_DIR" "$TOOLS_DIR"
  mkdir -p "$ROOT/authors/${AUTHOR_LOCAL}"
fi

# author.yml minimal si absent
AUTHOR_YML="$ROOT/authors/${AUTHOR_LOCAL}/author.yml"
if [[ ! -f "$AUTHOR_YML" ]]; then
  cat > "$AUTHOR_YML" <<EOF
slug: ${AUTHOR_LOCAL}
display_name: ${AUTHOR_LOCAL}
aliases:
  - ${AUTHOR_LOCAL}
EOF
  if [[ -n "$AUTHOR_ON_SITE" && "$AUTHOR_ON_SITE" != "$AUTHOR_LOCAL" ]]; then
    printf '  - %s\n' "$AUTHOR_ON_SITE" >> "$AUTHOR_YML"
  fi
  log "créé author.yml"
fi

# --- download ZIP ---
ZIP_PATH="$TMP_DIR/${ID}.zip"
BINARY_NAME=""
SHA256=""
MD5=""
SIZE_BYTES=0
BINARY_PATH=""

if [[ "$DO_DOWNLOAD" -eq 1 ]]; then
  log "téléchargement ZIP…"
  HTTP_CODE="$(curl -sS -L \
    -A "$USER_AGENT" \
    -o "$ZIP_PATH" \
    -w '%{http_code}' \
    "$DL_URL" || true)"
  if [[ "$HTTP_CODE" != "200" ]]; then
    warn "HTTP $HTTP_CODE pour $DL_URL — dossier scaffoldé sans binaire"
  elif [[ ! -s "$ZIP_PATH" ]]; then
    warn "ZIP vide — scaffold sans binaire"
  else
    # file type check
    if file "$ZIP_PATH" | grep -qiE 'zip|7-zip|archive'; then
      log "extraction 7z (password: crackmes.one)…"
      # -pPASSWORD collé, -y = yes, -oOUT = output dir (pas d'espace après -o)
      7z x -y "-p${PASSWORD}" "-o${ORIG_DIR}" "$ZIP_PATH" >/dev/null
    else
      # parfois le site renvoie directement le binaire
      warn "réponse non-ZIP — copie brute dans original/"
      cp -f "$ZIP_PATH" "$ORIG_DIR/download.bin"
    fi
  fi
else
  log "skip download (--no-download)"
fi

# choisir le « binaire principal » (plus gros fichier non-texte dans original/)
pick_binary() {
  python3 - "$ORIG_DIR" <<'PY'
import os, sys
root = sys.argv[1]
best = None
best_size = -1
for dirpath, _, files in os.walk(root):
    for f in files:
        p = os.path.join(dirpath, f)
        try:
            st = os.stat(p)
        except OSError:
            continue
        if st.st_size > best_size:
            best_size = st.st_size
            best = p
if best:
    print(os.path.relpath(best, root))
    print(best_size)
PY
}

if [[ -d "$ORIG_DIR" ]] && [[ -n "$(find "$ORIG_DIR" -type f 2>/dev/null | head -1)" ]]; then
  mapfile -t PICK < <(pick_binary)
  if [[ ${#PICK[@]} -ge 1 && -n "${PICK[0]:-}" ]]; then
    REL="${PICK[0]}"
    BINARY_NAME="$(basename "$REL")"
    # si dans un sous-dossier du zip, remonter à original/ pour path simple
    if [[ "$REL" == *"/"* ]]; then
      # garde tel quel sous original/
      BINARY_PATH="original/${REL}"
    else
      BINARY_PATH="original/${BINARY_NAME}"
    fi
    FULL="$ORIG_DIR/${REL}"
    if [[ -f "$FULL" ]]; then
      SHA256="$(sha256sum "$FULL" | awk '{print $1}')"
      if command -v md5sum >/dev/null 2>&1; then
        MD5="$(md5sum "$FULL" | awk '{print $1}')"
      fi
      SIZE_BYTES="$(stat -c%s "$FULL" 2>/dev/null || wc -c < "$FULL")"
      log "binaire      : $BINARY_PATH"
      log "sha256       : $SHA256"
    fi
  fi
fi

# --- ORIGIN.yml ---
ORIGIN_YML="$CHALLENGE_DIR/ORIGIN.yml"
if [[ "$WRITE_ORIGIN" -eq 1 ]]; then
  {
    cat <<EOF
# Origine crackmes.one — généré par scripts/add-crackme.sh
id: ${ID}

urls:
  page: ${PAGE_URL}
  download: ${DL_URL}

title: "${TITLE//\"/\\\"}"
author_on_site: "${AUTHOR_ON_SITE}"
author_local: "${AUTHOR_LOCAL}"

platform: "${PLATFORM}"
arch: "${ARCH}"
language: ""

difficulty: null
quality: null
size: ""
published: null

series_index: null
local_slug: null

binary:
  path: "${BINARY_PATH:-}"
  name: "${BINARY_NAME}"
  sha256: "${SHA256}"
  md5: "${MD5}"
  size_bytes: ${SIZE_BYTES:-0}

status: pending
solution_summary: ""

download:
  zip_password: crackmes.one
  fetched_at: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
EOF
  } > "$ORIGIN_YML"
elif [[ -n "$SHA256" && -f "$ORIGIN_YML" ]]; then
  # re-téléchargement : rafraîchir seulement les champs binary.* / fetched_at si présents
  python3 - "$ORIGIN_YML" "$BINARY_PATH" "$BINARY_NAME" "$SHA256" "$MD5" "$SIZE_BYTES" <<'PY'
import re, sys
from pathlib import Path
path, bpath, bname, sha, md5, size = sys.argv[1:7]
text = Path(path).read_text(encoding="utf-8")

def set_field(src, key, value, quoted=True):
    if quoted:
        val = f'"{value}"'
    else:
        val = value
    pat = re.compile(rf'^(\s*{re.escape(key)}:\s*).*$', re.M)
    if pat.search(src):
        return pat.sub(rf'\g<1>{val}', src, count=1)
    return src

text = set_field(text, "path", bpath)
text = set_field(text, "name", bname)
text = set_field(text, "sha256", sha)
text = set_field(text, "md5", md5)
text = set_field(text, "size_bytes", size, quoted=False)
from datetime import datetime, timezone
ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
text = set_field(text, "fetched_at", ts)
Path(path).write_text(text, encoding="utf-8")
print("ORIGIN binary fields refreshed")
PY
else
  log "ORIGIN.yml conservé (pas de réécriture)"
fi

# --- README squelette ---
if [[ "$WRITE_README" -eq 1 ]]; then
  cat > "$CHALLENGE_DIR/README.md" <<EOF
# ${TITLE:-crackme $ID}

| | |
|---|---|
| **ID** | [\`${ID}\`](${PAGE_URL}) |
| **Auteur (site)** | ${AUTHOR_ON_SITE:-?} |
| **Auteur (local)** | ${AUTHOR_LOCAL} |
| **SHA-256** | \`${SHA256:-pending}\` |

## Origine

- Page : ${PAGE_URL}
- Download : ${DL_URL}
- ZIP password : \`crackmes.one\`

Voir [\`ORIGIN.yml\`](ORIGIN.yml).

## Contenu

\`\`\`
original/   # binaire d'origine
analysis/   # IDA, screenshots
tools/      # solveur, recon
\`\`\`

## Status

- [ ] reverse
- [ ] write-up
- [ ] solveur
EOF
else
  log "README.md conservé (pas de réécriture)"
fi

# --- maj catalog.yml (best-effort) ---
CATALOG="$ROOT/authors/${AUTHOR_LOCAL}/catalog.yml"
python3 - "$CATALOG" "$ID" "$SHA256" "$CHALLENGE_DIR" "$BINARY_PATH" "$TITLE" "$ROOT" <<'PY'
import os
import re
import sys
from pathlib import Path

catalog, cid, sha, cdir, bpath, title, root = sys.argv[1:8]
rel = os.path.relpath(cdir, root)
brel = os.path.join(rel, bpath) if bpath else rel
title_clean = title.replace('"', "")

entry_id_lines = [
    f"  {cid}:",
    f'    sha256: "{sha}"',
    f'    path: "{brel}"',
    f'    title: "{title_clean}"',
]
entry_sha_lines = (
    [
        f"  {sha}:",
        f"    id: {cid}",
        f'    path: "{brel}"',
        f"    page: https://crackmes.one/crackme/{cid}",
    ]
    if sha
    else []
)

text = ""
if os.path.isfile(catalog):
    text = Path(catalog).read_text(encoding="utf-8")

lines_by_id = []
lines_by_sha = []
cur = None
for line in text.splitlines():
    if line.strip() == "by_id:":
        cur = "id"
        continue
    if line.strip() == "by_sha256:":
        cur = "sha"
        continue
    if cur == "id":
        lines_by_id.append(line)
    elif cur == "sha":
        lines_by_sha.append(line)


def drop_key(lines, key):
    """Retire un bloc '  <key>:' et ses lignes indentées."""
    out = []
    skip = False
    key_re = re.compile(r"^  " + re.escape(key) + r":\s*$")
    for ln in lines:
        if key_re.match(ln):
            skip = True
            continue
        if skip:
            # nouvelle clé de premier niveau sous by_* : "  something:"
            if re.match(r"^  \S", ln) and ln.rstrip().endswith(":"):
                skip = False
            else:
                continue
        if not skip:
            out.append(ln)
    return out


if cid:
    lines_by_id = drop_key(lines_by_id, cid)
    lines_by_id.extend(entry_id_lines)
if sha:
    lines_by_sha = drop_key(lines_by_sha, sha)
    lines_by_sha.extend(entry_sha_lines)

out_lines = (
    ["# Index id ↔ sha256 ↔ path", "by_id:"]
    + lines_by_id
    + ["", "by_sha256:"]
    + lines_by_sha
    + [""]
)
Path(catalog).write_text("\n".join(out_lines), encoding="utf-8")
print("catalog updated")
PY

log "OK"
log "  ORIGIN : $ORIGIN_YML"
log "  README : $CHALLENGE_DIR/README.md"
[[ -n "$SHA256" ]] && log "  hash   : $SHA256"
log "suite   : remplir analysis/ et tools/, puis write-up"
