function kea --wraps kubectl --description 'kubectl edit: all namespaces'
    /opt/homebrew/bin/kubectl get all -A | fzf -e | awk -F ' ' '{print $2,$1}' | xargs -L1 bash -c 'kubectl edit $0 -n $1'
end
