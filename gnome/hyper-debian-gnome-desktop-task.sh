#!/bin/sh

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable gnome-shell"

sudo aptitude update; sudo aptitude install -r -t testing perl+M;
sudo aptitude install -r -t testing \
  task-desktop \
  task-gnome-desktop+M \
  task-english \
  task-danish \
  task-danish-desktop \
  gnome-shell/experimental+M \
  gnome-remote-desktop/experimental+M \
  gnome-shell-extension-prefs/experimental+M \
  gnome-shell-extension-manager/testing \
  gnome-shell-extension-tiling-assistant/experimental \
  gnome-shell-extension-caffeine/experimental \
  gnome-shell-extension-dashtodock/experimental

echo
### enable extensions
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable tiling-assistant@leleat-on-github
gnome-extensions enable caffeine@patapon.info

echo
### flatpak & snap (app-image via Gear Lever flatpak) support
sudo aptitude install -r -t testing\
  flatpak+M snapd+M \
  gnome-software-plugin-flatpak+M \
  gnome-software-plugin-snap+M; \
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo
### Misc. settings
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'
systemctl --user set-environment MOZ_ENABLE_WAYLAND=1

../debian/scripts/02-post-desktop.sh