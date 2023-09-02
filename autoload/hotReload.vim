function! hotReload#TriggerHotReload() abort
    if !exists('s:last_reload_time')
        let s:last_reload_time = 0
    endif
    let l:current_time = localtime()

    if l:current_time - s:last_reload_time < 0.5
        return
    endif

    let s:last_reload_time = l:current_time

    if $SHELL =~? 'fish'
        silent execute '!kill -SIGUSR1 (pgrep -f "[f]lutter_tool.*run")'
    else
        silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run")'
    endif
endfunction
