function! mpc#GetPlaylist()
    let command = "mpc --format '%position%: @%title% (@%artist%, @%album%)' playlist"
    let [results, playlist] = [split(system(command), '\n'), []]
    let maxLengths = {'position': [], 'title': [], 'artist': []}

    for item in results
        let song = split(item, "@")
        let [position, title, artist, album] = song

        call add(maxLengths['position'], len(position))
        call add(maxLengths['title'], len(title))
        call add(maxLengths['artist'], len(artist))
    endfor

    call sort(maxLengths.position, "LargestNumber")
    call sort(maxLengths.title, "LargestNumber")
    call sort(maxLengths.artist, "LargestNumber")

    for item in results
        let song = split(item, "@")
        let [position, title, artist, album] = song

        if (maxLengths.position[-1] + 1 > len(position))
            let position = repeat(' ',
                        \ maxLengths.position[-1] - len(position))
                        \ . position
        endif

        let position .= ' '
        let title .= repeat(' ', maxLengths['title'][-1] + 2 - len(title))
        let artist .= repeat(' ', maxLengths['artist'][-1] + 2 - len(artist))

        call add(playlist,
                    \ {'position': position, 'title': title,
                    \  'artist': artist, 'album': album})
    endfor

    return playlist
endfunction

function! LargestNumber(no1, no2)
    return a:no1 == a:no2 ? 0 : a:no1 > a:no2 ? 1 : -1
endfunction

function! mpc#DisplayPlaylist()
    let playlist = mpc#GetPlaylist()

    for track in playlist
        let output = track.position . " "
                    \ . track.title
                    \ . track.artist
                    \ . track.album
        if (playlist[0].position == track.position)
            execute "normal! 1GdGI" . output
        else
            call append(line('$'), output)
        endif
    endfor
endfunction

function! mpc#PlaySong(no)
    let song = split(getline(a:no), ":") " tweak to accommodate colon (:)
    let results = split(system("mpc --format '%title% (%artist%, %album%)' play "
                \ . song[0]), "\n")
    let message = '[mpc] NOW PLAYING: ' . results[0]
    echomsg message
endfunction
