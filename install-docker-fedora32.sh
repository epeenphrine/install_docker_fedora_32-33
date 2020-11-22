#!/bin/sh
#remove conflicts
dnf remove docker-* -y ; dnf config-manager --disable docker-* -y ;
#syste prep
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" &&
#enable old cgroups
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" &&
# whitelist docker in firewall 
firewall-cmd --permanent --zone=trusted --add-interface=docker0 &&
firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade &&
# installing moby
dnf install moby-engine docker-compose &&
# systemctl enable
systemctl enable docker &&
systemctl start docker &&
# running as admin
groupadd docker;
usermod -aG docker dong;
# remove /etc/firewalld/zonees/trusted.xml
rm -f /etc/firewalld/zones/trusted.xml



