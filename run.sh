#!/bin/bash
# deploy all (challenge_servers + monitor_server)
# ansible-playbook -i inventory deploy.yml -v 

# deploy ELK Server only
# ansible-playbook -i inventory deploy.yml -v --tags "ELK_Server"

# deploy ELK Client only
# ansible-playbook -i inventory deploy.yml -v --tags "ELK_Client"

# skip deploy ELK Server (same as upper one)
# ansible-playbook -i inventory deploy.yml -v --skip-tags "ELK_Server"
