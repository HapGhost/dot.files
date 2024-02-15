#Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
#Enable:
-->
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=( 
    # other plugins...
    sudo
)

# User Customization
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# User Aliases
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
# Zoxide replace cd
eval "$(zoxide init --cmd cd zsh)"
<--
+EOF 
-->
#neofetch
/bin/neofetch --disable theme icons term gpu cpu resolution shell --color_blocks off --backend chafa --source /usr/share/desktop-base/debian-logos/logo.svg --size 300px;
<--
