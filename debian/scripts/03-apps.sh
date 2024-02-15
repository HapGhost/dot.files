#!/bin/sh


echo
### Install Photography and Astro software
sudo aptitude update
sudo aptitude install -t testing astro-tasks astro-education+ stellarium- multimedia-tasks multimedia-photography+ gimp- darktable- digikam-

sudo aptitude full-upgrade -t unstable astro-tasks astro-education+ stellarium- multimedia-tasks multimedia-photography+ gimp- darktable- digikam-
echo
### Get Gimp, Stellarium from Flatpak

echo
### Build darktable from git release
./sub-scipts/darktable.sh
