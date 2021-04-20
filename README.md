# ELK Setup Playbook
--------------------

A playbook used by Ansible to setup ELK both Server and Client.

## Ansible Installation
-----------------------

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

```bash
$ python -m pip install ansible
```
or

```bash
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

## Resource Requirements
------------------------

### For ELK_Server (Minimum requirements)
```bash
2 CPU(s)
4GB Memory
Large Disk Space ( > 80 GB for the Data)
```

## Installation and Configuration
---------------------------------

### Preparation

-  Spin up all machines. (If you want to use VM, it is recommended to use [Vagrant](https://www.vagrantup.com/)). Please ignore if you already have existing machines or VMs ready.
-  Copy public key to all your machines 

  ```bash
  ssh-copy-id [username]@[machine_ip]
  ```

-  Customize your inventory file by modifying correct IP address of your machines.
   At least one of the machines will be the "ELK_Server". Please ignore the "ELK_Client" if you don't want to install any client yet.
   
-  Check SSH connectivity

  ```bash
  ansible -i inventory -m ping all 
  ```
  `pong` means connectivity is all good

### Basic Installation ELK_Server and/or ELK_Client without HTTPS

-  To deploy basic ELK_Server and ELK_Client playbook use this command:

  ```bash
  ansible-playbook -i inventory deploy.yml -v --tags "step1"
  ```

-  Go to basic Kibana WebUI by opening this URL `http://[ELK_Server]:5601`


## (Optional) ELK Configuration to use HTTPS 

### Step 1: Configure Elasticsearch to use HTTP

-  To deploy elasticsearch with https in ELK_Server use this command:

  ```bash
  ansible-playbook -i inventory deploy.yml -v --tags "step2"
  ```

### Step 2: Copy the certificates and passwords

-  Copy the directory 'certs' and file 'passwords' from ELK_Server /tmp/ to the host machine /tmp/ using this command:

  ```bash
  scp -r [username]@[ELK_Server]:/tmp/certs /tmp/
  scp -r [username]@[ELK_Server]:/tmp/passwords /tmp/
  ```

### Step 3: Modify the passwords and Configure Kibana to use HTTP in the ELK_Server

- According to the `passwords` file generated in the previous step, replace the corresponding passwords at:
`roles/https_kibana_server/vars/main.yml`
`roles/https_logstash_server/vars/main.yml`
`roles/https_metricbeat_server/vars/main.yml`

-  To deploy Kibana, Logstash & Metricbeat with https in ELK_Server use this command:

  ```bash
  ansible-playbook -i inventory deploy.yml -v --tags "step3"
  ```

### Step 4: Modify the passwords and Configure Metricbeat to use HTTP in the ELK_CLient

- According to the file passwords generated in step 2, replace the corresponding passwords at:
`roles/https_metricbeat_client/vars/main.yml` 

- To deploy Metricbeat with https in the ELK_Client use this command:

  ```bash
  ansible-playbook -i inventory deploy.yml -v --tags "step4"
  ```

### Step 5: Access the Kibana Web UI with HTTPS

-  Go to secure Kibana WebUI by opening this URL `https://[ELK_Server]:5601` from your browser
-  At the the browser, input username "elastic" with password as defined in the `passwords` file generated from Step 2
-  Reboot the ELK_Server if necessary. :)


## Application Log Redirection
------------------------------
If you want to see application logs of client machine in Kibana, you should redirect them by adding these lines in /etc/rsyslog.conf

(Take ws & sio application log based on springbot as examples)

And then restart rsyslogd

```bash
$ModLoad imfile # needs to be done just once
$InputFileName /home/ws/application.log
$InputFileTag ws-application-log:
$InputFileStateFile stat-ws-application-log
$InputFileSeverity info
$InputFileFacility local1
$InputRunFileMonitor

$InputFileName /home/sio/application.log
$InputFileTag sio-application-log:
$InputFileStateFile stat-sio-application-log
$InputFileSeverity info
$InputFileFacility local2
$InputRunFileMonitor
```
## Contributor
--------------
Huang Kang (NCL)

## License
--------------
[MIT](https://choosealicense.com/licenses/mit/)
