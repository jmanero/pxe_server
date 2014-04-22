# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :server do |server|
    server.vm.box = "ubuntu-12.04-opscode-provisionerless"
    server.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
    server.vm.hostname = "pxe-server.local"

    # server.vm.network :private_network, ip: "192.168.33.10"
    # server.vm.provider :virtualbox do |v|
    #   v.customize ["modifyvm", :id, "--nic2", "bridged", "--bridgeadapter2",
# "en0"]
    # end
  end
end
