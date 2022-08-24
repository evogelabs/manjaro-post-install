#!/bin/bash

# Docker Desktop
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.11.1-x86_64.pkg.tar.zst
sudo pacman -U --noconfirm docker-desktop-4.11.1-x86_64.pkg.tar.zst
rm -f docker-desktop-4.11.1-x86_64.pkg.tar.zst
