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

# User configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"
<--
+EOF 
-->
#neofetch
/bin/neofetch --disable theme icons term gpu cpu resolution shell --color_blocks off --backend chafa --source /usr/share/desktop-base/debian-logos/logo.svg --size 300px;
<--
