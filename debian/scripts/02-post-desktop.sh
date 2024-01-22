#!/bin/sh
echo
echo "Doing POST Desktop install..."
echo
### POST Desktop install/updates to latest upstream release
sudo nala update 
sudo aptitude install -t testing perl+M 
sudo aptitude install -t unstable \
  pipewire+M \
  pipewire-audio+M \
  pipewire-pulse+M \
  pipewire-alsa+M pipewire-jack \
  pipewire-v4l2+M \
  libspa-0.2-modules+M \
  libspa-0.2-jack \
  libspa-0.2-libcamera+M \
  libspa-0.2-bluetooth+M \
  helvum \
  qjackctl \
  gstreamer1.0-pipewire+M \
  alsa-ucm-conf+M \
  alsa-utils+M \
  alsa-firmware-loaders+M \
  gstreamer1.0-alsa+M \
  wireplumber+M \
  mesa-vulkan-drivers+M \
  mesa-vdpau-drivers+M \
  mesa-va-drivers+M \
  mesa-opencl-icd+M \
  libdrm2+M \
  libopengl0+M \
  steam-libs \
  mangoapp+M \
  gamescope+M \
  goverlay \
  gamemode \
  libopenh264-7+M \
  dav1d+M \
  libwlroots12+M \
  qtwayland5+M qt6-wayland+M \
  libxcb1+M xwayland+M libgbm1+M \
  xdg-desktop-portal-wlr+M \
  xdg-utils+M \
  vulkan-tools+M \
  v4l2loopback-dkms+M \
  v4l2loopback-utils+M \
  libglfw3+M \
  dbus-broker+M \
  apparmor+M apparmor-profiles+M apparmor-utils+M apparmor-profiles-extra+M

sudo aptitude full-upgrade -t unstable \
  gstreamer1.0-libav+M \
  libavcodec60+M \
  gstreamer1.0-packagekit+M

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
###   Protonup-qt (optimal from flatpack? - yup, Done)
###   OpenRGB (optimal from AppImage? optimal to install with flatpak Gear Lever --needs to load UDEV rules)
###   too WINE or not too WINE? no 32-bit please ;-) go containers...


### to-do: Secure boot signing for v3 Linux kernel 
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
### Webapps Manager from Linux Mint (sounds cool...)
### standalone gamescope session from ChimeraOS
### Tiling in gnome with pop-shell from Pop!OS -> tiling shell extension in gnome (done)
### Hybryd GPU controls from asus-linux

echo
echo "Done...enjoy!"
