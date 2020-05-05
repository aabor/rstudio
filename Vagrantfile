# vi: set ft=ruby :
 
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"

    config.vm.define "docker-build" do |node|
      node.vm.hostname = "docker-build"
      node.vm.network :private_network, ip: "10.100.198.200"
      node.vm.provision :shell, inline: "sudo apt update"
      node.vm.provision :shell, inline: "sudo apt -y install apt-transport-https ca-certificates curl software-properties-common"
      node.vm.provision :docker
      node.vm.provision :docker_compose
      node.vm.provision :shell, inline: "sudo apt update"
      node.vm.provision :shell, inline: "sudo apt install -y default-jre"
      node.vm.provision :shell, inline: "sudo chmod +777 /var/run/docker.sock"
      #node.vm.provision :shell, inline: <<-SHELL
      #SHELL
    end
end