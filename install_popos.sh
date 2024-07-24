#!/usr/bin/env bash

clear
echo "########## Updating System ##########"
apt update && apt dist-upgrade -y
echo "########## Updating System Finished ##########\n\n\n"

echo "########## Installing Essentials ##########"

apt install -y \
build-essential \
apt-transport-https \
ca-certificates \
curl \
software-properties-common \
make \
unzip \
gnome-tweaks \
gnome-shell-extensions \
libgconf-2-4 \
zsh \
vim \
polybar \
nitrogen \
picom \
fzf \
cmake \
libfontconfig-dev

apt install ibconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

# ------------------------------------
# Install NodeJS:
# ------------------------------------
if [[ $(command -v node) ]]; then
	echo "🍺 Node already installed"
else
	echo "##########  NodeJs  ##########"
	curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && \
	apt install -y nodejs
	echo "fs.inotify.max_user_watches=10000000" | tee -a /etc/sysctl.conf
	node --version
fi

# ------------------------------------
# Install .NET Core and turn off .NET Core telemetry:
# ------------------------------------
if [[ $(command -v node) ]]; then
	echo "🍺 .NET 8.0 already installed"
else
	echo "##########  .NET  ##########"
	echo "export DOTNET_CLI_TELEMETRY_OPTOUT=true" >> ~/.profile
	apt update && apt install dotnet-sdk-8.0 -y
	dotnet --version
fi

echo "########## Installing Essentials ##########"

echo "########## Fonts ##########"
if [[ $(fc-list | fzf -f "JetBrainsMono Nerd") ]]; then
	echo "🍺 JetBrainsMono font already installed"
else
	echo "[-] Download fonts [-]"
	echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -P ~/Downloads
	unzip ~/Downloads/JetBrainsMono.zip -d /usr/share/fonts
	fc-cache -fv
fi

if [[ $(fc-list | fzf -f "FontAwesome") ]]; then
	echo "🍺 FontAwesome font already installed"
else
	wget https://use.fontawesome.com/releases/v6.6.0/fontawesome-free-6.6.0-desktop.zip -P ~/Downloads
	unzip ~/Downloads/fontawesome-free-6.6.0-desktop.zip -d /usr/share/fonts
	fc-cache -fv
fi


echo "########## Software ##########"

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3

echo "########## Installing Docker ##########"
if [[ $(command -v docker) ]]; then
	echo "🍺 Docker already installed"
else
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
fi

# Running "docker --version" should display "Docker version 19.03.6, build 369ce74a3c" or newer

if [[ $(command -v docker-compose) ]]; then
	echo "🍺 docker-compose already installed"
else
	curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	docker-compose --version
fi
# Running "docker-compose --version" should display "docker-compose version 1.25.4, build 8d51620a"

if ! [[ $(command -v docker) ]]; then
	usermod -aG docker $USER
fi


if [[ $(command -v spotify) ]]; then
	echo "🍺 Spotify already installed"
else
	echo "########## Spotify ##########"
	curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
	apt update && apt install spotify-client -y
fi

if [[ $(command -v google-chrome-stable) ]]; then
	echo "🍺 Chrome already installed"
else
	echo "########## Installing Google Chrome ##########"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads
	dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
	apt-get install -f -y
fi

if [[ $(command -v cargo) ]]; then
	echo "🍺 Cargo already installed"
else
	curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh
fi

if [[ $(command -v cargo) ]]; then
	if [[ $(command -v alacritty) ]]; then
		echo "🍺 Alacritty already installed"
	else
		echo "##########  Installing Alacritty ##########"
		cargo install alacritty
	fi
fi

if [[ $(command -v nvim) ]]; then
	echo "🍺 Neovim already installed"
else
	echo "########## Installing Neovim  ##########"
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	# Optional: exposing nvim globally.
	mv squashfs-root /
	ln -s /squashfs-root/AppRun /usr/bin/nvim
fi


if [[ $(command -v lazygit) ]]; then
	echo "🍺 LazyGit already installed"
else
	echo "########## Installing LazyGit  ##########"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	install lazygit /usr/local/bin
fi

if [[ $(command -v nerdfetch) ]]; then
	echo "🍺 nerdfetch already installed"
else
	echo "########## Installing nerdfetch  ##########"
	curl -fsSL https://raw.githubusercontent.com/ThatOneCalculator/NerdFetch/main/nerdfetch -o /usr/bin/nerdfetch
	chmod +x /usr/bin/nerdfetch
fi

echo "Creating symlinks...."

ln -s /home/jeremyevans/dotfiles/alacritty /home/jeremyevans/.config/alacritty
ln -s /home/jeremyevans/dotfiles/nvim /home/jeremyevans/.config/nvim
ln -s /home/jeremyevans/dotfiles/i3 /home/jeremyevans/.config/i3
ln -s /home/jeremyevans/dotfiles/polybar /home/jeremyevans/.config/polybar
ln -s /home/jeremyevans/dotfiles/wallpapers /home/jeremyevans/wallpapers

. "$HOME/.cargo/env" 

echo "It is recommended that you reboot after this script is run, do you want to do that now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) exit;;
    esac
done
