echo 'Hello from .zshrc'


# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat


# Change ZSH Options


# Create Aliases
alias ls='eza -lahF --git'
alias eza='eza -lahF --git'
alias bbd='brew bundle dump --force --describe'
alias cat='bat'
alias trail='<<<${(F)path}'

# Customize Prompt(s)


# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Use ZSH Plugins


# ...and Other Surprises


. /opt/homebrew/opt/asdf/libexec/asdf.sh
