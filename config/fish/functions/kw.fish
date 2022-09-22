function kw --wraps kubectl --description 'alias watch kubectl'
    watch -c kubecolor --force-colors get $argv
end

