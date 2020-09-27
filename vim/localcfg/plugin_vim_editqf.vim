" Store data in XDG basedir compliant locations
function! s:set_data_files() abort
  let l:base = g:vim_data_dir . '/%s/' .
    \ expand('%:p:~:gs?/?_?:gs?%?%%?') . '.dat'
  let g:editqf_saveqf_filename = printf(l:base, 'quickfix')
  let g:editqf_saveloc_filename = printf(l:base, 'location')
endfunction

augroup ben_editqf
  autocmd!
  autocmd BufEnter * call <SID>set_data_files()
augroup END
