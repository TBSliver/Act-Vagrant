Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.34.12"
  config.vm.hostname = "act.local"

  config.vm.synced_folder "../Act", "/act"
  config.vm.synced_folder "../conferences", "/conferences"

  config.vm.provision :shell, :path => "provision.sh"
  config.vm.provision :shell, :path => "bin/perl.sh"
  config.vm.provision :shell, :path => "bin/postgres.sh"
  config.vm.provision :shell, :path => "bin/apache.sh", :privileged => false
  config.vm.provision :shell, :path => "bin/act.sh", :privileged => false
end
