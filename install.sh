set -eux
set -o pipefail

# Install homebrew / linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/anlu2/.zprofile

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Neovim
brew install neovim

# Install fzf
cd ~
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
