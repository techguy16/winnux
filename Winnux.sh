echo "
░██╗░░░░░░░██╗██╗███╗░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗  ███████╗███████╗██████╗░░█████╗░██████╗░░█████╗░
░██║░░██╗░░██║██║████╗░██║████╗░██║██║░░░██║╚██╗██╔╝  ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗
░╚██╗████╗██╔╝██║██╔██╗██║██╔██╗██║██║░░░██║░╚███╔╝░  █████╗░░█████╗░░██║░░██║██║░░██║██████╔╝███████║
░░████╔═████║░██║██║╚████║██║╚████║██║░░░██║░██╔██╗░  ██╔══╝░░██╔══╝░░██║░░██║██║░░██║██╔══██╗██╔══██║
░░╚██╔╝░╚██╔╝░██║██║░╚███║██║░╚███║╚██████╔╝██╔╝╚██╗  ██║░░░░░███████╗██████╔╝╚█████╔╝██║░░██║██║░░██║
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚═╝░░░░░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝
"
echo "Winnux Fedora 1.0-alpha1 - 18th November 2022"
echo "Made by techguy16"
echo " "
echo "Make your Linux PC look like Windows 10."
sleep 5

# Update Packages
sudo dnf update

# Install WGet, cURL & Git
sudo dnf -y install wget curl git

# Download Required Items
wget https://pnggrid.com/wp-content/uploads/2021/04/windows-10-white-logo-768x770.png
wget https://wallpaperaccess.com/full/2382371.jpg ## 14.07.2022 - Changed wallpaper link
wget https://github.com/B00merang-Project/Windows-10/archive/refs/heads/master.zip
mv master.zip win10theme.zip
wget https://github.com/yeyushengfan258/We10X-icon-theme/archive/refs/heads/master.zip
mv master.zip win10icons.zip
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
wget https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz

# Add required keys
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc


# Add New Repositories
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo


# Remove Unrequired Stuff 
# add your own stuff

# Remove unrequired files
# add files not required

# Apply themes
u="$USER"
mv windows-10-white-logo-768x770.png winnux-10.png
sudo mv winnux-10.png /usr/share/cinnamon/theme
## gsettings set org.gnome.desktop.background picture-uri file:////home/$u/img0_3840x2160-1920x1024.jpg (Old Code)
gsettings set org.gnome.desktop.background picture-uri ./2382371.jpg
unzip win10theme.zip
unzip win10icons.zip
mkdir .themes
mkdir .icons
cd We10X-icon-theme-master
mv src we10x
mv we10x /usr/share/icons
cd ..
mv Windows-10-master /usr/share/themes
gsettings set org.gnome.desktop.interface gtk-theme "Windows-10-master"
gsettings set org.gnome.desktop.interface icon-theme 'we10x'
tar xvf 155025-win8.tar.gz
sudo mv win8 /home/$u/.icons -v

# Fix Architecture Problems (with Wine)

# Install Apps
sudo dnf update
sudo dnf -y install software-properties-common apt-transport-https

sudo dnf -y install code
sudo dnf -y install mousepad
sudo dnf -y install microsoft-edge-stable
sudo dnf -y install winehq-stable
sudo dnf -y install aisleriot
sudo dnf -y install evolution
sudo dnf -y install cheese
sudo dnf -y install vlc
sudo dnf -y install thunderbird


# Unpack .debs
sudo rpm -i onlyoffice-desktopeditors.x86_64.rpm
