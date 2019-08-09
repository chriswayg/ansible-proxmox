ansible-proxmox
===============

The main purpose of the role is to sets up some customized networking which works for KVM and LXC.

Also it enables the Free Proxmox 6 repository and it tries to automatically remove Proxmox 'No Valid Subscription' message on logins and even after upgrades.

Requirements
------------

Proxmox 6 already installed on the server.


Role Variables
--------------

The following are the most important variables to set up:

    proxmox_domain_name: example.org
    proxmox_main_ip:    192.168.1.200
    proxmox_gateway_ip: 192.168.1.1
    proxmox_domain_server:
      - 8.8.8.8
      - 8.8.4.4

Example Playbook
----------------

    - hosts: servers
      roles:
         - ansible-proxmox

License
-------

MIT

Author Information
------------------

Christian Wagner
