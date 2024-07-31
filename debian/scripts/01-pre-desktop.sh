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
sudo cp ../apt/0* /etc/apt/preferences.d/
sudo cp ../apt/9* /etc/apt/preferences.d/
sudo apt update
### Comment below is pseudo depreciated
### se https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1041708
### Better to set "Pin-Priority: 990" in apt/preferences.d/ for testing repos (both main and security)
#sudo cp ../apt/local /etc/apt/apt.conf.d/

echo
### install base tooling
sudo apt update; sudo apt install -t testing \
  zram-tools \
  git \
  curl \
  wget \
  aptitude \
  nala \
  dpkg-dev \
  build-essential \
  debhelper \
  zstd \
  zip \
  unzip \
  xz-utils \
  nano \
  micro \
  zsync \
  rsync \
  dialog \
  less \
  tracker \
  bash-completion \
  libnss-myhostname \
  setserial \
  systemd-sysv \
  user-setup \
  console-setup \
  sudo \
  acpi \
  policykit-1 \
  bc \
  pcmciautils \
  samba-common-bin \
  ibus \
  ibus-table \
  laptop-detect \
  efibootmgr \
  grub-efi-amd64 \
  grub-efi-amd64-bin \
  grub-efi-amd64-signed \
  shim-signed \
  shim-helpers-amd64-signed \
  uidmap \
  minisign

sudo aptitude upgrade -t testing \
  apt \
  apt-show-versions \
  ca-certificates \
  gpg \
  gpg-agent \
  dirmngr \
  ca-certificates \
  openssh-server \
  spice-vdagent
  
echo
### do a distro upgrade
# sudo aptitude safe-upgrade -yy
sudo apt upgrade --with-new-pkgs; sudo apt full-upgrade -t testing

echo
####Enable Google BBR
curl -fsSL git.io/deploy-google-bbr.sh | bash

echo
### optimize zram swap
sudo cp ../sysctl/99-vm-zram-parameters.conf /etc/sysctl.d/

echo
### enable amd_pstate=guided
sudo cp ../kernel/amd-pstate.cfg /etc/default/grub.d/
sudo update-grub

echo
### firmware
sudo apt install \
  firmware-linux \
  firmware-linux-nonfree \
  firmware-linux-free \
  firmware-iwlwifi \
  firmware-realtek \
  firmware-atheros \
  firmware-libertas \
  intel-microcode \
  amd64-microcode \
  b43-fwcutter \
  firmware-b43-installer \
  firmware-brcm80211 \
  firmware-sof-signed

echo 
### input and locales
sudo apt install \
  locales \
  kmod \
  xkb-data \
  im-config \
  console-setup

echo
### filesystem
sudo apt install \
  exfatprogs \
  btrfs-progs \
  dosfstools \
  gvfs-backends \
  ntfs-3g \
  nfs-common \
  gvfs-fuse \
  libfuse3-3 \
  lvm2

echo
### sound
sudo apt install \
  pipewire-pulse \
  pipewire-alsa \
  wireplumber \
  alsa-utils \
  alsa-firmware-loaders


echo
# Create folders in user directory (eg. Documents,Downloads,etc.)
sudo aptitude install -yy \
  xdg-utils \
  xdg-user-dirs \
  xdg-user-dirs-gtk 
xdg-user-dirs-update

echo
### network
sudo apt install \
  network-manager \
  network-manager-config-connectivity-debian \
  network-manager-openvpn \
  network-manager-fortisslvpn \
  network-manager-l2tp \
  network-manager-openconnect \
  network-manager-ssh \
  network-manager-vpnc \
  modemmanager \
  wpasupplicant \
  wireless-tools \
  wireguard \
  avahi-autoipd \
  avahi-daemon \
  rfkill \
  bluez \
  libspa-0.2-bluetooth \
  libnss-mdns \
  libproxy1-plugin-networkmanager \
  ntp \
  iputils-ping

echo
### modules
sudo apt update \
  dkms \
  bolt \
  inputattach \
  iucode-tool \
  cryptsetup-initramfs \
  acpi-call-dkms \
  libsasl2-modules \

 echo
 ### fwupd
 sudo apt install \
  fwupd \
  fwupd-amd64-signed

 echo
 ### fingerprint
 # sudo apt install \
  # fprintd \
  # libpam-fprintd

echo
### kernel
sudo apt install \
  linux-image-amd64 \
  linux-headers-amd64

echo
### manpages
sudo apt install \
  manpages \
  manpages-posix


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
