# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu1210guest"
  config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.ssh.forward_agent = true
  config.vm.provision :shell, :inline => "apt-get update -qq --fix-missing"
  config.vm.provision :shell, :inline => "apt-get install -qq -y rubygems"
  config.vm.provision :shell, :inline => "apt-get install -qq -y puppet"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.options = "--verbose --debug"
    puppet.manifest_file  = "init.pp"
  end
end
