#  _____            ______ 
# |  __ \     /\   |  ____|
# | |__) |   /  \  | |__   
# |  _  /   / /\ \ |  __|    https://github.com/Raf7c
# | | \ \  / ____ \| |     
# |_|  \_\/_/    \_\_|     
#My zsh config. Not much to see here; just some pretty standard stuff.

echo 'Hello from .zshrc'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh


### ----  EXPORT  ---- ###
export TERM="xterm-256color" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export TERMINAL="kitty"
export BROWSER="arc"
export EDITOR=nvim
export NVIM_CONFIG="$HOME/.config/nvim/init.lua"
export BAT_THEME=catppuccim_mocha.conf

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


### ----  PLUGINS  ---- ###
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### ----  FZF  ---- ###
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Use fd instead of fzf

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

### ----  ALIAS  ---- ###
alias ls='eza -lahF --git --icons=always'
alias eza='eza -lahF --git --icons=always'
alias bbd='brew bundle dump --force --describe'
alias cat='bat'
alias trail='<<<${(F)path}'


### ----  ASDF CONFIGURATION  ---- ###
. /opt/homebrew/opt/asdf/libexec/asdf.sh


### ----  SETTING THE STARSHIP PROMPT  ---- ###
eval "$(starship init zsh)"