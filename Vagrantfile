Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.34.12"
  config.vm.hostname = "act.local"
  config.vm.provision :shell, :path => "provision.sh"
  config.vm.provision :shell, :path => "perl.sh"
  config.vm.provision :shell, :path => "bin/apache.sh", :privileged => false
end
