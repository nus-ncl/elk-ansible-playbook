#!/bin/bash

# step1: 
# Deploy basic ELK_Server and ELK_Client without https
# command:
# ansible-playbook -i inventory deploy.yml -v --tags "step1"

# step2: 
# Deploy ELK_Server elasticsearch with https
# command:
# ansible-playbook -i inventory deploy.yml -v --tags "step2"

# And then copy the directory 'certs' and file 'passwords' from ELK_Server /tmp/ to the host machine /tmp/
# command:
# scp -r vagrant@[ELK_Server_IP]:/tmp/certs /tmp/
# scp -r vagrant@[ELK_Server_IP]:/tmp/passwords /tmp/

# step3: 
# According to the file passwords generated in last step
# replace the corresponding passwords at:
# roles/https_kibana_server/vars/main.yml
# roles/https_logstash_server/vars/main.yml
# roles/https_metricbeat_server/vars/main.yml
# Now, deploy ELK_Server kibana & logstash & metricbeat with https
# command:
# ansible-playbook -i inventory deploy.yml -v --tags "step3"

# step4: 
# According to the file passwords generated in step2
# replace the corresponding passwords at:
# roles/https_metricbeat_client/vars/main.yml 
# Now, deploy basic ELK_Client metricbeat with https
# command:
# ansible-playbook -i inventory deploy.yml -v --tags "step4"

# step5:
# Everything is done. Make ssh local forwarding to access the kibana web ui
# command:
# ssh -fNT -L 5601:localhost:5601 vagrant@[ELk_Server_IP]
# visit "https://localhost:5601" at the host machine browser and input elastic & elastic_password to access
# reboot the ELK_Server if necessary. :)
