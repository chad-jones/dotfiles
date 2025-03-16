  # Bind space as our trigger to read the current command
bind ' ' 'commandline -f expand-abbr; _kube_show_on_cmd; commandline -i " "'
# also in vim mode
bind -M insert ' ' 'commandline -f expand-abbr; _kube_show_on_cmd; commandline -i " "'

# Wrap matching items to control when they are shown
set -n | string match -r '^kube_show_(.*)_on$' | while read -Ll match item
    set -l func _kube_item_$item
    functions -q _$func && continue
    functions --copy $func _$func 2>/dev/null
    echo "
function $func --description (functions --details --verbose $func)[5]
    if set -q _kube_show_$item || set -q kube_"$item"_always_display
      starship config kubernetes.disabled false
    else
      starship config kubernetes.disabled true
    end
end" | source
end

function _kube_show_on_cmd_clear --on-event fish_preexec --on-event fish_cancel
    set -e (set -n | string match '_kube_show_*') 2>/dev/null
    starship config kubernetes.disabled true
end

function _kube_show_on_cmd_uninstall --on-event kube_show_on_cmd_uninstall
    bind --erase " "
end
