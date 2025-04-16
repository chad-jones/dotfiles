#!/bin/bash

UNAME=$(uname)

if [[ ${UNAME} == "Darwin" ]]; then
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
  wget -qO- https://github.com/hidetatz/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Darwin_arm64.tar.gz | tar xvz -C ~/bin

  # fish
  grep -E "(fish)" /etc/shells || echo "/opt/homebrew/opt/fish/bin/fish" | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/opt/fish/bin/fish

  # don't slow me down
  defaults write NSGlobalDomain KeyRepeat -int 0.02
  defaults write NSGlobalDomain InitialKeyRepeat -int 12
  defaults write com.apple.Accessibility KeyRepeatEnabled -bool false

elif [[ ${UNAME} == "Linux" ]]; then
  sudo apt-get update
  sudo apt install -y wget
  sudo apt install -y gnupg2
  sudo apt install -y gnupg-agent
  sudo apt install -y dirmngr
  sudo apt install -y cryptsetup
  sudo apt install -y scdaemon
  sudo apt install -y opensc-pkcs11
  sudo apt install -y opensc
  sudo apt install -y pcsc-tools
  sudo apt install -y pcscd
  sudo apt install -y sssd
  sudo apt install -y libpam-sss
  sudo apt install -y yubikey-personalization
  sudo apt install -y yubikey-manager
  sudo apt install -y socat
  sudo apt install -y scdaemon
  sudo apt install -y xclip
  sudo apt install -y fido2-tools
  sudo apt install -y fzf
  sudo apt install -y linux-tools-common
  sudo apt install -y unzip
  sudo apt install -y zip
  sudo apt install -y aspnetcore-runtime-9.0
  sudo apt install -y dotnet-sdk-9.0
  sudo apt install -y usbutils
  sudo apt install -y libreadline-dev
  sudo apt install -y libbz2-dev libsqlite3-dev
  sudo apt install -y libssl-dev
  sudo apt install -y freetds-dev
  sudo apt install -y libjpeg-dev zlib1g-dev
  sudo apt install -y just
  sudo apt install -y hub
  sudo apt install -y ripgrep
  sudo apt install -y zoxide
  sudo apt install -y kubecolor
  sudo apt install -y tree
  sudo apt install -y bat
  sudo apt install -y lsd
  sudo apt install -y fish
  sudo apt install -y docker-ce
  sudo apt install -y docker-ce-cli
  sudo apt install -y containerd.io
  sudo apt install -y docker-buildx-plugin
  sudo apt install -y docker-compose-plugin
  sudo apt install -y ca-certificates curl
  sudo apt install -y docker
  sudo apt install -y python-neovim
  sudo apt install -y neovim
  sudo apt install -y terraform
  sudo apt install -y gnupg
  sudo apt install -y software-properties-common
  # install krew
  (
    set -x
    cd "$(mktemp -d)" &&
      OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
      ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
      KREW="krew-${OS}_${ARCH}" &&
      curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
      tar zxvf "${KREW}.tar.gz" &&
      ./"${KREW}" install krew
  )
  # wezterm
  mkdir -p /mnt/c/Users/chad.jones/colors
  cp ~/dotfiles/config/wezterm/wezterm.lua /mnt/c/Users/chad.jones/.wezterm.lua
  cp ~/dotfiles/config/wezterm/colors/carbonfox.toml /mnt/c/Users/chad.jones/colors/carbonfox.toml
fi

# kubectl plugins
kubectl krew install relay
kubectl krew install sniff
kubectl krew install view-secret

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
mkdir -p ~/.config/fish/functions
ln -nfs ~/dotfiles/config/fish/config.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.darwin.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.linux.fish ~/.config/fish/
for file in ~/dotfiles/config/fish/functions/*; do ln -nfs "${file}" ~/.config/fish/functions/"$(basename -- "${file}")"; done

# starship
ln -nfs ~/dotfiles/config/starship/starship.toml ~/.config/

# fisher
./install-fisher.sh
