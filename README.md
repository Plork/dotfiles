# Dotfiles

[![Powered by dotbot][dbshield]][dblink]

[dblink]: https://github.com/anishathalye/dotbot
[dbshield]: https://img.shields.io/badge/powered%20by-dotbot-blue?style=flat

> Personal dotfiles configuration for Zsh, Git, Vim, and more to rapidly bootstrap a new system.

![Image](preview.png)

## Components

- [Dotbot](https://github.com/anishathalye/dotbot) - Installation
- Zsh Configuration
  - [Zgen](https://github.com/tarjoilija/zgen) - Plugin Manager
  - [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - Zsh config framework
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Theme
  - [asdf](https://github.com/asdf-vm/asdf) - Multi-language version manager
  - [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [neovim](https://github.com/neovim/neovim) and [vim-plug](https://github.com/junegunn/vim-plug)
- Homebrew restore
- VS Code extension restore
- Install MacOS defaults

## Usage

*Prerequisites: python, git, zsh*

### Installation

```sh
git clone git@github.com:denolfe/dotfiles.git .dotfiles --recursive
cd .dotfiles
make install
```
