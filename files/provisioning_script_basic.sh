#!/bin/bash
# Basic provisioning

#sed -i '/PasswordAuthentication/c\PasswordAuthentication yes' /etc/ssh/sshd_config
#systemctl restart sshd.service

# Start fresh
#sudo yum -y update && yum upgrade
#sudo yum clean all
#sudo sudo -y yum update && yum upgrade

# Install
sudo yum -y install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# sudo yum -y install consul
# sudo systemctl enable consul

#sudo useradd flokili
#sudo yum -y install epel-release
#sudo yum -y install ansible

# Security? Basic

## From https://computingforgeeks.com/how-to-setup-consul-cluster-on-centos-rhel/
## Create a consul system user/group
sudo groupadd --system consul
sudo useradd -s /sbin/nologin --system -g consul consul

## Create consul data and configurations directory and set ownership to consul user
sudo mkdir -p /var/lib/consul /etc/consul.d
sudo chown -R consul:consul /var/lib/consul /etc/consul.d
sudo chmod -R 775 /var/lib/consul /etc/consul.d

# # $ sudo vi /etc/hosts   THIS PART WITH ANSIBLE

# # # Consul Cluster Servers
# # 10.22.0.12 consul-01.example.com consul-01
# # 192.168.10.11 consul-02.example.com consul-02
# # 192.168.10.12 consul-03.example.com consul-03