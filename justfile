set shell := ["bash", "-uc"]

install:
    bash install.sh

update-vim-plugins:
    for file in ~/dotfiles/config/nvim/lua/plugins/*; do ln -nfs "${file}" ~/.config/nvim/lua/plugins/"$(basename -- "${file}")"; done

update-fish-functions:
    for file in ~/dotfiles/config/fish/functions/*; do ln -nfs "${file}" ~/.config/fish/functions/"$(basename -- "${file}")"; done

update-wez-wsl:
    cp ~/dotfiles/config/wezterm/wezterm.lua /mnt/c/Users/chad.jones/.wezterm.lua