# -*- mode: ruby -*-
# vi: set ft=ruby :

# Not available on 12.04 official repositories
# apt-get install -y libqt5webkit5-dev

#$dependency = <<DEPENDENCY
#DEPENDENCY

VAGRANT_COMMAND = ARGV[0]

Vagrant.configure('2') do |config|
  # To use ubuntu 12.04 uncomment
  #config.vm.box      = 'hashicorp/precise32'
  #config.vm.box_url  = 'https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/1/providers/virtualbox.box'

  config.vm.box      = 'ubuntu/trusty32'
  config.vm.hostname = 'qtpteam'


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.40.100"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network", bridge: 'eth0'
  
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true
  
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  #To allow remote desktop
  config.vm.network :forwarded_port, guest: 5900, host: 5901


  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     # # Don't boot with headless mode
     vb.gui = true
     #
     # # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end


  #Added initial commands
  #config.vm.provision "shell", inline: $dependency, privileged: true
   
  # Autoinstall vguest of virtualbox
  # https://github.com/dotless-de/vagrant-vbguest

  # we will try to autodetect this path. 
  # However, if we cannot or you have a special one you may pass it like:
  # config.vbguest.iso_path = "#{ENV['HOME']}/Downloads/VBoxGuestAdditions.iso"
  # or
  # config.vbguest.iso_path = "http://company.server/VirtualBox/%{version}/VBoxGuestAdditions.iso"
  config.vbguest.iso_path = "http://download.virtualbox.org/virtualbox/4.3.10/VBoxGuestAdditions_4.3.10.iso"
  
  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = false

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = false
  

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'	
    puppet.options = ['--verbose']
  end

  #Install rbenv with bash script.
  config.vm.provision :shell do |shell|
     shell.path = "scripts/INSTALL.sh"
     config.vm.synced_folder '.', '/home/vagrant/myapp'
  end


end
