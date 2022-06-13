" -----------------------------------------------------------------------------
" File: Demo.vim
" Description: Demo Vim Script
" Author: Yu Ling
" -----------------------------------------------------------------------------

if exists("g:loaded_demo") || v:version<700
   echo "Has loaded"
   finish
endif
let g:loaded_demo = 1


function! DemoInit()
    if !has("python")
        echo "Don't support python!"
    endif
    call demo#test()
    echo "This is demo script!"
endfunction

function! demo#test()
    echo "Test"
endfunction



function! s:Test()
    echo "Test"
endfunction


command! -nargs=0 DemoInit call DemoInit()
