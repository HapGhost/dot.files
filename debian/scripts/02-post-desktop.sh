#!/bin/sh
echo
echo "Doing POST Desktop install fro Rogue Debian..."
echo
### POST Desktop install/updates to latest upstream release
sudo nala update 
sudo aptitude install -r -t perl+ 
sudo aptitude install -r -t testing \
  helvum+ \
  alsa-ucm-conf+ \
  mesa-vulkan-drivers \
  mesa-vdpau-drivers \
  mesa-va-drivers+ \
  mesa-opencl-icd+ \
  libdrm2+ \
  libopengl0+ \
  steam-libs \
  steam-devices \
  vdpau-driver-all \
  mangoapp+ \
  gamescope+ \
  goverlay+ \
  libopenh264-7+ \
  dav1d+ \
  libwlroots12+ \
  qt6-wayland+ \
  libxcb1+ xwayland+ libgbm1+ \
  xdg-desktop-portal-wlr+ \
  xdg-utils+ \
  vulkan-tools+ \
  v4l2loopback-dkms+ \
  v4l2loopback-utils+ \
  libglfw3+ \
  dbus-broker+ \
  apparmor+ apparmor-profiles+ apparmor-utils+ apparmor-profiles-extra+ \
  power-profiles-daemon powermgmt-base switcheroo-control

echo
### printers
sudo apt install \
  cups \
  cups-pk-helper \
  printer-driver-brlaser \
  printer-driver-escpr \
  hplip \
  system-config-printer-common \
  system-config-printer-udev

echo
### media
sudo aptitude full-upgrade -r -t \
  ffmpeg \
  gstreamer1.0-alsa \
  gstreamer1.0-libav \
  gstreamer1.0-vaapi \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-plugins-base-apps \
  gstreamer1.0-pulseaudio \
  gstreamer1.0-pipewire \
  libavcodec-extra

echo
### enable JACK
#sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d
#sudo ldconfig

echo
### accessibility
sudo apt install \
  at-spi2-core \
  brltty \
  espeak-ng \
  mousetweaks \
  orca \
  speech-dispatcher \
  speech-dispatcher-espeak-ng

echo  
### Fonts, cursus, icons
sudo nala install -y \
  fonts-recommended \
  fonts-cantarell \
  fonts-dejavu-core \
  fonts-freefont-ttf \
  fonts-liberation \
  fonts-font-awesome \
  fonts-octicons \
  bibata-cursor-theme \
  papirus-icon-theme \
  ttf-mscorefonts-installer
echo 
./sub-scripts/nerdfonts.sh  
#echo
#./sub-scripts/system76-scheduler.sh



echo
### plymouth
sudo apt install -y \
  plymouth \
  plymouth-themes




### to-do: ### 
### custom-device-pollrates (pollrates USB - systemd service) +evhz to check pollrates
### System76 Scheduler - Done! -- reminder du install gnome-shell-extention for System76 Scheduler
### Options:
### switcheroo-control (D-Bus service to check...) --- FOR PRIME / dual gpu laptops/systems
### ADD - but not available in deb repo:
###   xwayland video bridge (AUD package available... check it out)
###   akmod-v4l2loopback + akmod-nvidia (possible done?-- to check if this is same as v4l2loopback-dkms)
###   supergfxctl (super graphics mode controller)
###   Protonup-qt (optimal from flatpack? - yup, Done) - should build from source?
###   OpenRGB (optimal from AppImage? optimal to install with flatpak Gear Lever --needs to load UDEV rules) - should build from source
###   too WINE or not too WINE? no 32-bit please ;-) go containers...


### to-do: Secure boot signing for v3 Linux kernel // suggest depreciated with use of System76 Scheduler!
#wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
#echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
#sudo aptitude update; sudo aptitude install linux-xanmod-x64v3 -y

### ffmepg et al from dev-multimedia repo -- seams to be left-behind debian-experimental
#sudo cp ../apt/deb-multimedia.list /etc/apt/sources.list.d/
#sudo apt-get update -oAcquire::AllowInsecureRepositories=true
#sudo apt-get install deb-multimedia-keyring -y --allow-unauthenticated
#sudo aptitude update; sudo aptitude full-upgrade
#sudo aptitude install -t unstable \ 
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
