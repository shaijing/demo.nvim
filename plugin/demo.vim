" -----------------------------------------------------------------------------
" File: Demo.vim
" Description: Demo Vim Script
" Author: Yu Ling
" -----------------------------------------------------------------------------

if exists("g:loaded_demovs") || v:version<700
   echo "Has loaded"
   finish
endif

function! DemoVsInit()

    if !has("python")
        echo "Don't support python!"
    endif

    call demo#test()
    call lib#test()



endfunction

function! demo#test()
    echo "This is demovs Test"
endfunction



function! s:Test()
    echo "Test"
endfunction

map r :call lib#CompileRun()<CR>
command! -nargs=0 DemoVsInit call DemoVsInit()


let g:loaded_demovs = 1
