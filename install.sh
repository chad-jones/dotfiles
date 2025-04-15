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
brew install cryfs/tap/cryfs


# kubernetes
brew install kubectl
brew install kubectx
brew install krew
brew install helm
brew install sops
brew install datawire/blackbird/telepresence
brew install velero
brew install Azure/kubelogin/kubelogin
brew install kubie
brew install kubecolor

# devops
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install azure-cli

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

# shell
brew install iterm2
brew install --cask wezterm
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
brew install bat
brew install delta
brew install fd
brew install tldr
brew install jq
brew install yq
brew install ngrok
brew install zoxide
brew install --cask macfuse
brew install ykman

# other
brew install spotify
brew install maestral

# kubectl plugins
kubectl krew install relay
kubectl krew install sniff
kubectl krew install view-secret
wget -O ~/bin/kubectl-login https://github.com/pmpplatform/ps-kubectl-login/releases/download/v1.2/kubectl-login-darwin-arm64
wget -qO- https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Darwin_arm64.tar.gz | tar xvz -C ~/bin
chmod +x ~/bin/kubectl-login

# wezterm
mkdir -p /.config/wezterm/colors
ln -nfs ~/dotfiles/config/wezterm/wezterm.lua ~/.config/wezterm/
ln -nfs ~/dotfiles/config/wezterm/colors/carbonfox.toml ~/.config/wezterm/colors/carbonfox.toml

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
ln -nfs ~/dotfiles/config/nvim/lua/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua

# Fish
# supress lastlogin message
touch ~/.hushlogin
echo "Add fish to /etc/shells"
grep -E "(fish)" /etc/shells || echo "/opt/homebrew/opt/fish/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/opt/fish/bin/fish
mkdir -p ~/.config/fish/functions
ln -nfs ~/dotfiles/config/fish/config.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.fish ~/.config/fish/
for file in ~/dotfiles/config/fish/functions/*; do ln -nfs "$file" ~/.config/fish/functions/"$(basename -- $file)"; done;

# starship
ln -nfs ~/dotfiles/config/starship/starship.toml ~/.config/
# fisher
./install-fisher.sh

# don't slow me down
defaults write NSGlobalDomain KeyRepeat -int 0.02
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write com.apple.Accessibility KeyRepeatEnabled -bool false
