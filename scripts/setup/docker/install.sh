#!/bin/bash

# Docker Engine installation
# --------------------------
# This script will uninstall the Docker Engine and clean up the distro.
# It contains commands source from the offical Docker documentation: https://docs.docker.com/engine/install/ubuntu/
#
# Usage:
# - ensure that the script is executable
# - ensure this script is run using sudo, and not directly as root

# Remove any conflicting packages that are included by default in the distro, without confirmation
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; 
do apt-get -y autoremove $pkg; 
done

# Set up the Docker apt repository
## Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

## Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Install the latest versions of docker-ce and docker-compose
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Verify the installation
docker run hello-world

# Set Docker to run on start through systemd
systemctl enable docker.service
systemctl enable containerd.service

# Add the current user to the docker group
usermod -aG docker $USER

echo ""
echo "Docker and docker-compose have been installed"
echo "Close this session and open a new one to begin using them"