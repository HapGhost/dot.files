#!/bin/sh
# Dependencies
sudo apt install -t unstable \
	libdconf-dev \
	libmagickcore-dev \
	libchafa-dev \
	libosmesa6-dev \
	libopencl-clang-18-dev \
	libnm-dev \
	libddcutil-dev

mkdir -p ~/Builds
cd ~/Builds
git clone https://github.com/fastfetch-cli/fastfetch.git
cd fastfetch
git submodule update --init
git checkout master
git pull
mkdir -p build
cd build
cmake ..
cmake --build . --target package
sudo dpkg -i fastfetch-linux-amd64.deb
