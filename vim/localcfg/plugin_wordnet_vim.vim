" Add a map to close wordnet window from anywhere
function! s:wordnet_close_win() abort
  if bufnr('__WordNet__') > -1
    exec bufnr('__WordNet__') . 'bdelete!'
  endif
endfunction

nnoremap <silent> <Leader>wnq :call <SID>wordnet_close_win()<CR>

" We don't care that the dictionary buffer has trailing whitespace
if has('autocmd')
  augroup ben_wordnet
    autocmd BufNewFile __WordNet__ HideBadWhitespace
  augroup END
endif
