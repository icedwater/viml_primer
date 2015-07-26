function! EchoQuote(quote, ...)
    " Fake optional arguments that we assume to be
    " there are year and source, in either order.
    " If the arguments are not provided, EchoQuote
    " chokes and dies.
    echo a:quote " - " a:000[0] a:2
endfunction
