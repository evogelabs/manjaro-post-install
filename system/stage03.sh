#!/bin/bash

#### Pacotes de fontes
# ttf-dejavu \
# ttf-liberation \
# adobe-source-sans-pro-fonts \
# ttf-droid \
# ttf-anonymous-pro \
# ttf-bitstream-vera \
# cantarell-fonts \
# ttf-hackgen \
# noto-fonts-cjk \
sudo pacman -Syyuu --noconfirm \
    ttf-ubuntu-font-family \
    ttf-fira-code \
    noto-fonts \
    noto-fonts-extra \
    noto-fonts-emoji \
    ttf-roboto \
    ttf-font-awesome \
    ttf-roboto-mono

yay -Sua --noconfirm \
    ttf-ms-fonts \
    ttf-mac-fonts 
# --------------------------------------------------------------------------------------------------
### Install topgrade
yay -Sua --noconfirm topgrade

### Ferramentas
sudo pacman -Syyuu --noconfirm \
    chromium \
    gimp \
    inkscape \
    libreoffice-fresh \
    libreoffice-fresh-pt-br \
    flameshot \
    notepadqq \
    nextcloud-client \
    file-roller \
    vlc \
    filezilla \
    dbeaver \
    dbeaver-plugin-apache-poi \
    dbeaver-plugin-batik \
    dbeaver-plugin-office \
    dbeaver-plugin-svg-format \
    github-cli

### Node
sudo pacman -Syyuu --noconfirm \
    nodejs-lts-gallium \
    npm \
    yarn

### Outros
sudo pacman -Syyuu --noconfirm \
    bleachbit \
    meld \
    guake \
    xclip \
    tilix \
    audacity \
    terminator \
    gnome-tweak-tool
