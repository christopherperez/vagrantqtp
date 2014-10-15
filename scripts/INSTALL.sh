#!/bin/bash

function consola {
   sudo apt-get install -y zsh
   curl -L http://install.ohmyz.sh | sh
   sudo chsh -s /usr/bin/zsh
   sudo su qtpteam
   chsh -s /usr/bin/zsh
}
function directorios {
   cd /mnt
   sudo mkdir Gasnatural
   sudo chmod ug+rwx Gasnatural
   sudo mkdir QTP_Scripts
   sudo chmod ug+rwx QTP_Scripts
   sudo mkdir y
   sudo chmod ug+rwx y
   cd /home
   sudo mkdir qtpteam
   cd qtpteam
   sudo mkdir Escritorio
   cd Escritorio
   sudo mkdir y_local
   sudo chmod ug+rwx y_local
   sudo mkdir QTPScripts_local
   sudo chmod ug+rwx QTPScripts_local
   sudo mkdir Compartida
   sudo chmod ug+rwx Compartida
}

function samba {
   sudo apt-get install -y samba smbclient
   cd /home/vagrant/myapp/scripts
   sudo rm /etc/samba/smb.conf
   cp smb.conf /etc/samba/
   echo "recuerda crear el usario samba para qtpteam"
   echo "###################### sudo smbpasswd -a qtpteam"
   echo "###################### sudo smbpasswd -e qtpteam"
}

echo "shell script install"
sudo apt-get install -y ubuntu-desktop
sudo apt-get install -y openvpn
sudo apt-get install -y openssh-server
directorios
consola
samba
exit 0
