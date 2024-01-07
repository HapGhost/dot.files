#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo aptitude update; sudo aptitude -t unstable install neofetch btop nala bat lsd -y
