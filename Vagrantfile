# -*- mode: ruby -*-
# vi: set ft=ruby :

def require_plugin(name, version='>= 0')
  unless Vagrant.has_plugin?(name, version)
    # This displays the error twice. I'm not sure how to fix that. I don't want to
  # use raise because that throws up a huge stack-trace which is overwhelming.
    abort "'#{name} is not installed!"
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb, override|
    require_plugin 'vagrant-vbguest'

    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  require_plugin 'vagrant-librarian-chef'
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w( cookbooks site-cookbooks )
    chef.roles_path = %w( site-roles )

    chef.add_role 'datastore'
    chef.add_role 'webserver'
  end
end
