#!/bin/bash
### POST Desktop install
sudo aptitude update; sudo aptitude install -t unstable -y \
  pipewire \
  wireplumber \
  mesa-vulkan-drivers \
  mesa-vdpau-drivers \
  mesa-va-drivers \
  libopengl0 \
  libgd3 \
  mungohud \
  gamescope \
  goverlay
   
### to-do: Secure boot signing
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
