#!/bin/bash
# Install all packages from Brewfile.
# chezmoi runs this once per machine. Re-run manually with:
#   brew bundle install --file=~/dotfiles/macos/Brewfile

set -euo pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle install --file="${CHEZMOI_SOURCE_DIR}/macos/Brewfile"
