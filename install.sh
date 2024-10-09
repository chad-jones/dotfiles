#!/bin/bash

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# encryption
brew install gpg
brew install pinentry-mac
brew install openssl
brew install git-crypt
brew install gopass

# kubernetes
brew install kubectl
brew install kubectx
brew install krew
brew install helm
brew install sops
brew install datawire/blackbird/telepresence
brew install velero
brew install Azure/kubelogin/kubelogin

# dev
brew install gh
brew install git
brew install neovim
brew install conan
brew install python
brew install pyenv
brew install pyenv-virtualenv
brew install mvn
brew install node
brew install fsouza/prettierd/prettierd
brew install yamllint
brew install code-minimap
brew install pre-commit
brew install luajit
brew install golang
brew install --cask visual-studio-code
brew install lazygit
brew install just
brew install hub
brew install neovide
brew install --build-from-source upx

# db
brew install postgresql
brew install mariadb
brew install pgloader
brew install redisinsight

# shell
brew install iterm2
brew install fish
brew install jump
brew install fzf
brew install bash
brew install watch
brew install tree
brew install ripgrep
brew install btop
brew install thefuck
brew install pwgen
brew install htop
brew install starship
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install viu
brew install lolcat

# utils
brew install lsd
brew install coreutils
brew install findutils
brew install gnu-tar
brew install gnu-sed
brew install gawk
brew install gnutls
brew install gnu-indent
brew install gnu-getopt
brew install grep
brew install curl
brew install wget
brew install croc
brew install xbar
brew install openfortivpn
brew install --cask tunnelblick
brew install bat
brew install delta
brew install fd
brew install tldr
brew install jq
brew install yq
brew install ngrok
brew install zoxide

# other
brew install spotify
brew install slack
brew install maestral

# kubectl plugins
kubectl krew install relay
kubectl krew install sniff
kubectl krew install view-secret
wget -O ~/bin/kubectl-login https://github.com/pmpplatform/ps-kubectl-login/releases/download/v1.2/kubectl-login-darwin-arm64
wget -qO- https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Darwin_arm64.tar.gz | tar xvz -C ~/bin
chmod +x ~/bin/kubectl-login

# Vim
mkdir -p ~/.config/nvim/lua/cj
ln -nfs ~/Dropbox/dotfiles/config/nvim/init.lua ~/.config/nvim/init.lua
ln -nfs ~/Dropbox/dotfiles/config/nvim/static ~/.config/nvim/static
ln -nfs ~/Dropbox/dotfiles/config/nvim/lua/cj/plugins ~/.config/nvim/lua/cj/plugins
ln -nfs ~/Dropbox/dotfiles/config/nvim/lua/cj/settings ~/.config/nvim/lua/cj/settings
ln -nfs ~/Dropbox/dotfiles/config/nvim/lua/cj/keymaps ~/.config/nvim/lua/cj/keymaps

# Fish
# supress lastlogin message
touch ~/.hushlogin
echo "Add fish to /etc/shells"
grep -E "(fish)" /etc/shells || echo "/opt/homebrew/opt/fish/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/opt/fish/bin/fish
mkdir -p ~/.config/fish/functions
ln -nfs ~/Dropbox/dotfiles/config/fish/config.fish ~/.config/fish/
ln -nfs ~/Dropbox/dotfiles/config/fish/alias.fish ~/.config/fish/
for file in ~/Dropbox/dotfiles/config/fish/functions/*; do ln -nfs "$file" ~/.config/fish/functions/"$(basename -- $file)"; done;

# starship
ln -nfs ~/Dropbox/dotfiles/config/starship/starship.toml ~/.config/
# fisher
./install-fisher.sh

# don't slow me down
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write com.apple.Accessibility KeyRepeatEnabled -bool false
