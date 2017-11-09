# -*- mode: ruby -*-
# vi: set ft=ruby :

# PACS

# WARNING: Could be neccesary to Install Extension Pack https://www.virtualbox.org/wiki/Download_Old_Builds_5_1

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
   config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    end
  # Open ports
   config.vm.network "forwarded_port", guest: 8080, host: 8080     # PACS web interface

  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  # Provision VM only once
  config.vm.provision :shell, :path => "provision.sh"
end