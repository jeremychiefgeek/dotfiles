#!/usr/bin/env bash

clear
echo "########## Updating System ##########"
apt update && apt dist-upgrade -y
echo "########## Updating System Finished ##########\n\n\n"

echo "########## Installing Essentials ##########"

clear

apt install -y \
build-essential \
apt-transport-https \
ca-certificates \
curl \
software-properties-common \
make \
unzip \
chromium-browser \
gnome-tweaks \
gnome-shell-extensions \
libgconf-2-4 \
zsh \
vim \
i3 \
polybar \
nitrogen

apt install ibconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

# ------------------------------------
# Install NodeJS:
# ------------------------------------

clear
echo "##########  NodeJs  ##########"

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && \
apt install -y nodejs
echo "fs.inotify.max_user_watches=10000000" | tee -a /etc/sysctl.conf
node --version
sleep 30

# ------------------------------------
# Install .NET Core and turn off .NET Core telemetry:
# ------------------------------------
clear
echo "##########  .NET  ##########"
echo "export DOTNET_CLI_TELEMETRY_OPTOUT=true" >> ~/.profile
apt update && apt install dotnet-sdk-8.0 -y
dotnet --version
sleep 30

echo "########## Installing Essentials ##########"


echo "########## Fonts ##########"
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip 
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
cd ~

clear
echo "########## Software ##########"

echo "########## Installing Docker ##########"
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88

# Running "sudo apt-key fingerprint 0EBFCD88" should display:

# pub   rsa4096 2017-02-22 [SCEA]
#       9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
# sub   rsa4096 2017-02-22 [S]

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce -y
docker --version

# Running "docker --version" should display "Docker version 19.03.6, build 369ce74a3c" or newer

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Running "docker-compose --version" should display "docker-compose version 1.25.4, build 8d51620a"

usermod -aG docker $USER

clear

echo "########## Spotify ##########"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt update && apt install spotify-client -y

clear
echo "########## Installing Google Chrome ##########"
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt-get install -f -y

clear
echo "##########  Installing Rust/Cargo ##########"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "##########  Installing Alacritty ##########"
cargo install alacritty -y

clear
echo "########## Installing Neovim  ##########"
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim

echo "Install Lazgit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

clear
echo "Installing Nerdfetch"
curl -fsSL https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/main/nerdfetch -o /usr/bin/nerdfetch
chmod +x /usr/bin/nerdfetch

clear
echo "Installing Picom"
cd ~/Downloads
git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install

clear
echo "Creating symlinks...."
cd ~/dotfiles
ln -s ./alacritty/ ~/.config/alacritty 
ln -s ./nvim/ ~/.config/nvim 
ln -s ./i3/ ~/.config/i3 
ln -s ./polybar/ ~/.config/polybar 
ln -s ./wallpapers/ ~/wallpapers 

clear
echo "########## Installing Oh My ZSH ##########"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/
install.sh -O -)"



echo "It is recommended that you reboot after this script is run, do you want to do that now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) exit;;
    esac
done
