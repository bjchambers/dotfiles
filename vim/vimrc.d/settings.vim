" Usual fanciness.
filetype plugin indent on

" Load a color scheme, but only on first source
if !exists('g:colors_name')
  colorscheme codedark
  let g:airline_theme = 'codedark'
endif

" Change to the current buffers directory
set autochdir

" Backups, but in the cache directory.
set backup
set backupcopy=auto,breakhardlink
let &backupdir = g:vim_cache_dir . '/backup//'
call mkdir(g:vim_cache_dir . '/backup', 'p', 0700)

" Enable tooltips
if has('balloon_eval')
  set ballooneval
endif

" Keep indent between wrapped lines and display the pretty 'showbreak' indicator
set breakindent
set breakindentopt=sbr

" Show a marker as maximum line length cue
set colorcolumn=+1

" Show completion popup even where there is only a single item. The menu may
" include useful information.
set completeopt+=menuone

" Enable fancy unicode display
if has('conceal')
  set concealcursor=nc
  set conceallevel=2
endif

" Ask instead of failing when there are edited buffers and you call quit.
set confirm

" Highlight the cursor line
set cursorline

" If miscfiles is installed, use its dictionary
if filereadable('/usr/share/dict/words')
  set dictionary^=/usr/share/dict/words
endif

" Keep swap files in XDG basedir location
let &directory = g:vim_cache_dir . '/swap//,' . &directory
call mkdir(g:vim_cache_dir . '/swap', 'p', 0700)

" Only files that must contain tabs should contain tabs.
set expandtab

" If the terminal can support it, use Unicode for vertical split bar
if &termencoding ==# 'utf-8' || has('gui_running')
  set fillchars+=vert:│
endif

" Configure folding support, including fold display
if has('folding')
  set fillchars+=fold:\   " Intentional trailing space
  set foldcolumn=2
  set foldlevelstart=99
  set foldmethod=syntax
  set foldtext=MyFoldText()
endif

" Configure formatting
" r - continue comment on
" n - indent text in number lists
" l - don't automatically break long lines
" 1 - don't break line on one letter word
set formatoptions+=rnl1

" Allow unsaved modified buffers in the background
set hidden

" Ignore case in searches
set ignorecase

" Make completion use the case of currently inserted text
set infercase

" Having = in filename matches are more trouble than they're worth
set isfname-=\=

" Use vim's builtin manpage support
set keywordprg=:Man

" Don't update the screen when executing non-interactive commands
set lazyredraw

" Prefer line wrapping at visually appealing locations
if has('linebreak')
  set linebreak

  " Use fancy unicode characters to show for wrapped lines
  let &showbreak='» '
endif

" Show hidden whitespace in buffers
set list
if &termencoding ==# 'utf-8' || has('gui_running')
  set listchars=tab:␉·,extends:…,nbsp:␠
  if has('conceal')
    set listchars+=conceal:Δ
  endif
else
  set listchars=tab:>-,extends:>,nbsp:_
endif

" Include angle brackets in pair matching
set matchpairs+=<:>

" Show matching parenthesis for .3 seconds
set matchtime=3

" Always include octal in 'nrformats'
set nrformats+=octal

" Set an upper limit to the popup menu, as full screen feels too big
if has('insert_expand')
  set pumheight=10
endif

" If available, default to python 3
if has('pythonx') && has('python3')
  set pyxversion=3
endif

" Always display count of changed lines
set report=0

" Keep cursor line centered
set scrolloff=100

" While marginally less secure, using temporary files allows better handling
" of encoding for pipes
if has('filterpipe')
  set noshelltemp
endif

" Make indentation always use the user's defined width
set shiftround

" Disable vim's intro message
set shortmess+=I

" Don't show ins-completion-menu messages
set shortmess+=c

" Show match position when searching:
if has('patch-8.1.1270')
  set shortmess-=S
endif

" Always display partial commands
if has('cmdline_info') && has('showcmd')
  set showcmd
endif

" Make completion popups show complete mtaches, which can often be used as tips
set showmatch

" No need to show diisplay the current mode, since vim-airline includes it
set noshowmode

" Make searches case insensitive when an upper case character is typed
set smartcase

" Pretend tab is four spaces
set softtabstop=4

" Configure spell checking and
if has('spell')
  set spell
  let s:lang = substitute($LANG, '\..*', '', '')
  execute 'set spellfile=~/.vim/spell/' . s:lang . '.utf-8.add'
  execute 'set spelllang=' . tolower(s:lang)
endif

" Prefer horizontal split toward the bottom, and vertical split towards right
set splitbelow
set splitright

" Don't jump to the start of line when changing buffers
set nostartofline

" Limit default line length to 80 characters. Some filetypes may override.
set textwidth=80

" Make tilde available as an operator
set tildeop

" Only timeout on keycodes
set notimeout
set ttimeout

" Set title in terminals
set title

" Use smoother redraws
" This is enabled by vim for most terminal types that would support it, but the
" list is static.
set ttyfast

" Enable undo files that cross sessions, and store those in XDG basedir 
" compliant locations
if has('persistent_undo')
  set undofile
  let &undodir = g:vim_data_dir . '/undo//,' . &undodir
  call mkdir(g:vim_data_dir . '/undo', 'p', 0700)
endif

" Double the default swap file write time interval
set updatetime=8000

" Store session files in XDG basedir compliant location
if has('mksession')
  let &viewdir = g:vim_cache_dir . '/view'
  call mkdir(&viewdir, 'p', 0700)
endif

" Configure viminfo and store viminfo files in XDG basedir compliant location
if has('viminfo')
  set viminfo='5000,<1000,h
  let &viminfofile = g:vim_cache_dir . '/viminfo'
endif

" Allow moving to "empty" blocks in visual block mode
if has('virtualedit')
  set virtualedit=block
endif

" Allow moving over lines
set whichwrap+=<,>,[,]

" Ignore files we are unlikely to want to edit (PDF, etc.)
if has('wildignore')
  set wildignore+=*.pdf,*.swp,*.[ao],*~,*.db
endif

" Insert longest common match by default
set wildmode^=longest:full

if has('title') && (has('gui_running') || &title)
  function! RelativeName() abort
    " Dig in to projectionist’s data for project root
    let l:p = get(b:, 'projectionist', {})
    if l:p != {}
        return substitute(expand('%:p'),
          \             '^' . keys(l:p)[0] . '/',
          \             '',
          \             '')
    else
      return expand('%')
    endif
  endfunction
  set titlestring=
  set titlestring+=%{RelativeName()}  " File name
  set titlestring+=\ -\ %{v:progname} " Program name
endif

" Custom foldtext setting
if has('folding')
  function! s:shorten(text, line_str)
    let l:text = a:text
    " Non-getline() text length
    let l:base = 19
    let l:text_width = winwidth(0) - v:foldlevel - len(a:line_str) - l:base
    if strlen(l:text) > l:text_width
      let l:text = l:text[:l:text_width] . '…'
    endif
    return l:text
  endfunction

  function! MyFoldText()
    return substitute(foldtext(), '^+-\(-\+\)\s*\(\d\+\) lines: \(.*\)',
        \             {m -> repeat('─', v:foldlevel) . ' ' .
        \                   s:shorten(m[3], m[2]) . '▼ ' . m[2] . ' lines'},
        \             '')
  endfunction
endif
