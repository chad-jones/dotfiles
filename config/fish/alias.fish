alias c='clear'
alias h='history'
alias j='jobs -l'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias git="hub"
alias g="hub"
alias gs="git status"
alias gb="git branch"
alias gr="git remote -v"
alias gl="git log --oneline"
alias gld="git log --oneline --decorate --graph --all"
alias glf="git for-each-ref --sort=-committerdate"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias python="python3"
alias pip="pip3"
alias ls="lsd --human-readable --size default -S --classify"
alias lt='du -sh * | sort -h'
alias left='ls -t -1'
alias lg="lazygit"
alias grep="rg"
alias cat="bat"
alias tree="tree -C"
alias kubectl="kubecolor"
alias k="kubectl --force-colors"
alias kctx="kubie ctx"
alias kns="kubie ns"
alias kg="k get"
alias kapi="k api-resources"
alias kga="k get all -o wide"
alias kgp="k get po -o wide"
alias kgpa="k get po -o wide -A"
alias kgn="k get no -o wide"
alias kgs="k get service -o wide"
alias kgsa="k get service -o wide -A"
alias kgss="k get statefulset -o wide"
alias kgssa="k get statefulset -o wide -A"
alias kgds="k get daemonset -o wide"
alias kgdsa="k get daemonset -o wide -A"
alias kgcm="k get configmap -o wide"
alias kgcma="k get configmap -o wide -A"
alias kgvm="k get vmi -o wide"
alias kgvma="k get vmi -o wide -A"
alias kgpvc="k get pvc -o wide"
alias kgpvca="k get pvc -o wide -A"
alias kgpv="k get pv -o wide"
alias kgd="k get deploy -o wide"
alias kgda="k get deploy -o wide -A"
alias kgi="k get ingress -o wide"
alias kgia="k get ingress -o wide -A"
alias kge="k get events --sort-by=.metadata.creationTimestamp"
alias kgea="k get events -A --sort-by=.metadata.creationTimestamp"
alias fuckgpg "gpg-connect-agent killagent /bye; gpg-connect-agent /bye"
alias rvaf "remove_volumeattachment_finalizer"
alias dva "delete_volumeattachment"
