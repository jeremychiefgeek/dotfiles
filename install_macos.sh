#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/jeremyevans/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jeremyevans/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install gsl
brew install llvm
brew install boost
brew install libomp
brew install armadillo
brew install wget
brew install jq
brew install ripgrep
brew install bear
brew install mas
brew install gh
brew install ifstat
brew install switchaudio-osx
brew install sketchybar
brew install borders
brew install utoconf
brew install top
brew install make
brew install oreutils
brew install bus
brew install xpat
brew install d
brew install zf
brew install cc
brew install nu-sed
brew install ibffi
brew install ibgccjit
brew install ibiconv
brew install ibrsvg
brew install ibxml2
brew install ittle-cms2
brew install ua
brew install ailutils
brew install ake
brew install owplaying-cli
brew install kgconf
brew install npm
brew install edis
brew install ipgrep
brew install uby
brew install witchaudio-osx
brew install exinfo
brew install TheZoraiz/ascii-image-converter/ascii-image-converter
brew install ebp
brew install arn
brew install lib
brew install odin

### Terminal
brew install neovim
brew install starship
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install zoxide

### Nice to have
brew install lazygit

## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask kitty

### Nice to have
brew install --cask spotify

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font

### Tiling Manager
brew install --cask nikitabobko/tap/aerospace

# Dotnet
## Isntall
echo "Installing DOTNET 8..."
wget https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh
echo "Done Installing Dotnet... removing script and checking if worked"
rm -r dotnet-install.sh
dotnet --info
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# Node.js
## Install
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source $HOME/.zprofile
nvm install node # "node" is an alias for the latest version
node -v
npm -v


# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 497799835  #xCode

# macOS Settings
echo "Changing macOS defaults..."
mkdir $HOME/Pictures/ScreenShots
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1 # Allows the network browser to show all available network interfaces—not just the usual ones.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # Stops macOS from creating hidden .DS_Store files on network volumes.
defaults write com.apple.spaces spans-displays -bool false # Keeps each display’s virtual desktops (Spaces) separate rather than spanning them across all screens.
defaults write com.apple.dock autohide -bool true # Makes the Dock hide automatically until you hover over its area.
defaults write com.apple.dock "mru-spaces" -bool "false" # Prevents macOS from reordering your Spaces based on recent usage.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false # Turns off many window animations to make the system feel snappier.
defaults write com.apple.LaunchServices LSQuarantine -bool false # Stops macOS from warning you when opening files downloaded from the Internet.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false # Reverts scrolling to the pre-“natural” direction (traditional scroll behavior).
defaults write NSGlobalDomain KeyRepeat -int 1 # Sets a very fast key repeat rate for quicker key repetition.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false # Turns off macOS’s automatic spell correction.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true # Makes Finder display every file’s extension, even if macOS normally hides them.
defaults write NSGlobalDomain _HIHideMenuBar -bool true # Causes the menu bar to hide automatically (usually in full-screen mode or on newer macOS versions).
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431" # Changes the system selection (highlight) color to a custom RGB value.
defaults write NSGlobalDomain AppleAccentColor -int 1 # Selects one of the available system accent colors (the exact color depends on macOS version).
defaults write com.apple.screencapture location -string "$HOME/Pictures/ScreenShots" # Saves all screenshots to $HOME/Pictures/ScreenShots instead of the default folder.
defaults write com.apple.screencapture disable-shadow -bool true # Removes the drop shadow from screenshots.
defaults write com.apple.screencapture type -string "png" # Ensures screenshots are saved as PNG files.
defaults write com.apple.finder DisableAllAnimations -bool true # Eliminates certain animations in Finder for a faster, more responsive feel.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false # Prevents external drives from appearing on the desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false # Keeps internal drives from cluttering the desktop view.
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false # Stops network or mounted servers from showing up on the desktop.
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false # Keeps devices like USB sticks from automatically appearing on the desktop.
defaults write com.apple.Finder AppleShowAllFiles -bool true # Makes Finder display normally hidden files (like dotfiles).
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # Configures Finder so that searches default to the current folder instead of “This Mac.”
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Stops Finder from warning you when you change a file’s extension.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Displays the complete file system path in Finder window titles.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" # Sets Finder’s default window layout to list view (“Nlsv” stands for “list view”).
defaults write com.apple.finder ShowStatusBar -bool false # Removes the status bar at the bottom of Finder windows.
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES # Prevents Time Machine from asking if you want to use newly connected drives for backups.
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false # Stops Safari from automatically opening files it considers “safe” after downloading.
defaults write com.apple.Safari IncludeDevelopMenu -bool true # Adds a Develop menu to Safari for accessing developer tools.
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true # Activates additional WebKit-based developer options in Safari.
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true # Further ensures that WebKit2’s developer tools are enabled in Safari.
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true # Allows developer features (like inspecting elements) to be used in other apps that use WebKit.
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false # When copying email addresses from Mail, only the address is copied—not the associated name.
defaults write -g NSWindowShouldDragOnGesture YES # Lets you drag a window by clicking and holding anywhere within it (not just the title bar).

# Copying and checking out configuration files
echo "Planting Configuration Files..."
ln -s $HOME/dotfiles/aerospace/ $HOME/.config/aerospace
ln -s $HOME/dotfiles/kitty $HOME/.config/kitty
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/sketchybar $HOME/.config/sketchybar
ln -s $HOME/dotfiles/starship.toml $HOME/.config/starship.toml
ln -s $HOME/dotfiles/borders $HOME/.config/borders

# Installing Fonts
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting Services (grant permissions)..."
brew services start sketchybar
brew services start borders

echo "Installation complete...\n"
