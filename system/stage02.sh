#!/bin/bash

# Enable Trim for SSD - optimize performance of ssd-drive
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# Enable SSH
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# Enable Docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Enable File Limits
echo | sudo tee -a /etc/security/limits.conf
echo "*         hard    nofile      500000" | sudo tee -a /etc/security/limits.conf
echo "*         soft    nofile      500000" | sudo tee -a /etc/security/limits.conf

echo fs.nr_open=2147483584 | sudo tee -a /etc/sysctl.d/40-max-user-watches.conf
echo fs.file-max=100000 | sudo tee -a /etc/sysctl.d/40-max-user-watches.conf
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.d/40-max-user-watches.conf

# Reduce swap use
echo "vm.swappiness=1" | sudo tee /etc/sysctl.d/100-swappiness.conf

# Disable ipv6
echo "net.ipv6.conf.all.disable_ipv6=1" | sudo tee /etc/sysctl.d/40-ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6=1" | sudo tee -a /etc/sysctl.d/40-ipv6.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" | sudo tee -a /etc/sysctl.d/40-ipv6.conf
