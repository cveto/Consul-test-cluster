
Vagrant.configure("2") do |config|
  # Loop - Build 3 quite similar Virtal Machines
  (4..6).each do |i|                                                
     config.vm.boot_timeout = 600                                               # Centos tends to get stuck on boot when virtualized on "weak" hosts.
     config.vm.define "node-#{i}" do |node|
       node.vm.box="bento/centos-7.2"                                           # What server?
       node.vm.hostname = "node-#{i}-CentOS7"                                   # Name for VirtualBox Manager
       node.vm.network "private_network", ip: "10.22.0.3#{i}"                   # Consequitve IPs
       node.vm.provider :virtualbox do |vb|     
         vb.name = "node-#{i}-CentOS7"
         vb.customize ["modifyvm", :id, "--groups", "/Zemanta_Homework"]        # Group VMs under one group in VBox [needs VBox GUI restart]
         vb.customize ["modifyvm", :id, "--memory", 1024]                       # Any less and VMs complain
         vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]              # My PC is weak
       end

       # SHELL provisioning: For those things than Ansible can't hande very well.
       node.vm.provision "shell", path: "files/provisioning_script_basic.sh"
        
       # ANSIBLE provisioning: is local, since no Ansible support in Windows and running it from WSL still in beta.
       node.vm.provision "ansible_local" do |ansible|
         ansible.install_mode = "default"                           # Install Ansible on Guest from EPEL
         ansible.playbook = "ansible/playbook.yml"   
       end
     end
  end   
end

