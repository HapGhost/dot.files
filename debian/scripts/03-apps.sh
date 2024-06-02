#!/bin/sh


echo
### Install Photography and Astro software
sudo aptitude update
sudo aptitude install -t testing astro-tasks astro-education+ stellarium- multimedia-tasks multimedia-photography+ gimp- darktable- digikam- luminance-hdr-

sudo aptitude full-upgrade -t testing astro-tasks astro-education+ stellarium- multimedia-tasks multimedia-photography+ gimp- darktable- digikam- luminance-hdr-
echo
### Get Gimp, Stellarium, luminance-hdr, nextcloud-desktop from Flatpak

echo
### Build darktable from git release
./sub-scipts/darktable.sh
