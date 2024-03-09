#!/bin/sh
echo
echo "Doing PRE Desktop install for Rogue Debian..."
echo
### PRE Desktop install
    
sudo apt update; sudo apt upgrade -yy; sudo apt full-upgrade -yy; sudo apt autoremove -yy
echo
### copy apt config
sudo apt clean
sudo cp ../apt/hyper-debian.list /etc/apt/sources.list.d/
sudo cp ../apt/experimental.list /etc/apt/sources.list.d/
sudo cp ../apt/hyper-debian /etc/apt/preferences.d/
sudo apt update
#sudo cp ../apt/local /etc/apt/apt.conf.d/

echo
### install base tooling
sudo apt update; sudo apt install -t testing \
  zram-tools micro \
  git \
  curl \
  wget \
  aptitude \
  nala

sudo aptitude upgrade -t testing \
  apt+ \
  ca-certificates+ \
  gnupg+ \
  xz-utils+
  
echo
### do a distro upgrade
# sudo aptitude safe-upgrade -yy
sudo apt upgrade --with-new-pkgs; sudo apt full-upgrade

echo
####Enable Google BBR
curl -fsSL git.io/deploy-google-bbr.sh | bash

echo
### optimize zram swap
sudo cp ../sysctl/99-vm-zram-parameters.conf /etc/sysctl.d/

echo
# Create folders in user directory (eg. Documents,Downloads,etc.)
#sudo aptitude install xdg-user-dirs-gtk+M -yy
#xdg-user-dirs-update

echo
### full upgrade to testing/Sid & cleanup
#sudo aptitude update; sudo aptitude full-upgrade; sudo aptitude clean --purge-unused -yy
sudo apt autoclean; sudo apt autoremove  

echo
echo "*** ROGUE DEBIAN / gnome ***"
echo "For reference, here is the latest gnome-shell:"
apt policy gnome-shell
echo
echo "Can be installed with:" 
echo "$ sudo aptitude install -t experimental/unstable/testing/stable gnome-shell"

echo
echo "Done...Please reboot!"
