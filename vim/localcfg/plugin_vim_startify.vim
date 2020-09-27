" Smaller decoration
let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'

" Common bookmarks
let g:startify_bookmarks = [
    \ filereadable(g:xdg_config_dir . '/git/config') ? g:xdg_config_dir . '/git/config' : '~/.gitconfig',
    \ '~/.vim/dein.rst',
\ ]

" Define some quick commands to jump to help
let g:startify_commands = [
  \ ['Version', ':version'],
  \ ['Reference', ':help reference'],
  \ ['FAQ', ':help Vim-FAQ'],
\ ]

" Disable unused commands
let g:startify_enable_special = v:false

" Fancy boxes for fortunes
let g:startify_fortune_use_unicode = v:true

" Configure default chunks with fancy symbols
let g:startify_lists = [
    \ {'type': 'files',     'header': ['    MRU']},
    \ {'type': 'dir',       'header': ['    MRU '. getcwd()]},
    \ {'type': 'sessions',  'header': ['    Sessions']},
    \ {'type': 'commands',  'header': ['    Commands']},
    \ {'type': 'bookmarks', 'header': ['    Bookmarks']},
\ ]

" We don't need full filenames
let g:startify_relative_path = v:true

" Configure sessions and start them automatically
let g:startify_session_autoload = v:true
let g:startify_session_dir = g:vim_data_dir . '/sessions'
let g:startify_session_sort = v:true

" Help key for getting to startify
nnoremap <S-F1> :Startify<CR>
