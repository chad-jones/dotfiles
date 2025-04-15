function kvsa --wraps kubectl --description 'kubectl view-secret: all namespaces'
    kubectl get secret -A | fzf -e | awk -F ' ' '{print $2,$1}' | xargs -L1 bash -c 'kubectl view-secret $0 -n $1 --all'
end
