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
  brew install kubelogin
  brew install siderolabs/tap/talosctl
  brew install argocd-autopilot
  # brew install kubecolor

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
  brew install figlet
  brew install direnv

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
  # uv
  curl -LsSf https://astral.sh/uv/install.sh | sh

  # fish
  grep -E "(fish)" /etc/shells || echo "/opt/homebrew/opt/fish/bin/fish" | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/opt/fish/bin/fish

  # don't slow me down
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write NSGlobalDomain KeyRepeat -int 1
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
  sudo apt install -y pinentry-gtk2
  sudo apt install -y pinentry-curses
  sudo apt install -y software-properties-common
  sudo apt install -y htop
  sudo apt install -y figlet
  sudo apt install -y lolcat
  sudo apt install -y jq
  sudo apt install -y yq
  suod apt install -y direnv
  # just
  pipx install rust-just
  # kubie
  wget https://github.com/sbstp/kubie/releases/download/v0.25.2/kubie-linux-arm64 -O ~/.local/bin/kubie
  chmod +x /usr/local/bin/kubie
  # sops
  wget https://github.com/getsops/sops/releases/download/v3.10.2/sops-v3.10.2.linux.amd64 -O ~/.local/bin/sops
  chmod +x ~/.local/bin/sops
  # croc
  curl https://getcroc.schollz.com | bash
  # talosctl
  curl -sL https://talos.dev/install | sh
  # uv
  curl -LsSf https://astral.sh/uv/install.sh | sh
  # argocd autopilot
  # get the latest version or change to a specific version
  VERSION=$(curl --silent "https://api.github.com/repos/argoproj-labs/argocd-autopilot/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

  # download and extract the binary
  curl -L --output - https://github.com/argoproj-labs/argocd-autopilot/releases/download/"$VERSION"/argocd-autopilot-linux-amd64.tar.gz | tar zx

  # move the binary to your $PATH
  mv ./argocd-autopilot-* /usr/local/bin/argocd-autopilot

  # azure cli
  sudo mkdir -p /etc/apt/keyrings
  curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg >/dev/null
  sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
  AZ_DIST=$(lsb_release -cs)
  echo "Types: deb
  URIs: https://packages.microsoft.com/repos/azure-cli/
  Suites: ${AZ_DIST}
  Components: main
  Architectures: $(dpkg --print-architecture)
  Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
  sudo apt-get update
  sudo apt-get install azure-cli
  az extension add --name azure-devops

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
  cp ~/dotfiles/config/wezterm/wezterm.lua /mnt/c/Users/chad.jones/.wezterm.lua
  cp ~/dotfiles/config/wallpaper/background.jpg /mnt/c/Users/chad.jones/background.jpg
fi

# git
mkdir -p ~/.config/git/themes
ln -nfs ~/dotfiles/config/git/gitconfig ~/.config/git/config
ln -nfs ~/dotfiles/config/git/themes/catppuccin.gitconfig ~/.config/git/themes/catpuccin.gitconfig

# bat
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo '--theme="Catppuccin Mocha"' >"$(bat --config-dir)/config"

# kubectl plugins
kubectl krew install relay
kubectl krew install sniff
kubectl krew install view-secret
kubectl krew install oidc-login

# wezterm
ln -nfs ~/dotfiles/config/wezterm/wezterm.lua ~/.config/wezterm/
ln -nfs ~/dotfiles/config/wallpaper/background.jpg ~/.config/background.jpg

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
for file in ~/dotfiles/config/nvim/lua/plugins/*; do ln -nfs "${file}" ~/.config/nvim/lua/plugins/"$(basename -- "${file}")"; done

# Fish
# supress lastlogin message
touch ~/.hushlogin
echo "Add fish to /etc/shells"
mkdir -p ~/.config/fish/functions
ln -nfs ~/dotfiles/config/fish/config.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.darwin.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/alias.linux.fish ~/.config/fish/
ln -nfs ~/dotfiles/config/fish/just.fish ~/.config/fish/
for file in ~/dotfiles/config/fish/functions/*; do ln -nfs "${file}" ~/.config/fish/functions/"$(basename -- "${file}")"; done

# starship
ln -nfs ~/dotfiles/config/starship/starship.toml ~/.config/

# fisher
./install-fisher.sh
