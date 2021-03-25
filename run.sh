#!/bin/bash
# deploy all (challenge_servers + monitor_server)
ansible-playbook -i hosts deploy.yml -v --skip-tags "update"

# comment already set challenge_servers in hosts and then deploy the new one(s) 
# any one of two options below is fine
# ansible-playbook -i hosts deploy.yml -v --tags "challenge_servers"
# ansible-playbook -i hosts deploy.yml -v --skip-tags "monitor_server"
# ansible-playbook -i hosts deploy.yml -v --tags "docker"

# update
# ansible-playbook -i hosts deploy.yml -v --tags "update"
