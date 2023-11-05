#!/bin/bash
echo "Setting up SSH"
eval `ssh-agent -s`  > /dev/null 2>&1
ssh-add ~/.ssh/github_id_ed25519