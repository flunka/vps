#!/bin/sh
#Set ssh private key
mkdir ~/.ssh
echo "$SSH_PRIVATE" > ~/.ssh/ansible
chmod 0600 ~/.ssh/ansible
eval `ssh-agent -s`
echo "$SSH_KEY" | ssh-add ~/.ssh/ansible
# Set known hosts
mkdir /root/.ssh
echo "$SSH_KNOWN_HOSTS" > /root/.ssh/known_hosts
chmod 0600 /root/.ssh/known_hosts
# Install node exporter role
ansible-galaxy install cloudalchemy.node_exporter
# Run playbook
echo "$SUDO_PASS" | ansible-playbook -i $ANSIBLE_INVENTORY $ANSIBLE_PLAYBOOK -K