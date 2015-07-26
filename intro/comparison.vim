function! BeesMice()
    let bees = 32
    let mice = 4

    if bees < mice
        echo "I suppose the mice keep the bees out."
    elseif mice < 1
        echo "--or the bees keep the mice out."
    else
        echo "I don't know which."
    endif
endfunction

let farewell = "We love you, Ebenezer."
echo toupper(farewell)

function! CheckIgnoreCase(normal, upper)
    " ==# is case-sensitive
    " ==? is case-insensitive
    " == itself depends on whether the flag ignorecase is set
    return a:normal == a:upper ? "IgnoreCase is On." : "NoIgnoreCase is On."
endfunction
