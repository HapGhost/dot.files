#!/bin/sh
"
echo "*** ROGUE DEBIAN / gnome ***"
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable gnome-shell"

sudo apt update; sudo apt install --mark-auto -t testing perl
sudo apt upgrade --install-suggests --with-new-pkgs \
  task-desktop \
  task-gnome-desktop gnome- \
  task-english \
  task-danish \
  task-danish-desktop \
  gnome-photos+ \
  firefox+ webext-ublock-origin-firefox+ \
  gir1.2-freedesktop+ \
  gnome-shell+ \
  gnome-remote-desktop+ \
  gdm3+ \
  gnome-shell-extension-prefs+ \
  sound-juicer+ polari+ vinagre+ \
  totem+ gnome-music+ gnome-maps+ evolution- evolution-data-server+ gnome-contacts+\
  snapshot+ cheese- loupe+ \
  gnome-shell-extension-manager 
  
sudo aptitude full-upgrade -r -t unstable \
  gir1.2-freedesktop+ \
  gnome-shell+ \
  gnome-remote-desktop+ \
  gnome-photos+ \
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dashtodock \
  gnome-shell-extension-appindicator

echo
### enable extensions
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable tiling-assistant@leleat-on-github
gnome-extensions enable caffeine@patapon.info
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

echo
### flatpak & snap (app-image via Gear Lever flatpak) support
sudo aptitude install -r -t testing\
  flatpak+ snapd+ \
  gnome-software-plugin-flatpak+ \
  gnome-software-plugin-snap+
flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak --user remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo


echo
### Misc. settings
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'
#systemctl --user set-environment MOZ_ENABLE_WAYLAND=1

sudo apt autoclean; sudo apt autoremove
