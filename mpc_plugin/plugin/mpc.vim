function! OpenMPC()
    let cmd = "mpc --format '%position%: %title% (%artist%, %album%)' playlist"
    let playlist = split(system(cmd), '\n')

    new " buffer opens!
    call append(0, playlist) " does the same as below

    "for track in playlist
    "    if (playlist[0] == track)
    "        execute "normal! I" . track
    "    else
    "        call append(line('$'), track)
    "    endif
    "endfor
endfunction
