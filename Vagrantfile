Vagrant.configure("2") do |config|
  config.vm.define :centos do |centos_config|
    centos_config.vm.box = "VagrantRepo"
    centos_config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140110.box"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "build/puppet/manifests"
    puppet.module_path = "build/puppet/modules"
    puppet.manifest_file  = "base.pp"
  end
  config.vm.network :forwarded_port, host: 2345, guest: 80
  config.vm.provider "virtualbox" do |v|
    v.gui = false
  end
end
