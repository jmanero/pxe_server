# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2".freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :server do |server|
    server.vm.box = "ubuntu-12.04-opscode-provisionerless"
    server.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
    server.vm.hostname = "pxe-server.local"

    server.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--nic2", "bridged", "--bridgeadapter2", "en4"] ## DANGER ZONE
      # v.customize ["modifyvm", :id, "--nic2", "hostonly", "--hostonlyadapter2", "vboxnet4"] ## Safe Testing
    end

    config.omnibus.chef_version = :latest
    server.vm.provision :chef_solo do |chef|
      chef.add_recipe "pxe_server::default"
    end
  end
end
