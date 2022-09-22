function kd --wraps kubectl --description 'alias kubectl describe'
    kubectl describe $argv[1] (/opt/homebrew/bin/kubectl get $argv[1] | fzf -e | awk '{print $1}')
end
