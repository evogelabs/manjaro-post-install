#!/bin/bash

# Enable sudo without password
echo "sysadm ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/auto

# --------------------------------------------------------------------------------------------------
echo "Enable pacman colours..."
sudo sed -i".old" "s/#Color/Color/g" /etc/pacman.conf
# --------------------------------------------------------------------------------------------------

### Configure fastest mirrors
# sudo pacman-mirrors -f
# sudo pacman-mirrors --geoip
sudo pacman-mirrors --continent

### Update system
sudo pacman --verbose -Syu --noconfirm --needed

### Install yay for AUR packages
sudo pacman --verbose -S --noconfirm --needed yay

### Openssh
sudo pacman  -Syyuu --verbose --noconfirm --needed \
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
    ffmpeg

# --------------------------------------------------------------------------------------------------
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
# --------------------------------------------------------------------------------------------------
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
    filezilla

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

### Yay
# vmware-workstation \
# vmware-unlocker-bin \
yay -Sua --noconfirm \
    google-chrome \
    brave-bin \
    visual-studio-code-bin \
    acroread \
    spotify \
    microsoft-edge-stable-bin \
    anydesk-bin \
    rustdesk-bin \
    google-cloud-sdk \
    postman-bin \
    stacer-bin \
    jetbrains-toolbox


# Flatpaks
sudo flatpak install -y flathub io.dbeaver.DBeaverCommunity
sudo flatpak install flathub org.telegram.desktop
sudo flatpak install flathub com.slack.Slack
sudo flatpak install flathub io.github.mimbrero.WhatsAppDesktop
sudo flatpak install flathub re.sonny.Tangram

# Docker Desktop
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.11.1-x86_64.pkg.tar.zst
sudo pacman -U --noconfirm docker-desktop-4.11.1-x86_64.pkg.tar.zst
rm -f docker-desktop-4.11.1-x86_64.pkg.tar.zst
