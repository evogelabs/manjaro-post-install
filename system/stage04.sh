#!/bin/bash

### Yay
yay -Sua --noconfirm \
    google-chrome \
    brave-bin \
    visual-studio-code-bin \
    acroread \
    spotify \
    microsoft-edge-stable-bin \
    anydesk-bin \
    rustdesk-bin \
    postman-bin \
    stacer-bin \
    smartgit \
    jetbrains-toolbox \
    tilix-themes-git \
    jaspersoftstudio \
    vmware-workstation \
    vmware-unlocker-bin

sudo systemctl start vmware-networks
sudo systemctl enable vmware-networks

sudo systemctl start vmware-usbarbitrator
sudo systemctl enable vmware-usbarbitrator
