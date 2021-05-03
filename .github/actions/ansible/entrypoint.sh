#!/bin/sh
mkdir ~/.ssh
echo "$SSH_PRIVATE" > ~/.ssh/ansible
chmod 0600 ~/.ssh/ansible
eval `ssh-agent -s`
echo "$SSH_KEY" | ssh-add ~/.ssh/ansible

ansible-galaxy install cloudalchemy.node_exporter

echo "$SUDO_PASS" | ansible-playbook -i $ANSIBLE_INVENTORY $ANSIBLE_PLAYBOOK -K