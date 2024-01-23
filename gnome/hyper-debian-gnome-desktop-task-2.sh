#!/bin/sh

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable gnome-shell"

sudo apt update; sudo apt install --with-new-pkgs --mark-auto -t testing perl
sudo apt install --with-new-pkgs --install-suggests -t testing \
  task-desktop \
  task-gnome-desktop \
  task-english \
  task-danish \
  task-danish-desktop
  
sudo apt install --with-new-pkgs --install-suggests --mark-auto -t experimental \
  gnome-shell \
  gnome-remote-desktop \
  gnome-shell-extension-prefs

sudo apt install --with-new-pkgs --install-suggests -t testing \
  gnome-shell-extension-manager 

sudo apt install --with-new-pkgs --install-suggests -t experimental \  
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dashtodock

echo
### enable extensions
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable tiling-assistant@leleat-on-github
gnome-extensions enable caffeine@patapon.info

echo
### flatpak & snap (app-image via Gear Lever flatpak) support
sudo apt install --mark-auto --with-new-pkgs --install-suggests -t testing\
  flatpak snapd \
  gnome-software-plugin-flatpak\
  gnome-software-plugin-snap
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo
### Misc. settings
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'
systemctl --user set-environment MOZ_ENABLE_WAYLAND=1

sudo apt autoclean; sudo apt autoremove
