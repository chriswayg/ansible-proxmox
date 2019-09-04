ansible-proxmox
===============

The main purpose of the role is to sets up some customized networking which works for KVM and LXC.

Also it enables the Free Proxmox 6 repository and it tries to automatically remove Proxmox 'No Valid Subscription' message on logins and even after upgrades.

It configures a DHCP Server which will automatically assign IPs from 10 to 99 to new VM's on vmbr1 and redirect VM ports 22 and 80 via NAT to a high port like 30022 and 30080. Observe the syslog in Proxmox and see the assigned IPs and ports there. Check with ` iptables -t nat -L -n -v`

Requirements
------------

Proxmox 6 already installed on the server.

- check which network interfaces are seen by the server
`ip a`
`lshw -class network | grep logical`


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
