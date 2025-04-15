function kda --wraps kubectl --description 'alias kubectl describe'
    kubectl get $argv[1] -A | fzf -e | awk -F ' ' '{print $2,$1}' | xargs -L1 bash -c 'kubectl describe $0 -n $1'
end
