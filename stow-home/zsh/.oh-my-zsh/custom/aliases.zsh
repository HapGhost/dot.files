alias cat='batcat'
alias nano='micro'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
# shs in kitty
alias s="kitty +kitten ssh"
# bathelp in your .bashrc/.zshrc/*rc
alias bathelp='batcat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
