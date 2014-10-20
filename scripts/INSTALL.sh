#!/bin/bash
as_qtpteam="sudo -u qtpteam -H bash -l -c"

function consola {
   apt-get install -y zsh curl
   $as_qtpteam curl -L http://install.ohmyz.sh | sh
   $as_qtpteam chsh -s /usr/bin/zsh
}
function directorios {
   cd /mnt
   mkdir Gasnatural
   chmod ug+rwx Gasnatural
   mkdir QTP_Scripts
   chmod ug+rwx QTP_Scripts
   mkdir y
   chmod ug+rwx y
   mkdir QTP_Scripts_Minoristas
   chmod ug+rwx QTP_Scripts_Minoristas
   mkdir y_Minoristas
   chmod ug+rwx y_Minoristas
   cd /home
   mkdir qtpteam
   cd qtpteam
   mkdir Escritorio
   cd Escritorio
   mkdir y_local
   chmod ug+rwx y_local
   mkdir QTPScripts_local
   chmod ug+rwx QTPScripts_local
   mkdir Compartida
   chmod ug+rwx Compartida
}

function samba {
   apt-get install -y samba smbclient
   cd /home/vagrant/myapp/scripts
   sudo rm /etc/samba/smb.conf
   cp smb.conf /etc/samba/
   echo "recuerda crear el usario samba para qtpteam"
   echo "###################### sudo smbpasswd -a qtpteam"
   echo "###################### sudo smbpasswd -e qtpteam"
}

function escritorio {
   apt-get install -y gnome-core xfce4 firefox
   #sudo apt-get install -y xubuntu-desktop
   apt-get install -y vnc4server
   cd /home/vagrant/myapp/scripts
   $as_qtpteam cp xtartup ~/.vnc/
}

echo "shell script install"
apt-get install -y openvpn
apt-get install -y openssh-server gedit nano vim
echo "#########################################"
echo "CREANDO DIRECTORIOS NECESARIOS PARA SAMBA"
echo "#########################################"
directorios
echo "#########################################"
echo "          INSTALANDO OH MY ZSH"
echo "#########################################"
consola
echo "#########################################"
echo "           CONFIGURANDO SAMBA"
echo "#########################################"
samba
echo "#########################################"
echo "        INSTALANDO ENTORNO GRÁFICO"
echo "#########################################"
escritorio
exit 0
