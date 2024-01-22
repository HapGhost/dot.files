#!/bin/sh

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable gnome-shell"

sudo aptitude update; sudo aptitude full-upgrade -t testing \
  task-desktop \
  task-gnome-desktop+M \
  task-english \
  task-danish \
  task-danish-desktop

sudo aptitude full-upgrade -t testing \
gnome+M \
gnome-shell+M

sudo aptitude install -t experimental \
  gnome-shell+M \
  gnome-shell-extension-prefs+M \
  gnome-shell-extension-manager/testing \
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dashtodock

echo
### enable extensions
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable tiling-assistant@leleat-on-github
gnome-extensions enable caffeine@patapon.info

echo
### flatpak support
sudo aptitude install \
  flatpak+M \
  gnome-software-plugin-flatpak+M; \
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  
echo
### Misc. settings
#gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'
#systemctl --user set-environment MOZ_ENABLE_WAYLAND=1
