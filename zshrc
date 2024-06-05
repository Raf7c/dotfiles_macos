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

### EXPORT ###
export TERM="xterm-256color" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export TERMINAL="kitty"
export BROWSER="arc"
export EDITOR=nvim
export NVIM_CONFIG="$HOME/.config/nvim/init.lua"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### ALIAS ###
alias ls='eza -lahF --git'
alias eza='eza -lahF --git'
alias bbd='brew bundle dump --force --describe'
alias cat='bat'
alias trail='<<<${(F)path}'

### PLUGINS ###
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### ASDF CONFIGURATION ###
. /opt/homebrew/opt/asdf/libexec/asdf.sh

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"