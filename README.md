# ELK Setup Playbook
--------------

A playbook used by Ansible to setup ELK both Server and Client.

## Installation
--------------

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
## Requirements
--------------

### For ELK_Server (Minimum requirements)
```bash
2 CPU(s)
4GB Memory
Large Disk Space
```

## Usage
--------------

-  Spin up all machines. (If you want to use VM, it is recommended to use [Vagrant](https://www.vagrantup.com/)). Please ignore if you already have existing machines or VMs ready.
-  Copy public key to all your machines 

  ```bash
  ssh-copy-id [username]@[machine_ip]
  ```

-  Customize your inventory file by modifying correct IP address of your machines
-  Check SSH connectivity

  ```bash
  ansible -i inventory -m ping all 
  ```
  `pong` means connectivity is all good

-  Change the permission of the `run.sh` file and select type of installtion (by default, it is installing server and client)

   ```bash
   chmod 755 run.sh
   ```

-  Run `run.sh` to set up your ELK Stack!

   ```bash
   ./run.sh
   ```

-  Go to Kibana WebUI to create Logstash index by opening this URL `http://[server_machine_ip]:5601`


## Contributor
--------------
Huang Kang (NCL)

## License
--------------
[MIT](https://choosealicense.com/licenses/mit/)
