$script = <<-SCRIPT

#On ssh go to /vagrant
echo "cd /vagrant" >> /home/vagrant/.profile
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.hostname = "kubeadmin"
  config.vm.provision "shell", inline: $script

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "2"]
    v.gui = false
  end
end
