echo "Hello R.A.F"


# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_CASK_OPTS="--no-quarantine"


# Change ZSH Options


# Create Aliases
#alias ls='ls -lAFh'
alias ls='eza -lahF --git'
alias exa='eza -lahF --git'

# Customize Prompt(s)


# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# Use ZSH Plugins


# ...and Other Surprises