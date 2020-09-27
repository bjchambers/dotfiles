" Many distributions package vim with cherry picked patches, and sometimes it
" is nice to know the current base version state:
function! Version() abort
  let l:n = 1
  while has('patch' . n)
    let l:n += 1
  endwhile
  return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
endfunction
command! Version echo 'vim-' . Version()

" A helper for balloonexpr calling an external command.
function! CommandBalloon(cmd) abort
  let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
  return systemlist(printf(l:cmd, v:beval_text))
endfunction

" Add on-hover word definitions
if has('gui_running') && executable('wn')
  command WordNetBalloon
    \ setlocal balloonexpr=CommandBalloon('wn\ %s\ -over')
endif

" Function for toggling flags
function! ToggleFlag(option, flag) abort
  let l:optstr = eval('&' . a:option)
  if stridx(l:optstr, ',') == -1
    " Simple char options like 'fo'
    let l:flip = '+-'[l:optstr =~# a:flag]
  else
    " Comma lists options like 'cot'
    let l:flip = '+-'[index(split(l:optstr, ','), a:flag) != -1]
  endif
  execute 'set ' . a:option . l:flip . '=' . a:flag
endfunction

" Mnemonic mapping setup function.
"
" This adds a `?` binding to display the map list for `name`.
function! MnemonicMap(name, ...) abort
    let l:extra = get(a:, 1, {})
    let l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
    let l:key = get(l:extra, 'key', tolower(a:name[0]))
    let l:leader = get(l:extra, 'local', v:false) ? 'Local' : ''
    let l:mode = get(l:extra, 'mode', 'n')
    execute l:mode . 'noremap ' . l:buffer . ' [' . a:name . '] <Nop>'
    execute l:mode . 'map ' . l:buffer . ' <' . l:leader . 'Leader>'
        \ . l:key . ' [' . a:name . ']'
    execute l:mode . 'noremap <silent> [' . a:name . ']?'
        \ ' :' . l:mode . 'map [' . a:name . ']<CR>'
endfunction
