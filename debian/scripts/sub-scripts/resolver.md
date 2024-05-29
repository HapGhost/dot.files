# Revolve installation cookbook for Debian
Based on guide and script from:
https://www.danieltufvesson.com/makeresolvedeb
Opensuse forum:
https://forums.opensuse.org/t/davinci-resolve-18-5-not-working-on-opensuse-tumbleweed/167175/11


## 1. Download DaVinci Resolve installer

mkdir ~/resolvedeb

Go to www.blackmagicdesign.com and download the official installer *.zip archive for DaVinci Resolve or DaVinci Resolve Studio for Linux and save it into a new empty directory.

## 2. Download MakeResolveDeb

Go to https://www.danieltufvesson.com/makeresolvedeb and download the latest version of the MakeResolveDeb *.tar.gz archive from this website and put it in the same directory as the Resolve installer *.zip archive.

## 3. Unpack downloaded archives

cd ~/resolvedeb
unzip DaVinci_Resolve_Studio_17.3.1_Linux.zip
tar zxvf makeresolvedeb_1.5.1_multi.sh.tar.gz

## 4. Run MakeResolveDeb

### Required packages
sudo apt install fakeroot xorriso
### Run script
./makeresolverdeb_*.sh DaVinci_Resolver_*.run

## 5. Install DEB package
sudo dpkg -i davinci-resolver-*.deb

## 6. Make sure GLIB versions or not conflicting

mkdir /opt/resolve/libs/_original_libraries
mv /opt/resolve/libs/{libgio*,libglib*,libgmodule*,libgobject*} /opt/resolve/libs/_original_libraries
