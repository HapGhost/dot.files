#!/bin/sh

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable task-desktop task-gnome-desktop gnome-shell"

sudo aptitude update; aptitude install -t experimental \
  task-desktop \
  task-gnome-desktop \
  task-danish \
  task-danish-desktop \
  gnome-shell \
  gnome-shell-extension-prefs \
  gnome-shell-extention-manager \
  gnome-shell-extension-tiling-assistant \
  gnome-shell-extension-caffeine \
  gnome-shell-extention-dashtodock

sudo aptitude install \
  flatpak \
  gnome-software-plugin-flatpak

gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer","kms-modifiers"]'

