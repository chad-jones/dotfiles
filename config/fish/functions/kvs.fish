function kvs --wraps kubectl --description 'kubectl view-secret: current namespace'
    kubectl view-secret (/opt/homebrew/bin/kubectl get secret | fzf -e | awk '{print $1}') --all
end
