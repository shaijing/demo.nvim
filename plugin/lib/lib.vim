function! lib#test()
    echo "This is lib test!"
endfunction


func! lib#CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "! %<"
  elseif &filetype == 'lua'
    exec "!lua ./%"
  elseif &filetype == 'cpp'
    exec "!g++ -ltensorflow % -o %<"
    exec "!%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
  elseif &filetype == 'sh'
    :!sh %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

