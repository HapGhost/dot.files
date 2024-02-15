#!/bin/sh
echo
### to support "stable" kernel & NVIDIA kernel load we should aim for unstable :-)
sudo aptitude update; sudo aptitude install -r -t unstable \
  btrfs-progs+ cifs-utils+ \
  btrfsd \
  software-properties-common+ build-essential+ \
  dirmngr+ kmod+ \
  pkg-config dkms sbsigntool \
  linux-image-amd64+ linux-headers-amd64 firmware-linux+ \
  libglvnd-dev
