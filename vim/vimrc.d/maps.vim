" Set up map to quickly move between buffers
function! s:switch_buf(count) abort
  let b:bufs = filter(range(1, bufnr('$')),
    \               'buflisted(v:val) && bufname(v:val) !=# ""')
  if len(b:bufs) < 2
    return
  endif
  let b:place = index(b:bufs, bufnr('%'))
  let b:buf = get(b:bufs, b:place + a:count,
    \           bufnr('%') == 1 ? bufnr('$') : b:bufs[0] )
  execute 'buffer ' . b:buf
endfunction

noremap <silent> <M-Left> :call <SID>switch_buf(-1)<CR>
noremap <silent> <M-Right> :call <SID>switch_buf(1)<CR>

" Use more text objects
if exists('$VIM_DISABLE_CURSORS')
  nnoremap <Up> <nop>
  inoremap <Up> <nop>

  nnoremap <down> <nop>
  inoremap <down> <nop>

  nnoremap <Left> <nop>
  nnoremap <Right> <nop>
  inoremap <Left> <nop>
  inoremap <Right> <nop>
endif

" Navigate tags with better keys
noremap <C-S-Left> <C-T>
noremap <C-S-Right> <C-]>

" Add maps to skip paragraphs
nnoremap <C-Up> {
nnoremap <C-Down> }

" Begin newline from anywherhe
inoremap <S-CR> <C-o>o
inoremap <C-CR> <C-o>O

" Make C-g verbose by default
nnoremap <C-g> 2<C-g>

" Map Q to reformat pargraphs
nnoremap Q gqap

" Easy access to manpages when using a custom keywordprg
nnoremap <C-?> :<C-U>execute 'Man' v:count '<C-R><C-W>'<CR>

" Shift + arrows to select text
nnoremap <S-Left> vh
nnoremap <S-Right> vl
nnoremap <S-Up> Vk
nnoremap <S-Down> Vj

" Logical Y mapping (behaves like D)
nnoremap Y y$

" Re-grab selection after {de,in}dent for simpler repetition
vnoremap < <gv
vnoremap > >gv

" Visual mode indent matching insert
vnoremap <Tab> >gv
vnoremap <Backspace> <gv

" Home jumps between start of line and start of text
function! s:home_skip() abort
  if col('.') != 1
    normal! 0
  else
    normal! ^
  endif
endfunction
inoremap <silent> <home> <C-o>:call <SID>home_skip()<CR>
nnoremap <silent> <home> :call <SID>home_skip()<CR>

" Function keys for common quick commands
nnoremap <F10> :call <SID>call_build()<CR>
nnoremap <S-F10> :call <SID>call_build('check')<CR>
nnoremap <silent> <C-F11> :let @/ = ''<CR>

" Window managment
nnoremap <C-w><Bar> <C-w>v
nnoremap <C-w>- <C-w>s
nnoremap <Tab> <C-w>p
if has('quickfix')
  nnoremap <S-Tab> <C-w>P
endif

" Folding support maps
if has('folding')
  nnoremap - zc
  nnoremap + zo

  nnoremap z<Up> zk
  nnoremap z<Down> zj

  vnoremap - zf
endif

" Insert a modeline on the last line.
" Adapted from godlygeek’s vimrc
function! s:modeline_stub() abort
  let l:save_cursor = getcurpos()
  let l:x = 'ft=' . &filetype . (&expandtab ? '' : ' noet')
  if v:count > 1
    let l:x .= printf(' ts=%d sw=%d tw=%d fdm=%s%s', &tabstop, &shiftwidth,
      \             &textwidth, &foldmethod,
      \            (&foldmethod ==# 'marker' ? ' fmr=' . &foldmarker : ''))
  endif
  let l:x = printf(&commentstring, ' vim: ' . l:x . ':')
  $put =trim(substitute(l:x, '\ \+', ' ', 'g'))
  call setpos('.', l:save_cursor)
endfunction
command! Modeline call <SID>modeline_stub()

" Help related maps
call MnemonicMap('Help', {'key': '?'})

for s:t in ['pattern', 'quickref', 'registers']
  execute 'nnoremap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
endfor

nnoremap <silent> [Help]c :helpclose<CR>

" Perform word-ish searches in a new window
for s:k in ['*', '#']
  execute 'nnoremap <C-w>' . s:k  . ' <C-w>s' . s:k
  execute 'nnoremap <C-w>g' . s:k  . ' <C-w>sg' . s:k
endfor

" Shortcuts for help
cnoremap <C-h> help<Space>
cnoremap <C-S-h> vert help<Space>

" Ping the cursor when returning to the session
function! s:cursor_ping() abort
  let l:cursorline = &cursorline
  let l:cursorcolumn = &cursorcolumn
  for _ in range(5)
    set cursorline! cursorcolumn!
    redraw
    sleep 15m
  endfor
  let &cursorline = l:cursorline
  let &cursorcolumn = l:cursorcolumn
endfunction
nmap <silent> <C-Space> :call <SID>cursor_ping()<CR>

" Insert current buffers directory at command line
cmap <M-.> <C-r>=expand('%:p:h') . '/'<CR>

" Scroll wheel moves through undo list and through branches with Shift
for s:m in ['i', 'n']
  let s:break_insert = s:m ==# 'i' ? '<C-o>' : ''
  for [s:mod, s:key, s:cmd] in [
    \  ['', 'Up', 'u'], ['', 'Down', '<C-r>'],
    \  ['S-', 'Up', 'g-'], ['S-', 'Down', 'g+']
    \ ]
    execute s:m . 'noremap <' . s:mod . 'ScrollWheel' . s:key . '> '
      \ . s:break_insert . s:cmd
  endfor
endfor

" Insert mode maps for accessing all completion modes
for s:key in split('lnkti]fdvuos', '\zs')
  execute 'inoremap <silent> <LocalLeader>,' . s:key .
    \ ' <C-x><C-' . s:key . '>'
endfor

" Place cursor at end of yanked region
vmap y y`]
