function kvs --wraps kubectl --description 'kubectl view-secret: current namespace'
    kubectl view-secret (kubectl get secret | fzf -e | awk '{print $1}') --all
end
