" can I call functions from other files?
" funcref variables must be named with a capital initial

source function.vim

function! BorrowCode()
    let Extern = function('EchoQuote')
    call Extern('This seems to work. but I need to source function.vim first',
                \ '2015', 'icedwater')
endfunction

