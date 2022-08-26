#!/bin/bash

chsh -s $(which zsh)

# Enable sudo without password
echo "sysadm ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/auto
echo "Enable pacman colours..."
sudo sed -i".old" "s/#Color/Color/g" /etc/pacman.conf
sudo pacman-mirrors --continent
sudo pacman --quiet -Syu --noconfirm --needed

sudo pacman --quiet -Syyuu --noconfirm --needed \
    yay \
    flatpak \
    libpamac-flatpak-plugin \
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
    unzip \
    unrar \
    p7zip \
    pigz \
    tree \
    ripgrep \
    pgcli \
    go
