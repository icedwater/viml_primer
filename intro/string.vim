" double-quoted strings parse command characters like \n
" but single-quoted strings do not.

let str_single = 'test.\n\t\t is this far away?'
let str_double = "test.\n\t\t is this far away?"

function! DumpSingleString()
    echo g:str_single
endfunction

function! DumpDoubleString()
    echo g:str_double
endfunction
