#!/bin/sh
echo
echo "Doing PRE Desktop install..."
echo
### PRE Desktop install
sudo apt update; sudo apt install -y --no-install-recommends \
    aptitude \
    nala \
    apt-transport-https \
    ca-certificates \
    apt-utils \
    nano \
    micro

echo
### copy apt config
sudo cp ../apt/*.list /etc/apt/sources.list.d/
sudo cp ../apt/hyper-debian /etc/apt/preferences.d/
sudo cp ../apt/local /etc/apt/apt.conf.d/

echo
### install base tooling
sudo nala update; sudo nala install -y \
  zram-tools micro \
  apt-transport-https \
  ca-certificates \
  apt-utils \
  git \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-theme-powerlevel9k \
  curl \
  netbase \
  wget \
  tzdata \
  locales \
  gnupg2 \
  openssl \
  openssh-server \
  xz-utils \
  dbus-broker \
  apparmor apparmor-profiles apparmor-utils apparmor-profiles-extra\
  bind9-dnsutils \
  aptitude \
  nala \
  nftables ufw
  #timeshift
  #cron \
  #netplan.io

echo
### to support "stable" kernel we need unstable :-)
sudo nala update; sudo aptitude install -t unstable -yy \
  btrfs-progs cifs-utils \
  software-properties-common build-essential \
  dirmngr \
  numactl \
  dkms sbsigntool kmod
#  linux-image-amd64 linux-headers-amd64 firmware-linux \

echo
####Enable Google BBR
curl -fsSL git.io/deploy-google-bbr.sh | bash

echo
### optimize zram swap
sudo cp ../sysctl/99-vm-zram-parameters.conf /etc/sysctl.d/

echo
### do a safe-upgrade
sudo aptitude safe-upgrade -yy

echo
# Create folders in user directory (eg. Documents,Downloads,etc.)
sudo nala install xdg-user-dirs-gtk
xdg-user-dirs-update

echo
### full upgrade & cleanup
sudo aptitude update; sudo aptitude safe-upgrade -yy; sudo aptitude full-upgrade -yy; sudo aptitude clean --purge-unused -yy

echo
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable task-desktop task-gnome-desktop gnome-shell"

echo
echo "Done...Please reboot!"
