# Repository

[![ShellCheck](https://github.com/jsadeli/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/jsadeli/dotfiles/actions/workflows/shellcheck.yml)

This repository contains dotfiles (which are application configuration and settings files) which
are compatible with macOS and Linux. It also serves as a way to help me setup and maintain my Mac.

## Fresh macOS/Linux setup

1. Clone this repo `git clone https://github.com/jsadeli/dotfiles.git ~/dotfiles`
1. Change working directory `cd ~/dotfiles`
1. Run `./setup.sh` (may need to apply `chmod +x setup.sh` first).
1. Restart the computer to finalize the process.

## Development Containers

- `.devcontainer/dotfiles/**`: contains customized dotfiles for zsh and p10k theme.
- `.devcontainer/scripts/post-create.sh`: script to run on devcontainer post-creation.
- `devcontainer.json`: sample devcontainer configuration; see `features` and `postCreateCommand`.
