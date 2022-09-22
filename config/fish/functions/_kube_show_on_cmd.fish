function _kube_show_on_cmd
    if test (count (commandline -poc)) -eq 0
        set -l cmd (commandline -t)
        abbr -q $cmd && set -l var _fish_abbr_$cmd && set cmd $$var # expand abbr
        set -n | string match -r '^kube_show_(.*)_on$' | while read -Ll match item
          if contains $cmd $$match
            set -gx _kube_show_$item 1
            starship config kubernetes.disabled false
          else
            set -e _kube_show_$item
            starship config kubernetes.disabled true
          end
        end
        commandline -f repaint
    end
end
