boxImage = "generic/ubuntu2004"

Vagrant.configure("2") do |config|
 
  config.vm.define "controlplane" do |cp|
    cp.vm.hostname = "controlplane"
    cp.vm.box = boxImage
    cp.vm.synced_folder ".", "/vagrant", disabled: true
    cp.vm.network "public_network",
      use_dhcp_assigned_default_route: true
    cp.vm.provider "virtualbox" do |vb|
      vb.memory = 5120
      vb.cpus = 2 
    end
  end
  config.vm.define "node01" do |n1|
    n1.vm.hostname = "node01"
    n1.vm.box = boxImage
    n1.vm.synced_folder ".", "/vagrant", disabled: true
    n1.vm.network "public_network",
      use_dhcp_assigned_default_route: true
    n1.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.groups = {
      "controlplane_nodes" => ["controlplane"],
      "worker_nodes" => ["node01"] 
    }
    ansible.verbose = "v"
  end
end
