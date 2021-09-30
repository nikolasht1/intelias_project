# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: <<-SHELL
      apt-get update -y
      echo "10.0.0.104  bento-test" >> /etc/hosts
  
  SHELL
  config.vm.provision :shell, path: "C:/intelias/setings_machine.sh"
  
  config.vm.define "bento" do |bento|
      bento.vm.box = "bento/ubuntu-18.04"
      bento.vm.hostname = "bento-test"
      bento.vm.network "private_network", ip: "10.0.0.104"
      bento.vm.provider "virtualbox" do |vb|
          vb.memory = 4096
          vb.cpus = 2
    end
  end  

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
