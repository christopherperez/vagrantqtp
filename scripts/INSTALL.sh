#!/bin/bash

function consola {
   sudo apt-get install -y zsh
   curl -L http://install.ohmyz.sh | sh
   sudo chsh -s /usr/bin/zsh
}
function directorios {
   cd /mnt
   sudo mkdir Gasnatural
   sudo mkdir QTP_Scripts
   sudo mkdir y
   cd /home
   sudo mkdir qtpteam
   cd qtpteam
   sudo mkdir y_local
   sudo mkdir QTPScripts_local
   sudo mkdir Compartida
}

echo "shell script install"
sudo apt-get install --no-install-recommends ubuntu-desktop
sudo apt-get install -y openvpn
sudo apt-get install -y openssh-server
directorios
consola
exit 0
