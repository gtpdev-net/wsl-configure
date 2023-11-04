#!/bin/bash

# Docker Engine Uninstallation
# ----------------------------
# This script will uninstall the Docker Engine.
# It contains commands sourced from the offical Docker documentation: https://docs.docker.com/engine/install/ubuntu/

# Remove the services from systemd
for service in docker.service containerd.service;
do
systemctl stop $service;
systemctl disable $service;
done

# Remove the packages
for pkg in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose; 
do apt-get -y autoremove $pkg; 
done

# Clean up the disk
rm -rf /var/lib/docker
rm -rf /var/lib/containerd

# Clean up apt
rm -rf /etc/apt/keyrings/docker.gpg
rm -rf /etc/apt/sources.list.d/docker.list
apt-get update