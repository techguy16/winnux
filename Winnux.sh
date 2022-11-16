echo "
░██╗░░░░░░░██╗██╗███╗░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗
░██║░░██╗░░██║██║████╗░██║████╗░██║██║░░░██║╚██╗██╔╝
░╚██╗████╗██╔╝██║██╔██╗██║██╔██╗██║██║░░░██║░╚███╔╝░
░░████╔═████║░██║██║╚████║██║╚████║██║░░░██║░██╔██╗░
░░╚██╔╝░╚██╔╝░██║██║░╚███║██║░╚███║╚██████╔╝██╔╝╚██╗
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝
"
echo "Winnux 2.0  Alpha 1 - 15th November 2022"
echo "Made by techguy16"
echo " "
echo "Make your Linux PC look like Windows 11 (kinda). Windows 11 Version - IN HEAVY ALPHA"
sleep 5


echo "Winnux 2.x is buggy. Don't use it unless you are trying it."
echo "Are you sure you want to use it?"
select os in Yes No
do

case $os in
# Two case values are declared here for matching
"Yes")
echo "Continuing..."
;;
# Three case values are declared here for matching
"No")
echo "exiting winnux 2.0"
exit 0
;;
# Matching with invalid data
*)
echo "Invalid entry."
break
;;
esac
done

# Update Packages
sudo apt update

# Install WGet, cURL & Git
sudo apt install wget curl git -y

# Download Required Items

# Menu Ucon
wget https://pnggrid.com/wp-content/uploads/2021/04/windows-10-white-logo-768x770.png

# Wallpaper
wget https://wallpaperaccess.com/full/2382371.jpg ## 14.07.2022 - Changed wallpaper link

wget https://github.com/B00merang-Project/Windows-10/archive/refs/heads/main.zip # Theme
mv Windows-10-main.zip win10theme.zip # Rename theme file
wget https://github.com/yeyushengfan258/We10X-icon-theme/archive/refs/heads/main.zip # Icons
mv We10X-icon-theme-main.zip win10icons.zip # Rename Icon file
wget https://download.onlyoffice.com/install/desktop/editors/linux/old/onlyoffice-desktopeditors_amd64.deb # ONLYOFFICE EDITORS deb file
wget https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz  # Cursors

# Add required keys
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key

# Add New Repositories
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'

if lsb_release -d | grep -q 'Debian'; then
  echo "Debian Detected. Passing..."
else
  echo "Ubuntu or Linux Mint Detected. Adding Ubuntu Repositories..."
  sudo add-apt-repository ppa:umang/indicator-stickynotes
  sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
fi

if lsb_release -d | grep -q 'Debian'; then
  echo "Debian Detected. Adding Debian Repositories..."
  sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources
else
  echo "Ubuntu or Linux Mint Detected. Adding Ubuntu Repositories..."
  sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' # Sorry - Wine for Xenial just for compatibility 
fi

# Remove Unrequired Stuff 
# Just saying - add stuff that you don't want after Winnux has been run

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
mv we10x $HOME/.icons
cd ..
mv Windows-10-master $HOME/.themes
gsettings set org.gnome.desktop.interface gtk-theme "Windows-10-master"
gsettings set org.gnome.desktop.interface icon-theme 'we10x'
tar xvf 155025-win8.tar.gz
sudo mv win8 $HOME/.icons -v

# Fix Architecture Problems (with Wine)
sudo dpkg --add-architecture i386 

# Install Apps
sudo apt update > /dev/null
sudo apt install software-properties-common apt-transport-https -y > /dev/null
if dialog --yesno "Install Visual Studio Code?" 0 0; then
  echo "Installing Visual Studio Code..."
  sudo apt install code -y > /dev/null
fi

if dialog --yesno "Install Mousepad?" 0 0; then
  echo "Installing Mousepad..."
  sudo apt install mousepad -y > /dev/null
fi

if dialog --yesno "Install Microsoft Edge?" 0 0; then
  echo "Installing Microsoft Edge..."
  sudo apt install microsoft-edge-stable -y > /dev/null
fi

if dialog --yesno "Install Wine?" 0 0; then
  echo "Installing Wine Stable..."
  sudo apt install --install-recommends winehq-stable -y > /dev/null
fi

if dialog --yesno "Install Aisleriot Solitaire?" 0 0; then
  echo "Installing Aisleriot Solitaire..."
  sudo apt install --install-recommends aisleriot -y > /dev/null
fi

if dialog --yesno "Install Evolution?" 0 0; then
  echo "Installing Evolution..."
  sudo apt install --install-recommends evolution -y > /dev/null
fi

if lsb_release -d | grep -q 'Debian'; then
  echo "Debian Detected. Passing StickyNotes..."
else
  echo "Ubuntu or Linux Mint Detected. Adding Ubuntu Repositories..."
  if dialog --yesno "Install StickyNotes?" 0 0; then
    echo "Installing StickyNotes..."
    sudo apt install --install-recommends indicator-stickynotes -y > /dev/null
  fi
fi

if dialog --yesno "Install Cheese?" 0 0; then
  echo "Installing GNOME Cheese..."
  sudo apt install cheese -y > /dev/null
fi

if dialog --yesno "Install VLC?" 0 0; then
  echo "Installing VLC Media Player..."
  sudo apt install vlc -y > /dev/null
fi

if dialog --yesno "Install Thunderbird?" 0 0; then
  echo "Installing Mozilla Thunderbird..."
  sudo apt-get install thunderbird -y > /dev/null
fi
cmd=(dialog --keep-tite --menu "Select options:" 22 76 16)

options=(1 "Thunderbird"
         2 "Evolution")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done

# Unpack .debs
if dialog --yesno "Install ONLYOFFICE Desktop Editors?" 0 0; then
  echo "Installing ONLYOFFICE Desktop Editors..."
  sudo dpkg -i onlyoffice-desktopeditors_amd64.deb > /dev/null
fi
