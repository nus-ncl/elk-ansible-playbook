#!/bin/bash
# deploy all (challenge_servers + monitor_server)
ansible-playbook -i inventory deploy.yml -v --tags "ELK_Client"
 #ansible-playbook -i inventory deploy.yml -v --tags "Update_ELK_Server"

# comment already set challenge_servers in inventory and then deploy the new one(s) 
# any one of two options below is fine
# ansible-playbook -i inventory deploy.yml -v --tags "challenge_servers"
# ansible-playbook -i inventory deploy.yml -v --skip-tags "monitor_server"
# ansible-playbook -i inventory deploy.yml -v --tags "docker"

# update
# ansible-playbook -i inventory deploy.yml -v --tags "update"
