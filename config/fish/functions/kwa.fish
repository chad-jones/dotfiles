function kwa --wraps kubectl --description 'alias watch kubectl'
    watch -c kubecolor --force-colors get $argv[1] -A $argv[2..-1]
end

