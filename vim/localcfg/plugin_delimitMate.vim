" Support multiline strings in Python
augroup ben_delimitMate
  autocmd!
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"']
augroup END
