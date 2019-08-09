#!/bin/bash
# automatic removal of Proxmox subscription reminder during upgrades
# - tested with Proxmox
#
# exit on error
set -e

# Since we are watching the whole directory, we need to check for the correct file
if [ "$1" == "proxmoxlib.js.dpkg-tmp" ]; then
    echo "$(date +%Y-%m-%d_%H:%M) proxmoxlib.js has been upgraded - patching file" >> /var/log/incron.log

    # wait a bit until the file has its permanent name
    sleep 15
    # patch the files - tested with Proxmox 4.2
    #Proxmox4&5# cp /usr/share/pve-manager/ext6/pvemanagerlib.js /usr/share/pve-manager/ext6/pvemanagerlib.js.bak
    #Proxmox4&5# sed -i -r -e "s/if \(data.status !== 'Active'\) \{/if (false) {/" /usr/share/pve-manager/ext6/pvemanagerlib.js >>/var/log/incron.log 2>&1
    #Proxmox4&5# sed -i -r -e "s/You do not have a valid subscription for this server/This server is receiving updates from the Proxmox VE No-Subscription Repository/" /usr/share/pve-manager/ext6/pvemanagerlib.js >>/var/log/incron.log 2>&1
    #Proxmox4&5# sed -i -r -e "s/No valid subscription/Community Edition/" /usr/share/pve-manager/ext6/pvemanagerlib.js >>/var/log/incron.log 2>&1

    # patch the files
    cp /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.bak
    sed -i "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
    systemctl restart pveproxy.service

    # log  the changes
    diff /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.bak /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js >> /var/log/incron.log
fi
