#!/bin/sh

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable task-desktop task-gnome-desktop gnome-shell"

sudo aptitude update; sudo aptitude install \
  task-desktop \
  task-gnome-desktop \
  task-english \
  task-danish \
  task-danish-desktop

sudo aptitude install -t experimental \
  gnome-shell \
  gnome-shell-extension-prefs \
  gnome-shell-extension-manager/unstable \
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-caffeine \
  gnome-shell-extension-dashtodock

sudo aptitude install \
  flatpak \
  gnome-software-plugin-flatpak

echo
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'

