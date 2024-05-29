#!/bin/sh
MAKEMKV_VERSION=1.17.7
sudo apt-get install -t unstable build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev
mkdir -p ~/Builds/makemkv
cd ~/Builds/makemkv
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg  
cd ffmpeg
git pull
git submodule update --init
#git checkout release/7.0
./configure --prefix=/tmp/ffmpeg --enable-static --disable-shared --enable-pic --disable-x86asm
make install -- '-march=native -O3' 
cd ..
mkdir -p /tmp/makemkv
wget https://www.makemkv.com/download/makemkv-bin-$MAKEMKV_VERSION.tar.gz -O /tmp/makemkv/makemkv-bin.tar.gz   
wget https://www.makemkv.com/download/makemkv-oss-$MAKEMKV_VERSION.tar.gz -O /tmp/makemkv/makemkv-oss.tar.gz
tar zxvf /tmp/makemkv/makemkv-bin.tar.gz
tar zxvf /tmp/makemkv/makemkv-oss.tar.gz
cd makemkv-oss-$MAKEMKV_VERSION
PKG_CONFIG_PATH=/tmp/ffmpeg/lib/pkgconfig ./configure
make -- '-march=native -O3' 
sudo make install
cd ..
cd makemkv-bin-$MAKEMKV_VERSION
make -- '-march=native -O3'
sudo make install
rm -rf /tmp/ffmpeg /tmp/makemkv
