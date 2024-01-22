#!/bin/sh
echo
### to support "stable" kernel & NVIDIA kernel load we need unstable :-)
sudo aptitude update; sudo aptitude install -r -t unstable -yy \
  btrfs-progs+M cifs-utils+M \
  software-properties-common+M build-essential+M \
  dirmngr+M kmod+M\
  dkms sbsigntool \
  linux-image-amd64+M linux-headers-amd64 firmware-linux+M \
  libglvnd-dev
