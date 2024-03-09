#!/bin/sh

#install build dependencies
#remember to enable SRC for unstable and experimental (should be default)

sudo aptitude install -t unstable gcc g++ cmake intltool xsltproc libgtk-3-dev libxml2-utils libxml2-dev liblensfun-dev librsvg2-dev libsqlite3-dev libcurl4-gnutls-dev libjpeg-dev libtiff5-dev liblcms2-dev libjson-glib-dev libexiv2-dev libpugixml-dev
sudo apt-get build-dep -t unstable darktable

echo
#Install optional dependencies
sudo aptitude install -t unstable libgphoto2-dev libsoup2.4-dev libopenexr-dev libwebp-dev libflickcurl-dev desktop-file-utils libsecret-1-dev libgraphicsmagick1-dev libcolord-dev libcolord-gtk-dev libcups2-dev libsdl1.2-dev libsdl-image1.2-dev libgl1-mesa-dev libopenjp2-7-dev
sudo aptitude install -t unstable python3-jsonschema libgmic-dev

echo
### Usermanual:
sudo aptitude install -t unstable default-jdk yelp-tools libsaxon-java fop imagemagick docbook-xml docbook-xsl po4a

echo
#Set up source
mkdir -p ~/Builds
sudo rm -R ~/Builds/darktable; sudo rm -R /opt/darktable

cd ~/Builds
git clone https://github.com/darktable-org/darktable.git
cd darktable
git pull
git submodule update --init

echo
# Checkout release version
git checkout release-4.6.1
git submodule update --ini

echo
#Build / Compile
./build.sh --prefix /opt/darktable --build-type Release --install --sudo --  "-D CMAKE_CXX_FLAGS="-march=native""

echo
#Enable desktop menu item
sudo ln -s /opt/darktable/share/applications/org.darktable.darktable.desktop /usr/share/applications/org.darktable.darktable.desktop

echo
echo "edit exec=... add 'env GDK_BACKEND=wayland'"
echo "in /opt/darktable/share/applications/org.darktable.darktable.desktop ie:"
echo "env GDK_BACKEND=wayland /opt/darktable/bin/darktable %U"

sudo rm -R ~/Builds/darktable
