#!/bin/bash
sudo aptitude update; sudo aptitude install -t testing \
  zram-tools micro \
  apt-transport-https \
  ca-certificates \
  apt-utils \
  software-properties-common \
  dirmngr \
  dkms \
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
  nftables \
  #ufw \
  #kmod \
  #cron \
  #netplan.io

sudo aptitude update; sudo aptitude install -t unstable btrfs-progs cifs-utils -y

sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring -y

####Enable Google BBR --- CHECK // NOT IN LXC
curl -fsSL git.io/deploy-google-bbr.sh | bash

sudo aptitude safe-upgrade -y; sudo aptitude full-upgrade -y
