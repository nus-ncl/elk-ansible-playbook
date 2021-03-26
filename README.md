# ELK Setup Playbook
--------------

A playbook used by Ansible to setup ELK both Server and Client.

## Installation
--------------

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

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
## Requirements
--------------

### For ELK_Server
```bash
2 CPU(s)
4GB Memory
Large Disk Space
```

## Usage
--------------
-  Spin up all virtual machines. (Recommend using [Vagrant](https://www.vagrantup.com/))
-  Copy public key to all virtual machines 

```bash
ssh-copy-id [username]@[virtual_machine_ip]
```

-  Check connectivity

```bash
ansible -i inventory -m ping (all pong means connectivity is all good)
```

-  Customize your inventory
-  Run run.sh to set up your ELK Stack!
-  Go to Kibana WebUI to create Logstash index


## Contributor
--------------
Huang Kang (NCL)

## License
--------------
[MIT](https://choosealicense.com/licenses/mit/)
