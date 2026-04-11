#!/bin/bash
# Install Homebrew if not already present.
# chezmoi runs this once per machine (identified by content hash).

set -euo pipefail

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
