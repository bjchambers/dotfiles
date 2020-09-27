" Ignore whitespace by default
set diffopt+=iwhite

" Use histogram method to match git config
if has('patch-8.1.0360')
  set diffopt+=algorithm:histogram,indent-heuristic
endif

" Skip the rest of there is no autocmd available
if !has('autocmd')
  finish
endif

function! s:diff_maps() abort
  call MnemonicMap('diff', {'key': 'i', 'local': v:true})
  noremap <buffer> [diff]w :call ToggleFlag('diffopt', 'iwhite')<CR>

  noremap <buffer> [diff]o :diffoff!<CR>
  noremap <buffer> [diff]p :diffput<CR>
  noremap <buffer> [diff]g :diffget<CR>
  noremap <buffer> [diff]u :diffupdate<CR>

  vnoremap <buffer> < :diffget<CR>
  vnoremap <buffer> > :diffget<CR>
endfunction

augroup ben_diff
  autocmd!
  autocmd BufEnter * if &diff | call <SID>diff_maps() | endif
augroup END
