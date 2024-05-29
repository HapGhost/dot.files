#Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
#Enable:
-->
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=( 
    # other plugins...
    sudo git debian command-not-found fz
)

# User Customization
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# Completion styling
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"
# Zoxide replace cd
eval "$(zoxide init --cmd cd zsh)"
# bathelp in your .bashrc/.zshrc/*rc
alias bathelp='batcat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# User Aliases
alias cat='batcat'
alias nano='micro'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias neofetch='fastfetch'
# shs in kitty
alias s="kitty +kitten ssh"


<--
+EOF 
-->
#neofetch
/bin/fastfetch --config .config/fastfetch/config-terminal.jsonc
<--
