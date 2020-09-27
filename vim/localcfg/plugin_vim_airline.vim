" Attempt to cache highlighting groups changes
let g:airline_highlighting_cache = v:true

" Configure look
let g:airline_skip_empty_sections = v:true

" Configure symbols
if has('gui_running')
  if index(split(&guifont), 'NF') != -1
    let g:airline_powerline_fonts = v:true
  else
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
  endif

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols = {
    \ 'branch': '⎇',
    \ 'linenr': '¶',
    \ 'modified': '+',
    \ 'notexists': 'Ɇ',
    \ 'paste': 'ρ',
    \ 'readonly': '',
    \ 'space': ' ',
    \ 'spell': '',
    \ 'whitespace': 'Ξ',
  \ }
else
  let g:airline_symbols_ascii = v:true
endif

" Only show unusual encodings
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

" Only use extensions I want
let g:airline#extensions#disable_rtp_load = v:true
let g:airline_extensions = [
    \ 'tabline',
    \ 'whitespace',
    \ 'wordcount',
\ ]

" Enable ale extension
if v:version >= 800 && has('signs')
  let g:airline_extensions += ['ale']
  if has('gui_running')
    let g:airline#extensions#ale#error_symbol = '☢'
    let g:airline#extensions#ale#warning_symbol = '⚠'
  endif
  let g:airline#extensions#ale#checking_symbol = '…'
endif

" Use simple statusline for quickfix windows
if has('quickfix')
  let g:airline_extensions += ['quickfix']
endif

" Enable git extension
if executable('git')
  let g:airline_extensions += ['branch', 'hunks']

  " Truncate  all but the basename
  let g:airline#extensions#branch#format = 2

  " Use nice symbols where possible
  if has('gui_running')
    let g:airline#extensions#hunks#hunk_symbols = ['➕ ', '≔ ', '➖ ']
  endif

  " Don't display symbol and count when zero
  let g:airline#extensions#hunks#non_zero_only = v:true
endif

" Only show tabline when there are multiple buffers
let g:airline#extensions#tabline#buffer_min_count = 2

" Prettier overflow
let g:airline#extensions#tabline#overflow_marker = '…'

" Use unique names for buffers in tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Use a pretty symbol for vim obsession
if has('gui_running')
    let g:airline#extensions#obsession#indicator_text = ''
endif

" Allow spaces after tabs, but not in between
let g:airline#extensions#whitespace#mixed_indent_algo = 2
