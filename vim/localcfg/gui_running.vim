" Let the window manager handle boundaries
set guiheadroom=0

" Use console dialogs instead of popups
set guioptions+=c

" Limit the horizontal scroll bar size
set guioptions+=h

" Disable the left and right scrollbars
set guioptions-=L
set guioptions-=r

" Disable the toolbar and menu (but a keymap for toggling it)
set guioptions-=T
set guioptions-=m

if has('menu')
  nnoremap <silent> <S-F4> :call ToggleFlag('guioptions', 'm')<CR>
endif
if has('toolbar')
  nnoremap <silent> <C-F4> :call ToggleFlag('guioptions', 'T')<CR>
endif

" Attempt to keep window size when toggling menu items.
set guioptions+=k

" Configure right mouse button
set mousemodel=popup_setpos

" Always display relative line numbers in the GUI, but
" show actual line number on current line
set number
set relativenumber

" Attempt to use Inconsolata or Consolas
for s:name in ['Hack', 'Inconsolata', 'Consolas', 'monospace']
  if len(systemlist('fc-list "' . s:name . ' NF"')) != 0
    let s:font_family = s:name . ' NF'
    break
  elseif len(systemlist('fc-list "' . s:name . '"')) != 0
    let s:font_family = s:name
    break
  endif
endfor
let s:font_size = 13
let &guifont = s:font_family . ' ' . s:font_size

" Show the server name if it isn't 'GVIM'
if has('title')  && has('clientserver')
  set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
endif

" Bind omni completion to control space.
inoremap <C-Space> <C-x><C-o>

" Hack to stop dein from re-caching when switching modes
let g:loaded_bracketed_paste = v:true
