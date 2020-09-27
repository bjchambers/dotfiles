syntax enable

" Support folding in manpages
let g:ft_man_folding_enable = v:true

" Prefer vertical splits for manpages
let g:ft_man_open_mode = 'vert'

" Default to bash for sh syntax
let g:is_bash = v:true
let g:is_posix = v:true

" Use fancy conceal support for rust
let g:rust_conceal = v:true
let g:rust_conceal_mod_path = v:true
let g:rust_conceal_pub = v:true

" Enable folding support, but default to the global foldlevel
let g:rust_fold = 1

" Fold shell scripts as much as possible
let g:sh_fold_enabled = 7
" And search a long way to keep syntax highlighting correct
let g:sh_minlines = 400
" Disable highlighting errors that will be caught by linter
let g:sh_no_error = v:true

" Support folding for XML
let g:xml_syntax_folding = v:true

" Support fording for ZSH
let g:zsh_fold_enable = v:true
