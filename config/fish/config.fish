if status is-interactive
    # Commands to run in interactive sessions can go here
    # kube prompt
    source ~/dotfiles/config/fish/functions/kube_show_on_cmd.fish
    set -gx kube_show_kubectl_on k kubectl helm kns kctx kg kga kgp kgpa kgn kgs kgsa kgss kgds kgdsa kgcm kgcma kgd kgda kgi kgia kge kgea
end

### show/hide kubernetes prompt
# bind ' ' 'commandline -f expand-abbr; show_on_cmd; commandline -i " "'
# bind -M insert ' ' 'commandline -f expand-abbr; show_on_cmd; commandline -i " "'

switch (uname)
    case Darwin
        # do things for macOS
        set -gx PATH /opt/homebrew/bin $PATH $HOME/bin $HOME/.krew/bin
        set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib"
        set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include"
        set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/openssl@3/lib/pkgconfig"
        eval "$(/opt/homebrew/bin/brew shellenv)"
        source /opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish

        # Setting PATH for Python 3.10
        set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
        set -x KUBECONFIG $HOME/.kube/config
        source ~/.config/fish/alias.darwin.fish
        ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
        set --export --prepend PATH "/Users/cj/.rd/bin"
        ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

    case Linux
        # do things for Linux
        set -gx PATH $PATH $HOME/bin $HOME/bin/ovftool $HOME/.krew/bin $HOME/.local/bin
        source ~/.config/fish/alias.linux.fish

    case '*'
        # do things for other OSs
end

set -x fish_greeting

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

set -x GPG_TTY (tty)

gpgconf --launch gpg-agent

gpg-connect-agent updatestartuptty /bye >/dev/null

set -x EDITOR nvim
source ~/.config/fish/alias.fish
source ~/.config/fish/just.fish

fish_vi_key_bindings

#zoxide
zoxide init --cmd cd fish | source
direnv hook fish | source
# Install Starship
starship init fish | source
