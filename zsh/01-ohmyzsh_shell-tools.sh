#!/bin/sh

echo
# install modern shell tolls, ZSH and plugins
sudo nala update; sudo aptitude -t unstable install curl git stow neofetch btop nala bat lsd zoxide fzf inxi \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-theme-powerlevel9k

echo
# Run script to install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
esac

# Set paths PATH=/home/hapghost/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
HOME=/home/hapghost
LANG=en_DK.UTF-8
LANGUAGE=en_US:en
LOGNAME=hapghost
PATH=/home/hapghost/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
SHELL=/usr/bin/bash
USER=hapghost
XDG_DATA_DIRS=/usr/share/gnome:/home/hapghost/.local/share/flatpak/exports/share:/var/lib/flat>
XDG_RUNTIME_DIR=/run/user/1000
GTK_MODULES=gail:atk-bridge
QT_ACCESSIBILITY=1
GBM_BACKEND=nvidia-drm
__GLX_VENDOR_LIBRARY_NAME=nvidia
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
DESKTOP_SESSION=gnome
DISPLAY=:0
GDMSESSION=gnome
GDM_LANG=en_DK.UTF-8
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GNOME_SETUP_DISPLAY=:1
IM_CONFIG_PHASE=1
PWD=/home/hapghost
QT_IM_MODULE=ibus
SESSION_MANAGER=local/GhostStation:@/tmp/.ICE-unix/1757,unix/GhostStation:/tmp/.ICE-unix/1757
SHLVL=0
SSH_AGENT_LAUNCHER=openssh
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
USERNAME=hapghost
WAYLAND_DISPLAY=wayland-0
XAUTHORITY=/run/user/1000/.mutter-Xwaylandauth.BL3JN2
XDG_CURRENT_DESKTOP=GNOME
XDG_MENU_PREFIX=gnome-
XDG_SESSION_CLASS=user
XDG_SESSION_DESKTOP=gnome
XDG_SESSION_TYPE=wayland
XMODIFIERS=@im=ibus
_=/usr/bin/gnome-session
