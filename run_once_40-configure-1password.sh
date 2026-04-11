#!/usr/bin/env bash
# Configure 1Password SSH agent and install the 1Password VSCode extension.
# run_once_: chezmoi runs this once per machine.

set -euo pipefail

# ── SSH agent ─────────────────────────────────────────────────────────────────
# Point SSH at 1Password's agent socket so keys stored in the vault are used
# automatically. Requires 1Password → Settings → Developer → Use the SSH agent
# to be enabled after installation.

SSH_CONFIG="$HOME/.ssh/config"
OP_AGENT='~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if grep -q "1password" "$SSH_CONFIG" 2>/dev/null; then
  echo "==> 1Password SSH agent already configured, skipping."
else
  echo "==> Configuring 1Password SSH agent in $SSH_CONFIG..."
  cat >> "$SSH_CONFIG" <<EOF

# 1Password SSH agent — keys are managed in the 1Password vault.
# Enable via 1Password → Settings → Developer → Use the SSH agent.
Host *
  IdentityAgent "$OP_AGENT"
EOF
  chmod 600 "$SSH_CONFIG"
fi

# ── VSCode extension ───────────────────────────────────────────────────────────
if command -v code > /dev/null 2>&1; then
  echo "==> Installing 1Password VSCode extension..."
  code --install-extension 1password.op-vscode --force
else
  echo "==> VSCode not found, skipping extension install."
fi
