set -eux
set -o pipefail

# Install homebrew / linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install zsh
brew install --cask kitty

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Neovim
brew install neovim

# Install fzf
cd ~
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

mv .hammerspoon/init.lua ~/.hammerspoon/
mv .zshrc ~
mv .config ~

# Enable Hammerspoon access under Accessibility in System Prefs
# Install Ubuntu Mono font: https://fonts.google.com/specimen/Ubuntu+Mono
# In nvim, run :PlugInstall
