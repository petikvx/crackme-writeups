#!/usr/bin/env bash
# Installe Grok Build (CLI/TUI xAI) via l’installeur officiel.
# Pensé pour Codespaces, Google Colab, VM headless, et machine locale.
#
#   ./scripts/install-grok-build.sh
#   ./scripts/install-grok-build.sh --dry-run
#   ./scripts/install-grok-build.sh --login          # device-code après install
#   ./scripts/install-grok-build.sh 1.0.5            # version pin
#   GROK_CHANNEL=alpha ./scripts/install-grok-build.sh
#
# Auth (Colab / Codespaces sans navigateur local) :
#   grok login --device-auth
# ou export XAI_API_KEY=xai-...
#
# Docs : https://docs.x.ai/build/overview
# Installer : https://x.ai/cli/install.sh

set -euo pipefail

INSTALL_URL="https://x.ai/cli/install.sh"
DRY=0
DO_LOGIN=0
VERSION=""

usage() {
  cat <<'EOF'
Usage: ./scripts/install-grok-build.sh [options] [VERSION]

Options:
  -h, --help       cette aide
  --dry-run        montre ce qui serait fait, n’installe rien
  --login          après install, lance `grok login --device-auth`
  VERSION          pin optionnel (ex. 1.0.5) ; défaut = dernier stable

Env utiles:
  GROK_CHANNEL     stable (défaut) | alpha | enterprise
  GROK_BIN_DIR     dossier des binaires (défaut ~/.grok/bin)
  XAI_API_KEY      alternative à `grok login` (CI / Colab secrets)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --dry-run)
      DRY=1
      shift
      ;;
    --login)
      DO_LOGIN=1
      shift
      ;;
    -*)
      echo "option inconnue: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      if [[ -n "$VERSION" ]]; then
        echo "une seule VERSION attendue (déjà: $VERSION, reçu: $1)" >&2
        exit 2
      fi
      VERSION="$1"
      shift
      ;;
  esac
done

run() {
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  $*"
    return 0
  fi
  "$@"
}

detect_env() {
  ENV_HINT="local"
  if [[ -n "${CODESPACES:-}" || -n "${GITHUB_CODESPACE_TOKEN:-}" ]]; then
    ENV_HINT="codespaces"
  elif [[ -n "${COLAB_RELEASE_TAG:-}" || -d /content || -f /content/sample_data ]]; then
    # Colab met souvent /content ; COLAB_RELEASE_TAG n’est pas toujours exporté
    if [[ -n "${COLAB_RELEASE_TAG:-}" ]] || python3 -c 'import google.colab' 2>/dev/null; then
      ENV_HINT="colab"
    elif [[ -d /content ]]; then
      ENV_HINT="colab-like"
    fi
  fi
}

ensure_curl() {
  if command -v curl >/dev/null 2>&1; then
    return 0
  fi
  echo "curl manquant — tentative d’install apt…" >&2
  if [[ "$(id -u)" -eq 0 ]]; then
    run apt-get update -y
    run DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates
  elif command -v sudo >/dev/null 2>&1; then
    run sudo apt-get update -y
    run sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates
  else
    echo "installe curl (apt install curl) puis relance" >&2
    exit 1
  fi
}

path_has_dir() {
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
    *) return 1 ;;
  esac
}

ensure_path_now() {
  local bin_dir="${GROK_BIN_DIR:-$HOME/.grok/bin}"
  if [[ -d "$bin_dir" ]] && ! path_has_dir "$bin_dir"; then
    export PATH="$bin_dir:$PATH"
    echo "-> PATH session : $bin_dir ajouté"
  fi
  # Colab / notebook : ~/.local/bin est souvent déjà dans PATH
  if [[ -x "$bin_dir/grok" && -d "$HOME/.local/bin" ]]; then
    if [[ ! -e "$HOME/.local/bin/grok" ]]; then
      run ln -sf "$bin_dir/grok" "$HOME/.local/bin/grok"
      run ln -sf "$bin_dir/agent" "$HOME/.local/bin/agent"
      echo "-> symlink ~/.local/bin/grok (session notebook)"
    fi
  fi
}

print_auth_hints() {
  cat <<EOF

=== suite (auth) ===
Environnement détecté : $ENV_HINT

Sans navigateur local (Colab / Codespaces / SSH) :
  grok login --device-auth
  # ou alias : grok login --device-code

Avec une clé API (secret Colab / Codespaces / CI) :
  export XAI_API_KEY="xai-..."
  grok --version

Lancer le TUI dans le repo :
  cd $(pwd -P 2>/dev/null || pwd)
  grok

Notes Colab :
  - dans une cellule : !bash scripts/install-grok-build.sh
  - re-exporter PATH si besoin :
      import os; os.environ["PATH"] = os.path.expanduser("~/.grok/bin") + ":" + os.environ["PATH"]

Notes Codespaces :
  - le terminal intégré suffit ; device-code ouvre une URL à coller dans ton navigateur local.
EOF
}

echo "=== crackme-writeups : install Grok Build ==="
if [[ "$DRY" -eq 1 ]]; then
  echo "(dry-run : aucune installation)"
fi

detect_env
echo "-> env : $ENV_HINT"
echo "-> installer : $INSTALL_URL"
if [[ -n "$VERSION" ]]; then
  echo "-> version pin : $VERSION"
else
  echo "-> version : latest (${GROK_CHANNEL:-stable})"
fi

ensure_curl

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

if [[ "$DRY" -eq 1 ]]; then
  echo "DRY  curl -fsSL $INSTALL_URL -o <tmp>"
  if [[ -n "$VERSION" ]]; then
    echo "DRY  bash <tmp> $VERSION"
  else
    echo "DRY  bash <tmp>"
  fi
else
  echo "-> téléchargement de l’installeur officiel"
  curl -fsSL "$INSTALL_URL" -o "$TMP"
  if [[ -n "$VERSION" ]]; then
    echo "-> bash install.sh $VERSION"
    bash "$TMP" "$VERSION"
  else
    echo "-> bash install.sh"
    bash "$TMP"
  fi
fi

ensure_path_now

if command -v grok >/dev/null 2>&1; then
  echo "-> $(command -v grok)"
  if [[ "$DRY" -eq 0 ]]; then
    grok --version || true
  fi
else
  echo "attention : 'grok' pas encore dans le PATH de ce shell" >&2
  echo "  export PATH=\"\${GROK_BIN_DIR:-\$HOME/.grok/bin}:\$PATH\"" >&2
fi

if [[ "$DO_LOGIN" -eq 1 ]]; then
  if [[ "$DRY" -eq 1 ]]; then
    echo "DRY  grok login --device-auth"
  else
    if ! command -v grok >/dev/null 2>&1; then
      export PATH="${GROK_BIN_DIR:-$HOME/.grok/bin}:$PATH"
    fi
    echo "-> grok login --device-auth"
    grok login --device-auth
  fi
fi

print_auth_hints
