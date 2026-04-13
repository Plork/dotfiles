# Dotfiles

> Personal dotfiles for Zsh, Git, Neovim, and more — bootstraps a new macOS machine in one command.

## Stack

| Tool | Purpose |
| ---- | ------- |
| [chezmoi](https://github.com/twpayne/chezmoi) | Dotfiles manager |
| [sheldon](https://github.com/rossmacarthur/sheldon) | Zsh plugin manager |
| [starship](https://github.com/starship/starship) | Prompt |
| [mise](https://github.com/jdx/mise) | Node version manager |
| [uv](https://github.com/astral-sh/uv) | Python version manager + package manager |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [1Password](https://1password.com) | SSH agent + secrets |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |

## Installation

```sh
git clone https://github.com/Plork/dotfiles ~/dotfiles
~/dotfiles/install
```

The `install` script bootstraps Homebrew and chezmoi, then applies all dotfiles. Subsequent syncs:

```sh
chezmoi apply
```

## Structure

```text
├── dot_zshrc                        # ~/.zshrc
├── dot_config/
│   ├── sheldon/plugins.toml         # Zsh plugins
│   ├── starship.toml                # Prompt config
│   └── mise/config.toml             # Node version
├── aliases/                         # Shell aliases
├── functions/                       # Shell functions
├── path/                            # PATH additions
├── macos/
│   ├── Brewfile                     # Homebrew packages
│   └── set-defaults.sh              # macOS defaults
└── run_once_*.sh                    # chezmoi bootstrap scripts
```

## CI

[![Test dotfiles](https://github.com/Plork/dotfiles/actions/workflows/tests.yml/badge.svg)](https://github.com/Plork/dotfiles/actions/workflows/tests.yml)
