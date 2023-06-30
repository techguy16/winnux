echo "
░██╗░░░░░░░██╗██╗███╗░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗
░██║░░██╗░░██║██║████╗░██║████╗░██║██║░░░██║╚██╗██╔╝
░╚██╗████╗██╔╝██║██╔██╗██║██╔██╗██║██║░░░██║░╚███╔╝░
░░████╔═████║░██║██║╚████║██║╚████║██║░░░██║░██╔██╗░
░░╚██╔╝░╚██╔╝░██║██║░╚███║██║░╚███║╚██████╔╝██╔╝╚██╗
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝
"
echo "Winnux 2.0  Alpha 3 - 1st July 2023"
echo "Winnux 2.x is buggy. Don't use it unless you are trying it."
echo "Made by techguy16"
echo " "
echo "Make your Linux PC look like Windows 11 (kinda). Windows 11 Version - IN HEAVY ALPHA"
sleep 5

wget -q https://raw.githubusercontent.com/techguy16/winnux/2.0/checkos
./checkos 2> /dev/null
sleep 4

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
wget https://github.com/B00merang-Artwork/Windows-10/archive/refs/heads/master.zip # Icons
mv We10X-icon-theme-main.zip win10icons.zip # Rename Icon file
wget https://download.onlyoffice.com/install/desktop/editors/linux/old/onlyoffice-desktopeditors_amd64.deb # ONLYOFFICE EDITORS deb file
wget https://github.com/PowerShell/PowerShell/releases/download/v7.3.0/powershell_7.3.0-1.deb_amd64.deb # PowerShell
wget https://raw.githubusercontent.com/techguy16/files-for-projects/main/winnux-files/155025-win8.tar.tar # 05.01.2023 - Old link not working, new link

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
  if [ lsb_release -d | grep -q 'Debian GNU/Linux 11' ]; then
     echo "You have Debian 11 - Bullseye"
     sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
  elif [ lsb_release -d | grep -q 'Debian GNU/Linux 10' ]; then
     echo "You have Debian 10 - Buster"
     sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources
  else
     echo "Your Version of Debian is either too old or is not currently supported."
  fi
elif lsb_release -d | grep -q 'Ubuntu'; then
  echo "Ubuntu Detected. Adding Ubuntu Repositories..."
  if [ lsb_release -d | grep -q '16.04' ]; then
     echo "You have Ubuntu 16.04 LTS - Xenial"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
  elif [ lsb_release -d | grep -q '18.04' ]; then
     echo "You have Ubuntu 18.04 - Bionic"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
  elif [ lsb_release -d | grep -q '20.04' ]; then
     echo "You have Ubuntu 20.04 - Focal"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
  elif [ lsb_release -d | grep -q '22.04' ]; then
     echo "You have Ubuntu 22.04 - Jammy"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
  else
     echo "Your Version of Ubuntu is either too old or is not currently supported."
  fi
elif lsb_release -d | grep -q 'Linux Mint'; then
  echo "Linux Mint Detected. Adding Ubuntu Repositories..."
  if [ lsb_release -d | grep -q '18' ]; then
     echo "You have Linux Mint 18 - Based on Xenial"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
  elif [ lsb_release -d | grep -q '19' ]; then
     echo "You have Linux Mint 19 - Based on Bionic"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
  elif [ lsb_release -d | grep -q '20' ]; then
     echo "You have Linux Mint 20 - Based on Focal"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
  elif [ lsb_release -d | grep -q '21' ]; then
     echo "You have Linux Mint 21 - Based on Jammy"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
  else
     echo "Your Version of Linux Mint is either too old or is not currently supported."
  fi
elif lsb_release -d | grep -q 'Pop!_OS'; then
  echo "Pop!_OS Detected. Adding Ubuntu Repositories..."
  elif [ lsb_release -d | grep -q '18.04' ]; then
     echo "You have Pop!_OS 18.04 - Based on Bionic"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
  elif [ lsb_release -d | grep -q '20.04' ]; then
     echo "You have Pop!_OS 20.04 - Based on Focal"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
  elif [ lsb_release -d | grep -q '22.04' ]; then
     echo "You have Pop!_OS 22.04 - Based on Jammy"
     sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
  else
     echo "Your Version of Pop!_OS is either too old or is not currently supported."
  fi
else
  echo "Sorry, your distro is not supported by either Winnux or Wine."
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
mv Windows-10-master win10icons
mv win10icons /usr/share/icons
cd ..
mv Windows-10-master $HOME/.themes
gsettings set org.cinnamon.desktop.interface clock-show-date true
gsettings set org.cinnamon.theme name "Windows-10-master"
gsettings set org.cinnamon.desktop.wm.preferences theme "Windows-10-master"
gsettings set org.cinnamon.desktop.interface icon-theme 'win10icons'
tar xvf 155025-win8.tar.tar
sudo mv win8 $HOME/.icons -v

# Fix Architecture Problems (with Wine)
sudo dpkg --add-architecture i386 # ONLY if your system is not i386/486/586/686 - Even though all modern processors support i386, this is still required (for some strange reason, that I have no clue about)

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

cmd=(dialog --keep-tite --menu "Select your preferred email client:" 22 76 16)

options=(1 "Thunderbird"
         2 "Evolution")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            echo "Installing Mozilla Thunderbird..."
            sudo apt-get install thunderbird -y > /dev/null
            ;;
        2)
            echo "Installing GNOME Evolution..."
            sudo apt install --install-recommends evolution -y > /dev/null
            ;;
    esac
done

# Unpack .debs
if dialog --yesno "Install ONLYOFFICE Desktop Editors?" 0 0; then
  echo "Installing ONLYOFFICE Desktop Editors..."
  sudo dpkg -i onlyoffice-desktopeditors_amd64.deb > /dev/null
fi
if dialog --yesno "Install PowerShell Core?" 0 0; then
  echo "Installing PowerShell Core..."
  sudo dpkg -i powershell_7.3.0-1.deb_amd64.deb > /dev/null
fi
