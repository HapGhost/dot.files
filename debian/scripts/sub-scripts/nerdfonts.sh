#!/bin/bash
mkdir -p ~/.local/share/fonts

cd /tmp
fonts=( 
"Hack"  
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.zip
	unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache
