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

The following files are useful for devcontainer deployment:

- Devcontainer:
  - [`.devcontainer/post-create.sh`](.devcontainer/post-create.sh): script to run on devcontainer post-creation.
  - [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json): sample devcontainer configuration; see `features` and `postCreateCommand`.
- Configs:
  - [`.p10k-lean.zsh`](configs/.p10k-lean.zsh) is powerlevel10k using the lean (minimalist) theme.
    Rename to `.p10k.zsh` on final copy to destination.
  - [`.p10k.zsh`](configs/.p10k.zsh) is powerlevel10k using the rainbow (full featured) theme.
  - [`.zshrc-lite`](configs/.zshrc-lite) is minimally configured zsh with essential plugins.
    Rename to `.zshrc` on final copy to destination.

## Notes

- As of 2025-04-11, the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) project appears to
  be deprecated (in life-support mode). The recommended alternative is currently [Oh My Posh](https://ohmyposh.dev/).
