# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Change the command execution time stamp shown in the history command output
HIST_STAMPS="yyyy-mm-dd"

# Plugins to load
plugins=(
  git
  colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
)

FPATH=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src:$FPATH

# User configuration
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# Initialize zsh completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Activate oh-my-posh prompt; this should be the last line.
# The path is set from the post-create.sh script.
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/p10k_lean.omp.json)"
