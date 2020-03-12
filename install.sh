# Install homebrew / linuxbrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/anlu2/.zprofile

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
