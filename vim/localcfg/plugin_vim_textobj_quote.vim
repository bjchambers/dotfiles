" Enable for reST nad text files
augroup ben_vim_textobj_quote
    autocmd!
    autocmd FileType gitcommit,gitrebase,note,rst,markdown call textobj#quote#init()
    autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
