echo "Hello R.A.F"

# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH=/opt/homebrew/bin:$PATH

#Creat Aliases
alias ls='ls -lAFh'

# Add Locations to $PATH Variable
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"