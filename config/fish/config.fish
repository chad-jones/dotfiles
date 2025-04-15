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

        ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
        set --export --prepend PATH "/Users/chad/.rd/bin"
        ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

        # Setting PATH for Python 3.10
        # The original version is saved in /Users/cj/.config/fish/config.fish.pysave
        set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

        # Setting PATH for Python 3.10
        # The original version is saved in /Users/cj/.config/fish/config.fish.pysave
        set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
        set -x KUBECONFIG $HOME/.kube/config

    case Linux
        set -gx PATH $PATH $HOME/bin $HOME/.krew/bin
        # do things for Linux
    case '*'
        # do things for other OSs
end

set -x fish_greeting
set -e SSH_AGENT_PID
set -e SSH_ASKPASS
set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"

# Set GPG TTY
set -x GPG_TTY (tty)

# gpg-agent as SSH agent
set -e SSH_AGENT_PID
set -e SSH_AUTH_SOCK
if test -z $gnupg_SSH_AUTH_SOCK_by
    set gnupg_SSH_AUTH_SOCK_by 0
end
if test $gnupg_SSH_AUTH_SOCK_by -ne %self
    set UID (id -u)
    set -Ux SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
end

gpg-connect-agent updatestartuptty /bye >/dev/null

set -x EDITOR nvim
source ~/.config/fish/alias.fish

fish_vi_key_bindings

#zoxide
zoxide init --cmd cd fish | source

# Install Starship
starship init fish | source

pyenv init - | source
pyenv virtualenv-init - | source
