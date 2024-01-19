#!/bin/sh
echo
echo "Doing POST Desktop install..."
echo
### POST Desktop install
sudo nala update; sudo aptitude install -t unstable \
  pipewire \
  pipewire-audio \
  pipewire-pulse \
  pipewire-alsa pipewire-jack \
  pipewire-v4l2 \
  libspa-0.2-modules \
  libspa-0.2-jack \
  libspa-0.2-libcamera \
  libspa-0.2-bluetooth \
  helvum \
  qjackctl \
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
  libdrm2 \
  libopengl0 \
  libgd3 \
  steam-libs \
  mangoapp \
  gamescope \
  goverlay \
  gamemode \
  ffmpeg \
  libopenh264-7 \
  dav1d \
  libwlroots12 \
  qtwayland5 qt6-wayland \
  libxcb1 xwayland libgbm1 \
  xdg-desktop-portal-wlr \
  xdg-utils \
  vulkan-tools \
  v4l2loopback-dkms \
  libglfw3 \

echo
### enable JACK
sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d
sudo ldconfig

echo  
### Fonts, cursus, icons
sudo nala install -y \
  fonts-recommended \
  fonts-font-awesome \
  fonts-octicons \
  bibata-cursor-theme \
  papirus-icon-theme \
  ttf-mscorefonts-installer
echo 
./sub-scripts/nerdfonts.sh  
  
### to-do: ### 
### custom-device-pollrates (pollrates USB - systemd service) +evhz to check pollrates
### Options:
### switcheroo-control (D-Bus service to check...) --- FOR PRIME / dual gpu laptops/systems
### ADD - but not available in deb repo:
###   xwayland video bridge (AUD package available... check it out)
###   akmod-v4l2loopback + akmod-nvidia (possible done?-- to check if this is same as v4l2loopback-dkms)
###   supergfxctl (super graphics mode controller)
###   Protonup-qt (optimal from flatpack? - Done)
###   OpenRGB (optimal from AppImage? optimal to install with flatpak Gear Lever --needs to load UDEV rules)
###   too WINE or not too WINE?


### to-do: Secure boot signing for v3 linux kernel 
#wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
#echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
#sudo aptitude update; sudo aptitude install linux-xanmod-x64v3 -y

### ffmepg et al from dev-multimedia repo
#sudo cp ../apt/deb-multimedia.list /etc/apt/sources.list.d/
#sudo apt-get update -oAcquire::AllowInsecureRepositories=true
#sudo apt-get install deb-multimedia-keyring -y --allow-unauthenticated
#sudo aptitude update; sudo aptitude full-upgrade -y
#sudo aptitude install -t unstable -y \ 
#  ffmpeg \
#  deadbeef \ 
#  vapoursynth \

### Other distro features From Nobara credits...:
### Webapps Manager from Linux Mint
### standalone gamescope session from ChimeraOS
### Tiling in gnome with pop-shell from Pop!OS -> tiling shell extension in gnome (done)
### Hybryd GPU controls from asus-linux

echo
echo "Done...enjoy!"
