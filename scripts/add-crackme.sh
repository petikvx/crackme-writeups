#!/usr/bin/env bash
# add-crackme.sh — scaffold un crackme depuis crackmes.one (ID ou URL)
#
# Usage :
#   ./scripts/add-crackme.sh https://crackmes.one/crackme/6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh https://crackmes.one/download/crackme/6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh 6991e765853c2615340abd8c
#   ./scripts/add-crackme.sh --author timotei 64e275ead931496abf908ff7
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

usage() {
  sed -n '2,14p' "$0" | sed 's/^# \?//'
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
    --) shift; ARGS+=("$@"); break ;;
    -*) die "option inconnue: $1" ;;
    *) ARGS+=("$1"); shift ;;
  esac
done
[[ ${#ARGS[@]} -ge 1 ]] || usage 1
INPUT="${ARGS[0]}"

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

log "id           : $ID"
log "page         : $PAGE_URL"
log "download     : $DL_URL"
log "author_site  : ${AUTHOR_ON_SITE:-?}"
log "author_local : $AUTHOR_LOCAL"
log "title        : ${TITLE:-?}"
log "dest         : $CHALLENGE_DIR"

if [[ "$DRY_RUN" -eq 1 ]]; then
  log "dry-run: stop avant création / download"
  exit 0
fi

if [[ -e "$CHALLENGE_DIR" ]]; then
  die "le dossier existe déjà: $CHALLENGE_DIR"
fi

mkdir -p "$ORIG_DIR" "$ANALYSIS_DIR" "$TOOLS_DIR"
mkdir -p "$ROOT/authors/${AUTHOR_LOCAL}"

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

if [[ "$NO_DOWNLOAD" -eq 0 ]]; then
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

# --- README squelette ---
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

# --- maj catalog.yml (best-effort) ---
CATALOG="$ROOT/authors/${AUTHOR_LOCAL}/catalog.yml"
python3 - "$CATALOG" "$ID" "$SHA256" "$CHALLENGE_DIR" "$BINARY_PATH" "$TITLE" "$ROOT" <<'PY'
import os, sys, re

catalog, cid, sha, cdir, bpath, title, root = sys.argv[1:8]
rel = os.path.relpath(cdir, root)
brel = os.path.join(rel, bpath) if bpath else rel

# ensure file exists with headers
if not os.path.isfile(catalog):
    with open(catalog, "w", encoding="utf-8") as f:
        f.write("# Index id ↔ sha256 ↔ path (série locale)\n")
        f.write("by_id: {}\n")
        f.write("by_sha256: {}\n")

text = open(catalog, encoding="utf-8").read()
# naive YAML append blocks — if empty maps, rewrite simply
entry_id = f"  {cid}:\n    sha256: \"{sha}\"\n    path: \"{brel}\"\n    title: \"{title.replace(chr(34), '')}\"\n"
entry_sha = f"  {sha}:\n    id: {cid}\n    path: \"{brel}\"\n    page: https://crackmes.one/crackme/{cid}\n" if sha else ""

def upsert_section(src: str, key: str, block: str) -> str:
    if not block:
        return src
    # if key already present, skip duplicate
    if re.search(rf"(?m)^  {re.escape(block.splitlines()[0].strip().rstrip(':'))}:\s*$", src):
        return src
    if re.search(rf"(?m)^{re.escape(key)}:\s*\{\{\s*\}}\s*$", src):
        return re.sub(rf"(?m)^{re.escape(key)}:\s*\{\{\s*\}}\s*$", f"{key}:\n{block}", src, count=1)
    if re.search(rf"(?m)^{re.escape(key)}:\s*$", src):
        return re.sub(rf"(?m)^{re.escape(key)}:\s*$", f"{key}:\n{block}", src, count=1)
    # append
    if not src.endswith("\n"):
        src += "\n"
    return src + f"\n{key}:\n{block}"

# simpler: always rewrite catalog from scratch by merging known entries via regex — keep it dumb
if "by_id:" not in text:
    text = "by_id:\nby_sha256:\n"

# remove existing id entry lines block (minimal)
text2 = text
# append at end under sections using python yaml-less approach: full rewrite
import pathlib
lines_by_id = []
lines_by_sha = []
# parse existing roughly
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
    out = []
    skip = False
    for ln in lines:
        if re.match(rf"^  {re.escape(key)}:\s*$", ln):
            skip = True
            continue
        if skip:
            if re.match(r"^  [0-9a-fA-F]", ln) or re.match(r"^[a-z_]", ln):
                skip = False
            else:
                continue
        if not skip:
            out.append(ln)
    return out

if cid:
    lines_by_id = drop_key(lines_by_id, cid)
    lines_by_id.extend(entry_id.rstrip().splitlines())
if sha:
    lines_by_sha = drop_key(lines_by_sha, sha)
    lines_by_sha.extend(entry_sha.rstrip().splitlines())

out = ["# Index id ↔ sha256 ↔ path", "by_id:"] + lines_by_id + ["", "by_sha256:"] + lines_by_sha + [""]
pathlib.Path(catalog).write_text("\n".join(out), encoding="utf-8")
print("catalog updated")
PY

log "OK"
log "  ORIGIN : $ORIGIN_YML"
log "  README : $CHALLENGE_DIR/README.md"
[[ -n "$SHA256" ]] && log "  hash   : $SHA256"
log "suite   : remplir analysis/ et tools/, puis write-up"
