#!/bin/bash
### POST Desktop install
sudo nala update; sudo aptitude install -t unstable \
  pipewire \
  pipewire-audio-client-libraries \
  pipewire-v4l2 \
  libspa-0.2-jack \
  helvum \
  gstreamer1.0-pipewire \
  alsa-ucm-conf \
  alsa-utils \
  alsa-firmware-loaders \
  gstreamer1.0-alsa \
  wireplumber \
  mesa-vulkan-drivers \
  mesa-vdpau-drivers \
  mesa-va-drivers \
  mesa-opencl-icd \
  libopengl0 \
  libgd3 \
  steam-libs \
  mangoapp \
  gamescope \
  goverlay \
  gamemode \
  ffmpeg \
  libopenh264-cisco7 \
  libwlroots12 \
  qtwayland5 qt6-wayland \
  xdg-desktop-portal-wlr \
  vulkan-tools \
  v4l2loopback-dkms \
  libglfw3 \

  
### Fonts
sudo aptitude install -t testing -y fonts-recommended fonts-font-awesome fonts-octicons 
./sub-scripts/nerd-fonts.sh  
  
### custom-device-pollrates (pollrates USB - systemd service) +evhz to check pollrates
### Options:
### switcheroo-control (D-Bus service to check...) --- FOR PRIME / dual gpu laptops/systems
### ADD - but not available in repo:
###   xwayland video bridge
###   akmod-v4l2loopback + akmod-nvidia
###   supergfxctl (super graphics mode controller)
###   Protonup-qt
###   OpenRGB


### to-do: Secure boot signing for v3 linux kernel 
#wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
#echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
#sudo aptitude update; sudo aptitude install linux-xanmod-x64v3 -y

### ffmepg et al from dev-multimedia repo
#sudo cp ../apt/deb-multimedia.list /etc/apt/sources.list.d/
#sudo apt-get update -oAcquire::AllowInsecureRepositories=true
#sudo apt-get install deb-multimedia-keyring -y
#sudo aptitude update; sudo aptitude full-upgrade -y
#sudo aptitude install -t unstable -y \ 
#  ffmpeg \
#  deadbeef \ 
#  vapoursynth \

### Other distro features From Nobara credits...:
### Webapps Manager from Linux Mint
### standalone gamescope session from ChimeraOS
### Tiling in gnome with pop-shell from Pop!OS -> tiling shell extension in gnome
### Hybryd GPU controls from asus-linux
