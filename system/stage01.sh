#!/bin/bash

# Enable sudo without password
echo "sysadm ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/auto

# Deve-se criar esses arquivos para que o docker desktop funcione
sudo touch /etc/subuid /etc/subgid

# --------------------------------------------------------------------------------------------------
echo "Enable pacman colours..."
sudo sed -i".old" "s/#Color/Color/g" /etc/pacman.conf
# --------------------------------------------------------------------------------------------------

### Configure fastest mirrors
# sudo pacman-mirrors -f
# sudo pacman-mirrors --geoip
sudo pacman-mirrors --continent

### Update system
sudo pacman --quiet -Syu --noconfirm --needed

### Install yay for AUR packages
sudo pacman --quiet -S --noconfirm --needed yay

### Install flatpak
sudo pacman --quiet -S --noconfirm flatpak libpamac-flatpak-plugin

### Openssh
sudo pacman  -Syyuu --quiet --noconfirm --needed \
    openssh \
    vim \
    neovim \
    oh-my-zsh \
    ruby \
    rubygems \
    ruby-rdoc \
    zsh-lovers \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    powerline \
    python-psutil \
    python-pygit2 \
    powerline-vim \
    powerline-fonts \
    mcfly \
    tmux \
    lsd \
    postgresql \
    pgcli \
    go \
    base-devel \
    unzip \
    unrar \
    p7zip \
    docker \
    pigz \
    tree \
    ripgrep \
    optipng \
    jpegoptim \
    ffmpeg \
    linux515-headers
