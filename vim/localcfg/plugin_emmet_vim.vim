" Enable completion
let g:user_emmet_complete_tag = v:true

" Don't create global maps
let g:user_emmet_install_global = v:false

" Enable automatically when it will be useful
if has('autocmd')
  augroup ben_emmet
    autocmd FileType css,html,xml EmmetInstall
  augroup END
endif
