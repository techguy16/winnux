echo "
░██╗░░░░░░░██╗██╗███╗░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗  ░█████╗░██████╗░░█████╗░██╗░░██╗
░██║░░██╗░░██║██║████╗░██║████╗░██║██║░░░██║╚██╗██╔╝  ██╔══██╗██╔══██╗██╔══██╗██║░░██║
░╚██╗████╗██╔╝██║██╔██╗██║██╔██╗██║██║░░░██║░╚███╔╝░  ███████║██████╔╝██║░░╚═╝███████║
░░████╔═████║░██║██║╚████║██║╚████║██║░░░██║░██╔██╗░  ██╔══██║██╔══██╗██║░░██╗██╔══██║
░░╚██╔╝░╚██╔╝░██║██║░╚███║██║░╚███║╚██████╔╝██╔╝╚██╗  ██║░░██║██║░░██║╚█████╔╝██║░░██║
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝
"
echo "Winnux Arch 1.0alpha - 1st October 2022"
echo "Made by techguy16"
echo " "
echo "Make your Linux PC look like Windows 10."
echo "Windows 11 Version - Coming Soon"
sleep 5

# Update Packages
sudo pacman -Sy

# Install WGet, cURL & Git
yes | sudo pacman -S --needed base-devel wget curl git

# Download Required Items
wget https://pnggrid.com/wp-content/uploads/2021/04/windows-10-white-logo-768x770.png
wget https://wallpaperaccess.com/full/2382371.jpg ## 14.07.2022 - Changed wallpaper link
wget https://github.com/B00merang-Project/Windows-10/archive/refs/heads/master.zip
mv Windows-10-master.zip win10theme.zip
wget https://github.com/yeyushengfan258/We10X-icon-theme/archive/refs/heads/master.zip
mv We10X-icon-theme-master.zip win10icons.zip
git clone https://aur.archlinux.org/onlyoffice-bin.git
git clone https://aur.archlinux.org/microsoft-edge-stable.git
wget https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz

# Add required keys
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/


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

# Remove unrequired files
sudo rm microsoft.gpg

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
mv we10x /home/$USER/.icons
cd ..
mv Windows-10-master /home/$USER/.themes
gsettings set org.gnome.desktop.interface gtk-theme "Windows-10-master"
gsettings set org.gnome.desktop.interface icon-theme 'we10x'
tar xvf 155025-win8.tar.gz
sudo mv win8 /home/$u/.icons -v

# Install Apps
sudo pacman -Sy
yes | sudo pacman -S code
yes | sudo pacman -S mousepad
yes | sudo pacman -S wine wine-mono wine_gecko
yes | sudo pacman -S aisleriot
yes | sudo pacman -S evolution
yes | sudo pacman -S cheese
yes | sudo pacman -S vlc
yes | sudo pacman -S thunderbird

# Compile and install Microsoft Edge
cd microsoft-edge-stable
makepkg -si
cd ..

# Compile and install ONLYOFFICE Desktop Editors
cd onlyoffice-bin
makepkg -si
cd ..
