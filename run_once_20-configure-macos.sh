#!/bin/bash
# Apply macOS system defaults.
# chezmoi runs this once per machine. Re-run manually with:
#   ~/dotfiles/macos/set-defaults.sh

set -euo pipefail

"${CHEZMOI_SOURCE_DIR}/macos/set-defaults.sh"
