#!/bin/sh
mkdir ~/.ssh
echo "$SSH_PRIVATE" > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
echo "$SSH_KEY" | ssh-add -p ~/.ssh/id_rsa

ansible-playbook -i $ANSIBLE_INVENTORY $ANSIBLE_PLAYBOOK -K << $SUDO_PASS