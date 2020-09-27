" Setup menus so :emenu works properly
runtime! ALL menu.vim

" Use systems terminal capabilities
set nottybuiltin

" Refresh termcap
set term=$TERM

" If possible, enable 24-bit color
if has('termguicolors') && &t_Co > 256
  set termguicolors
endif

" Poke around to see if we can discern the background color
let s:feature_terms = '^\(linux\|\(rxvt-unicode\|st\|xterm\)\(-256color\)\?\)$'
if &term =~# s:feature_terms || split($COLORFGBG . ';padding', ';')[0] == 15
    set background=dark
else
    set background=light
endif

" Disable omnicompletion
inoremap <Nul> <C-x><C-o>
