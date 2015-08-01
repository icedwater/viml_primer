function! mpc#DisplayPlaylist()
    let cmd = "mpc --format '%position%: %title% (%artist%, %album%)' playlist"
    let playlist = split(system(cmd), '\n')

    call append(0, playlist) " does the same as below

    "for track in playlist
    "    if (playlist[0] == track)
    "        execute "normal! I" . track
    "    else
    "        call append(line('$'), track)
    "    endif
    "endfor
endfunction

function! mpc#PlaySong(no)
    let song = split(getline(a:no), ":") " tweak to accommodate colon (:)
    let results = split(system("mpc --format '%title% (%artist%, %album%)' play "
                \ . song[0]), "\n")
    let message = '[mpc] NOW PLAYING: ' . results[0]
    echomsg message
endfunction
