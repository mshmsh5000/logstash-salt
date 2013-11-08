Vagrant.configure("2") do |config|
  ## Chose your base box
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
  end

  # SSH Agent forwarding
  config.ssh.forward_agent = true

  ## For masterless, mount your salt file root
  config.vm.synced_folder "salt/roots/", "/srv/"
  
  # Elasticsearch
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  
  # Apache httpd
  config.vm.network :forwarded_port, guest: 8888, host: 15001
  
  # Kibana
  config.vm.network :forwarded_port, guest: 9292, host: 15002
  
  # Assuming something will use this
  config.vm.network :forwarded_port, guest: 8080, host: 15003
  
  ## Use all the defaults:
  config.vm.provision :salt do |salt|
    # Uncomment to see Salt output
    # salt.verbose = true
    salt.minion_config = "salt/minion.conf"
    salt.run_highstate = true
  end
  config.vm.provision :shell, :inline => 'cd /vagrant && more install_complete.txt'
end
