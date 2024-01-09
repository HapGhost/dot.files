#!/bin/bash

sudo cp ../hyper-debian.list /etc/apt/sources.d/
sudo cp ../hyper-debian /etc/apt/preferences.d/

sudo aptitude update; sudo aptitude install -t testing -y \
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
  nftables
  #ufw \
  #kmod \
  #cron \
  #netplan.io

sudo aptitude update; sudo aptitude install -t unstable -y /
  btrfs-progs cifs-utils \
  software-properties-common \
  dirmngr \
  dkms sbsigntool \
  linux-image-amd64 linux-headers-amd64
  
sudo cp ../deb-multimedia.list /etc/apt/sources.d/

sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring -y

####Enable Google BBR --- CHECK // NOT IN LXC
curl -fsSL git.io/deploy-google-bbr.sh | bash

### optimize zram swap
sudo cp ../sysctl/99-vm-zram-parameters.conf /etc/sysctl.d/

sudo aptitude safe-upgrade -y; sudo aptitude full-upgrade -y

echo "Done...Please reboot!"
