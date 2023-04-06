# Ansible

This project is intended to get a developer environment up in very few commands


```bash
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get install -y software-properties-common curl git build-essential && \
sudo apt-add-repository -y ppa:ansible/ansible && \
sudo apt-get update && \
sudo apt-get install -y curl git ansible build-essential sudo && \
sudo apt-get clean autoclean && \
sudo apt-get autoremove --yes

sudo echo 'amrik   ALL=(ALL:ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

echo 'P@ssword!' > vaultpass

ansible-galaxy collection install community.general
ansible-playbook local.yml --ask-become
```
