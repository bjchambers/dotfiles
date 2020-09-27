" Don't load built-in plugins we don't need. These are generally
" either not useful or have better alternatives

function! s:disable_plugin(str) abort
  execute 'let g:loaded_' . a:str . ' = v:true'
endfunction

for s:plugin in [
  \ '2html_plugin', 'getscriptPlugin', 'logipat', 'netrw',
  \ 'netrwPlugin', 'rrhelper', 'spellfile_plugin', 'tarPlugin',
  \ 'vimballPlugin', 'zipPlugin', 'matchit'
  \ ]
  call s:disable_plugin(s:plugin)
endfor

