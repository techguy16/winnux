echo "
░██╗░░░░░░░██╗██╗███╗░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗
░██║░░██╗░░██║██║████╗░██║████╗░██║██║░░░██║╚██╗██╔╝
░╚██╗████╗██╔╝██║██╔██╗██║██╔██╗██║██║░░░██║░╚███╔╝░
░░████╔═████║░██║██║╚████║██║╚████║██║░░░██║░██╔██╗░
░░╚██╔╝░╚██╔╝░██║██║░╚███║██║░╚███║╚██████╔╝██╔╝╚██╗
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝
"
echo "Winnux 1.1 - 14th July 2022"
echo "Made by techguy16"
echo " "
echo "Make your Linux PC look like Windows 10."
sleep 5

# Update Packages
sudo apt update

# Install WGet, cURL & Git
sudo apt install wget curl git -y

# Download Required Items
wget https://png.pngitem.com/pimgs/s/49-490830_qt-release-qt-windows-10-logo-white-transparent.png
wget https://wallpaperaccess.com/full/2382371.jpg ## 14.07.2022 - Changed wallpaper link
wget https://github.com/B00merang-Project/Windows-10/archive/refs/heads/master.zip
mv Windows-10-master.zip win10theme.zip
wget https://github.com/yeyushengfan258/We10X-icon-theme/archive/refs/heads/master.zip
mv We10X-icon-theme-master.zip win10icons.zip
wget https://download.onlyoffice.com/install/desktop/editors/linux/old/onlyoffice-desktopeditors_amd64.deb
wget https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz

# Add required keys
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

# Add New Repositories
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa

# Remove Unrequired Stuff 
# sudo apt remove firefox
# sudo apt remove mint-artwork-gnome
# sudo apt remove mint-artwork-kde
# sudo apt remove mint-artwork-mate
# sudo apt remove mint-artwork-xfce
# sudo apt remove mint-backgrounds-maya
# sudo apt remove mint-backgrounds-nadia
# sudo apt remove mint-backgrounds-olivia
# sudo apt remove mint-backgrounds-petra
# sudo apt remove mint-backgrounds-qiana
# sudo apt remove mint-backgrounds-rafaela
# sudo apt remove mint-backgrounds-rebecca
# sudo apt remove mint-backgrounds-retro
# sudo apt remove mint-backgrounds-rosa
# sudo apt remove mint-backgrounds-sarah
# sudo apt remove mint-backgrounds-xfce
# sudo apt remove mint-common
# sudo apt remove mint-info-cinnamon
# sudo apt remove mint-info-kde
# sudo apt remove mint-info-mate
# sudo apt remove mint-info-xfce
sudo apt remove xed -y

# Apply themes
u="$USER"
cd /home/$u/
gsettings set org.gnome.desktop.background picture-uri file:////home/$u/img0_3840x2160-1920x1024.jpg
unzip win10theme.zip
unzip win10icons.zip
mkdir .themes
mkdir .icons
cd We10X-icon-theme-master
mv src We10X
cp We10X /home/$u/.icons
cd ..
cp Windows-10-master /home/$u/.themes
gsettings set org.gnome.desktop.interface gtk-theme "Windows-10-master"
gsettings set org.gnome.desktop.interface icon-theme 'We10X'
tar xvf 155025-win8.tar.gz
sudo mv win8 /home/$u/.icons -v

# Fix Architecture Problems (with Wine)
sudo dpkg --add-architecture i386 

# Install Apps
sudo apt update
sudo apt install software-properties-common apt-transport-https -y
sudo apt install code -y
sudo apt install mousepad -y
sudo apt install microsoft-edge-dev -y
sudo apt install --install-recommends winehq-stable -y
sudo apt install aisleriot -y
sudo apt install evolution -y
sudo apt install indicator-stickynotes -y
sudo apt install cheese -y
sudo apt install vlc -y
sudo apt-get install thunderbird -y

# Unpack .debs
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb
