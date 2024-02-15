#!/bin/sh

#install build dependencies
#remember to enable SRC for unstable and experimental (should be default)

sudo aptitude install -t unstable cargo+ clang+ debhelper+ just+ libclang-dev+ libpipewire-0.3-dev+ pkg-config+ rustc+

echo
#Install suggested
sudo aptitude install -t unstable bpfcc-tools+

echo
#Set up source
mkdir -p ~/Builds
cd ~/Builds
git clone https://github.com/pop-os/system76-scheduler.git
cd system76-scheduler/
git pull
git submodule update --init

echo
# Checkout (un-comment line below) release version or just use Master
# git checkout 2.0.1

echo
#Build
just execsnoop=$(which execsnoop-bpfcc) build-release
sudo just sysconfdir=/usr/share install

echo
#Enable systemd service
sudo systemctl enable --now com.system76.Scheduler.service

echo
#Clone gnome extension from source --- this is a pull request for Gnome 45 support (https://github.com/mjakeman/s76-scheduler-plugin/pull/9)
#Fedora copr reference: https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/
#Original only Gnome 44 support: 
# git clone https://github.com/mjakeman/s76-scheduler-plugin \
  # ~/.local/share/gnome-shell/extensions/s76-scheduler@mattjakeman.com
git clone https://github.com/nhubaotruong/s76-scheduler-plugin.git \
  ~/.local/share/gnome-shell/extensions/s76-scheduler@mattjakeman.com

echo
### enable extensions
gnome-extensions enable s76-scheduler@mattjakeman.com

echo
#done reboot
