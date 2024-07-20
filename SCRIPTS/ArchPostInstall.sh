#!/bin/bash

# Installing yay
sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay.git && cd yay
yes | makepkg -si

#Copying my configs for later use
cd /home/$USER/Downloads/
mkdir configs
cd configs
curl -o .bashrc https://raw.githubusercontent.com/called-Ishan/HORIZON/main/CONFIGS/bashrc
curl -o 90210.theme.sh https://raw.githubusercontent.com/called-Ishan/HORIZON/main/CONFIGS/90210.theme.sh
curl -o .nanorc https://raw.githubusercontent.com/called-Ishan/HORIZON/main/CONFIGS/nanorc
curl -o user.js https://raw.githubusercontent.com/called-Ishan/HORIZON/main/CONFIGS/firefox.user.js

sudo chmod +x /home/$USER/Downloads/postinstall-part2.sh

#Editing pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo sed -i '/ParallelDownloads/s/^#/ILoveCandy\n/g' /etc/pacman.conf
sudo sed -i '/VerbosePkgLists/s/^#//g' /etc/pacman.conf

# Configuring bash
cp /home/$USER/Downloads/configs/.bashrc /home/$USER

#Configuring ohmybash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
cp /home/$USER/Downloads/configs/90210.theme.sh /home/$USER/.oh-my-bash/themes/90210/

# Configuring nano
cp /home/$USER/Downloads/configs/.nanorc /home/$USER

# Saving user.js for firefox
cp /home/$USER/Downloads/configs/user.js /home/$USER/Downloads

# Removing temp files
rm -rf /home/$USER/Downloads/configs


# Installing softwares
yes | yay
sudo pacman -S --noconfirm kvantum
sudo pacman -S --noconfirm archlinux-tweak-tool-git
sudo pacman -S --noconfirm gnome-disk-utilit
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm kdeconnect
sudo pacman -S --noconfirm thorium-browser-bin
sudo pacman -S --noconfirm youtube-music-bin