# ELK Setup Playbook
=========
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
    '''bash
    at least:
    2 CPU
    4GB Memory
    Large disk space
    '''

## Usage
--------------
1. Spin up all virtual machines. (Recommend using [Vagrant](https://www.vagrantup.com/))
2. Copy public key to all virtual machines 
    '''bash
    ssh-copy-id [username]@[virtual_machine_ip]
    '''
3. Check connectivity
    '''bash
    ansible -i inventory -m ping (all pong means connectivity is all good)
    '''
4. Customize your inventory
5. Run run.sh to set up your ELK Stack!
6. Go to Kibana WebUI to create Logstash index


## Contributor
--------------
Huang Kang (NCL)

## License
--------------
[MIT](https://choosealicense.com/licenses/mit/)
