# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

#shared settings
  config.vm.box = "micwg/ub-dev-desktop"

  # This share can be removed when building a VM image.
  config.vm.synced_folder "./exercises", "/home/vagrant/working"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      vb.name = "Python4PE"
    # Customize the amount of memory on the VM:
      vb.memory = "4096"
      vb.customize ["modifyvm", :id, "--vram", "16"]
  end

  config.vm.provision :shell, path: "provision.sh"

end