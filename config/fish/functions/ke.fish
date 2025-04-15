function ke --wraps kubectl --description 'kubectl edit: current namespace'
    kubectl edit (kubectl get all | fzf -e | awk '{print $1}')
end
