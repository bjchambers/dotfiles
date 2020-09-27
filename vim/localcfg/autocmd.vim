" Start the augroup
augroup ben
autocmd!

" Create missing directories when saving files
autocmd BufWritePre *
  \ if !isdirectory(expand('%:h', v:true)) |
  \   call mkdir(expand('%:h', v:true), 'p') |
  \ endif

" Don't write undo data for temporary files
autocmd BufWritePre /tmp/*,$TMP/*,~/.cache/** setlocal noundofile

" Don't edit patch backup files
autocmd BufRead *.orig set readonly

" Buffers that aren't for editing don't need spell check
autocmd FileType man,startify setlocal nospell

" Highlights for readonly buffers aren't interesting
autocmd FileType help,man setlocal colorcolumn=""

" Attempt filetype detection after creation
autocmd BufWritePost *
  \ if empty(&filetype) |
  \   filetype detect |
  \ endif

" Automatically `chmod +x` shell scripts.
autocmd BufWritePost *.sh call system('chmod +x ' . expand('%:p'))

" Jump to the last known cursor position if possible.
" Doesn't restore saved position for git buffers as that is less useful.
autocmd BufReadPost *
  \ if &filetype =~# '^git' |
  \   execute 'normal gg' |
  \ else |
  \   call setpos('.', getpos("'\"")) |
  \ endif

" Turn off search highlighting when entering a buffer
autocmd BufEnter * nohlsearch

" Turn off search highlighing when idle
autocmd CursorHold * nohlsearch | redraw

" Do a full syntax refresh when entering a buffer
autocmd BufEnter * syntax sync fromstart

" Open quickfix window if there are any entries
autocmd QuickFixCmdPost * belowright cwindow 5

" Only highlight cursor line in active window
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

" TODO: Project specific vimrc?

" Must be at the bottom -- end the augroup
augroup END
