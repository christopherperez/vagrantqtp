# A Virtual Machine for QTP purposes - UBUNTU 14.04.1

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant 1.6.5](http://vagrantup.com) 

## How To Build The Virtual Machine

    git clone https://github.com/christopherperez/vagrantqtp.git
    cd vagrantqtp
    git submodule init
    git submodule update
    vagrant up

wait

vagrant ssh 
or
ssh vagrant@192.168.40.100



## What's In The Box

* Git

* MySQL with 'default' ass root password | with puppet

* System packets: autoconf build-essential

* Desktop enviroment

* Script for create dirs and other staff


## Virtual Machine Management

    host $ vagrant suspend

    host $ vagrant resume

    host $ vagrant halt

    host $ vagrant up

    host $ vagrant status

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://docs.vagrantup.com/v2/) for more information on Vagrant.


## Tested on

* Ubuntu 12.04 hashicorp/precise32 virtualbox
