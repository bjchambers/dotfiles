"""
""" Utility functions
"""

" Add a prefix or suffix to a list of strings.
function! s:prefix(str, args) abort
  return map(a:args, {_, s -> a:str . s })
endfunction

function! s:suffix(str, args) abort
  return map(a:args, {_, s -> s . a:str })
endfunction

" Enable an airline extension
function! s:airline_enable(extension) abort
  return 'let g:airline_extensions += ["' . a:extension . '"]'
endfunction


" Cached version of `executable(cmd)`
let s:has_exec_cache = {}
function! s:has_exec(command) abort
  if !has_key(s:has_exec_cache, a:command)
    let s:has_exec_cache[a:command] = executable(a:command)
  endif
  return s:has_exec_cache[a:command]
endfunction


"""
""" Repositories
"""

" repo: Shougo/dein.vim (mirrored)
" config: vimrc.d/dein
call dein#add(expand('~/.vim/external/dein.vim'), {
  \ 'if': v:version >= 800,
\ })

" sideways: move an item in a delimiter separated list left or right
" config: localcfg/plugin_sideways.vim
call dein#add('AndrewRadev/sideways.vim', {
  \ 'on_cmd': s:prefix('Sideways', ['Left', 'Right']),
  \ 'on_map': {'n': '[sideways]'},
\ })

" vim-bracketed-paste: enables transparent pasting into vim
call dein#add('ConradIrwin/vim-bracketed-paste', {
  \ 'on_event': 'InsertEnter',
\ })

" dwm.vim: Tiled window management for vim
" config: localcfg/plugin_dwm.vim
call dein#add('JNRowe/dwm.vim', {
  \ 'on_func': s:prefix('DWM_', ['Close', 'Focus', 'New', 'Rotate']),
\ })

" securemodelines: Secure alternative to modelines
" config: localcfg/plugin_securemodelines.vim
call dein#add('JNRowe/securemodelines')

" FastFold: Don't scan for folds during insert
" config: localcfg/plugin_FastFold.vim
call dein#add('Konfekt/FastFold', {
  \ 'if': has('folding'),
\ })

" delimitMate: Automatic closing of quotes, parenthesis, brackets, etc.
" config: localcfg/plugin_delimitMate.vim
call dein#add('Raimondi/delimitMate', {
  \ 'on_event': 'InsertEnter',
\ })

" vimproc: Asynchronous execution
" Lazy loaded.
call dein#add('Shougo/vimproc', {
  \ 'build': 'make',
  \ 'on_cmd': s:prefix('VBGstart', ['GBB', 'LLDB', 'PDB3']),
  \ 'on_func': 'vebugger',
\ })

" ultisnips: Ultimate plugin for snippets
" config: localcfg/plugin_ultisnips.vim
call dein#add('SirVer/ultisnips', {
  \ 'depends': 'vim-snippets',
  \ 'if': has('pythonx') && v:version >= 704,
\ })

" vim-gitgutter: Show git diff status in the gutter
" config: localcfg/plugin_vim_gitgutter.vim
call dein#add('airblade/vim-gitgutter', {
  \ 'if': has('signs') && s:has_exec('git'),
\ })

" vim-bad-whitespace: Highlights or deletes broken whitespace
call dein#add('bitc/vim-bad-whitespace', {
  \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
  \ 'on_event': 'InsertEnter',
\ })

" colorizer: Color color names and codes
" Only enabled for specific filetypes, because it severely slows down vim.
" config: localcfg/plugin_Colorizer.vim
call dein#add('chrisbra/Colorizer', {
  \ 'on_cmd': s:prefix('Color', ['Highlight', 'Toggle']) + ['RGB2Term', ],
\ })

" Recover.vim: Show diffs when a swap file is encountered
" config: localcfg/plugin_Recover_vim.vim
call dein#add('chrisbra/Recover.vim', {
  \ 'if': v:version >= 703,
\ })

" SaveSigns.vim: Save signs across sessions
call dein#add('chrisbra/SaveSigns.vim', {
  \ 'if': has('signs'),
  \ 'on_cmd': 'SaveSigns',
\ })

" vim_faq: Plugin for the vim FAQ
call dein#add('chrisbra/vim_faq', {
  \ 'if': v:version >= 600,
\ })

" jedi-vim: A VIM binding to the jedi autocompletion library
" config: localcfg/plugin_jedi_vim.vim
call dein#add('davidhalter/jedi-vim', {
  \ 'if': has('pythonx'),
  \ 'on_cmd': 'JediClearCache',
  \ 'on_ft': 'python',
\ })

" vim-ditto: Highlight overused words
" config: localcfg/plugin_vim_ditto.vim
call dein#add('dbmrq/vim-ditto', {
  \ 'on_cmd': ['DittoFile', 'DittoOn'],
\ })

" ale: Asynchronous lint engine
" config: localcfg/plugin_ale.vim
call dein#add('dense-analysis/ale', {
  \ 'if': v:version >= 800 && has('signs'),
\ })

" bullets.vim: Bulleted lists in Vim
call dein#add('dkarter/bullets.vim', {
  \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
  \ 'on_ft': ['gitcommit', 'rst', 'markdown'],
\ })

" editorconfig-vim: The EditorConfig plugin
" config: localcfg/plugin_editorconfig_vim.vim
call dein#add('editorconfig/editorconfig-vim', {
  \ 'if': has('pythonx'),
  \ 'on_event': 'InsertEnter',
  \ 'on_path': '.editorconfig',
\ })

" Regex: Removes the need to use the REPL to test Regular Expressions
" config: localcfg/plugin_regex.vim
call dein#add('ervandew/regex', {
  \ 'on_cmd': 'Regex',
\ })

" tabular: Configurable, flexible, intuitive text aligning.
call dein#add('godlygeek/tabular', {
  \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ })

" dein-command.vim: utility commands for dein.vim
call dein#add('haya14busa/dein-command.vim', {
  \ 'on_cmd': 'Dein',
\ })

" vim-snippets: Snippet files for various programming languages.
" config: localcfg/plugin_vim_snippets.vim
call dein#add('honza/vim-snippets')

" vim-vebugger: Yet another debugger frontend plugin.
" config: localcfg/plugin_vim_vebugger.vim
call dein#add('idanarye/vim-vebugger', {
  \ 'depends': 'vimproc',
  \ 'on_cmd': s:prefix('VBGstart', ['GDB', 'LLDB', 'PDB3']),
  \ 'on_func': 'vebugger',
\ })


" vim-yankitute: Regex powered yank and substitute
call dein#add('idanarye/vim-yankitute', {
  \ 'on_cmd': 'Yankitute',
\ })

" vim-cursorword: Underline the word under the cursor.
call dein#add('itchyny/vim-cursorword')

" vim-gnupg: Transparent editing of gpg encrypted files.
call dein#add('jamessan/vim-gnupg', {
  \ 'if': s:has_exec('gpg') || s:has_exec('gpg2'),
\ })

" vim-textob-css: Text objects for working with CSS
call dein#add('jasonlong/vim-textobj-css', {
  \ 'depends': 'vim-textobj-user',
  \ 'on_ft': ['css', 'html'],
\ })

" semantic-highlight.vim: Every variable is a different color
" config: localcfg/semantic-highlight.vim
call dein#add('jaxbot/semantic-highlight.vim', {
  \ 'on_cmd': 'SemanticHighlight',
\ })

" vim-editqf: Edit and store quickfix/location list entries.
" config: localcfg/plugin_vim_editqf.vim
call dein#add('jceb/vim-editqf', {
  \ 'if': has('quickfix'),
  \ 'on_cmd':
  \   s:prefix('Loc', ['AddNote', 'Load', 'Save'])
  \   + s:prefix('QF', ['AddNote', 'Load', 'Save']),
  \ 'on_map': {'n': '<LocalLeader>n'},
\ })

" fzf: Basic fzf integration
" config: localcfg/plugin_fzf.vim
call dein#add('junegunn/fzf', {
  \ 'if': s:has_exec('fzf'),
  \ 'on_cmd': 'FZF',
  \ 'on_func': 'fzf#run',
\})

" fzf.vim: Advanced fzf integration
" config: localcfg/plugin_fzf_vim.vim
"
" This isn't all the commands, just the most used.
call dein#add('junegunn/fzf.vim', {
  \ 'depends': 'fzf',
  \ 'if': s:has_exec('fzf'),
  \ 'on_cmd': s:prefix('FZF',
  \   ['Ag', 'Buffers', 'Colors', 'Commands', 'Files', 'GFiles',
  \    'History', 'Lines', 'Maps', 'Marks', 'Snippets', 'Windows']),
\ })

" vim-sneak: Motion improved
" config: localcfg/plugin_vim_sneak.vim
call dein#add('justinmk/vim-sneak', {
  \ 'depends': 'vim-repeat',
  \ 'if': v:version >= 703,
  \ 'on_map': {
  \   'n': ['S', 's'],
  \   'o': ['Z', 'z'],
  \   'x': ['Z', 's'],
  \ },
\ })

" vim-textobj-user: Create your own textobjects
call dein#add('kana/vim-textobj-user', {
  \ 'on_func': 'textobj',
\ })

" vim-signature: A plugin to place, toggle and display marks.
"
" http://witkowskibartosz.com/blog/using-markings-and-vim-signature-plugin.html
call dein#add('kshenoy/vim-signature', {
  \ 'if': has('signs'),
\ })

" rainbow: Highlight parentheses in different colors.
" config: localcfg/plugin_rainbow.vim
call dein#add('luochen1990/rainbow')

" localcfg: Help for customising based on features
" config: vimrc.d/localcfg.vim
call dein#add('https://gitlab.com/magus/localcfg')

" emmet-vim: Plugins for HTML and CSS
" config: localcfg/plugin_emmet_vim.vim
call dein#add('mattn/emmet-vim', {
  \ 'if': v:version >= 700,
  \ 'on_ft': ['html', 'xml', 'xsl'],
\ })

" undotree: Display your undotree in a graph.
" config: localcfg/plugin_undotree.vim
call dein#add('mbbill/undotree', {
  \ 'if': v:version >= 700,
  \ 'on_cmd': 'UndotreeToggle',
\ })

" vim-startify: The fancy start screen.
" config: localcfg/plugin_vim_startify.vim
call dein#add('mhinz/vim-startify')

" vim-bufmrp: Order buffers in Most Recently Used order
" config: localcfg/plugin_vim_bufmru.vim
call dein#add('mildred/vim-bufmru', {
  \ 'on_cmd': 'BufMRU',
  \ 'on_map': {'n': '[bufmru]'},
\ })

" vim-bbye: Delete buffers without breaking your layout
" config: localcfg/plugin_vim_bbye.vim
call dein#add('moll/vim-bbye', {
  \ 'on_cmd': ['Bdelete', 'Bwipeout'],
  \ 'on_map': {'n': '<LocalLeader>q'},
\ })

" vim-clevertab: Smart tab key
" config: localcfg/plugin_vim_clevertab.vim
call dein#add('neitanod/vim-clevertab')

" vim-textobj-quote: Better support for curly quote characters
" config: localcfg/plugin_vim_textobj_quote.vim
call dein#add('reedes/vim-textobj-quote', {
  \ 'depends': 'vim-textobj-user',
  \ 'on_cmd': 'ToggleEducate',
  \ 'on_ft': ['gitcommit', 'gitrebase', 'rst', 'markdown', 'text'],
\ })

" vim-qlist: Make working with the quickfix list smoother.
call dein#add('romainl/vim-qlist', {
  \ 'if': has('quickfix'),
  \ 'on_cmd': s:suffix('list', ['D', 'I']),
  \ 'on_map': {'n': ['[D', ']D', 'I', ']I']},
\ })

" committia.vim: More pleasant editing on commit message.
" config: localcfg/plugin_committia_vim.vim
call dein#add('rhysd/committia.vim', {
  \ 'if': s:has_exec('git'),
\ })

" gundo.vim: Graph your undo tree
" config: localcfg/plugin_gundo_vim.vim
call dein#add('sjl/gundo.vim', {
  \ 'if': has('pythonx') && v:version >= 703,
  \ 'on_cmd': 'GundoToggle',
\ })

" vim-vimlint: Linter for vim script
call dein#add('syngan/vim-vimlint', {
  \ 'depends': 'vim-vimlparser',
  \ 'on_cmd': 'VimLint',
  \ 'on_ft': 'vim'
\ })

" vim-maximizer: Maximizes and restores the current window
" config: localcfg/plugin_vim_maximizer.vim
call dein#add('szw/vim-maximizer', {
  \ 'on_cmd': 'MaximizerToggle',
  \ 'on_map': {'n': '<C-w>o'},
\ })

" vim-expand-region: Incremental visual selection
call dein#add('terryma/vim-expand-region', {
  \ 'on_map': {'nv': ['+', '-']},
\ })

" vim-multiple-cursors: True Sublime Text multiple selection
call dein#add('terryma/vim-multiple-cursors', {
  \ 'on_map': '<C-n>',
\ })

" wordnet.vim: Lookup word definitions with wordnet
" localcfg/plugin_wordnet_vim.vim
call dein#add('timcharper/wordnet.vim', {
  \ 'if': s:has_exec('wn'),
  \ 'on_map': '<Leader>wn',
\ })

" vim-exchange: Easy text exchange operator
" localcfg/plugin_vim_exchange.vim
call dein#add('tommcdo/vim-exchange', {
  \ 'on_map': {
  \   'n': 'cx',
  \   'v': 'X',
  \ },
\ })

" vim-commentary: Comment out code
call dein#add('tpope/vim-commentary', {
  \ 'on_cmd': 'Commentary',
  \ 'on_map': 'gc',
\ })

" vim-endwise: Automatically insert block closing structures
call dein#add('tpope/vim-endwise', {
  \ 'on_event': 'InsertEnter',
\ })

" vim-fugitive: A Git wrapper so awesome, it should be illegal.
" config: localcfg/plugin_vim_fugitive.vim
call dein#add('tpope/vim-fugitive', {
  \ 'if': s:has_exec('git'),
\ })

" vim-jdaddy: JSON manipulation and pretty printing
call dein#add('tpope/vim-jdaddy', {
  \ 'on_ft': 'json',
\ })

" vim-obsession: Continuously updated session files.
call dein#add('tpope/vim-obsession', {
  \ 'hook_post_source': s:airline_enable('obsession'),
  \ 'on_cmd': 'Obsession',
\ })

" vim-projectionist: Project configuration
" config: localcfg/plugin_vim_projectionist.vim
call dein#add('tpope/vim-projectionist')

" vim-repeat: Repeat for plugin maps.
"
" Make `.` work how you think it works.
call dein#add('tpope/vim-repeat')

" vim-rsi: Readline style insertion
call dein#add('tpope/vim-rsi', {
  \ 'on_event': ['CmdlineEnter', 'InsertEnter'],
\ })

" vim-sensible: One step above nocompatible
call dein#add('tpope/vim-sensible', {
  \ 'rev': 'v1.2',
\ })

" vim-sleuth: Heuristically set buffer options.
"
" Automagic indentation configuration that just works.
call dein#add('tpope/vim-sleuth', {
  \ 'on_cmd': 'Sleuth',
\ })

" vim-surround: Plugin for deleting, changing, and adding 'surroundings'
call dein#add('tpope/vim-surround', {
  \ 'depends': 'vim-repeat',
  \ 'on_map': {
  \   'i': ['<C-g>S', '<C-g>s', '<C-s>'],
  \   'n': ['cS', 'cs', 'ds', 'yS', 'ys'],
  \   'x': 'S',
  \ },
\ })

" vim-unimpaired: Pairs of handy mappings
" config: localcfg/plugin_vim_unimpaired.vim
call dein#add('tpope/vim-unimpaired')


" vim-indent-object: Text objects based on indent levels
"call dein#add('michaeljsmith/vim-indent-object', {
"  \ 'on_ft': ['python'],
"  \ 'on_map': {'ov': ['aI', 'ai', 'iI', 'ii']},
"\ })

" braceless.vim: Text objects, folding, and more for indented languages.
call dein#add('tweekmonster/braceless.vim', {
  \ 'on_cmd': 'BracelessEnable',
  \ 'on_ft': ['python', 'yaml'],
\ })

" startuptime: 1ms could mean the difference between life and death.
call dein#add('tweekmonster/startuptime.vim', {
  \ 'on_cmd': 'StartupTime',
\ })

" vim-airline: Lean & mean status / tabline for vim that's light as air
" config: localcfg/plugin_vim_airline.vim
call dein#add('vim-airline/vim-airline', {
  \ 'depends': [
  \   'vim-fugitive',
  \ ],
\ })

" vim-line: Inner Line text object
call dein#add('vim-utils/vim-line', {
  \ 'on_map': {'ov': '_'},
\ })

" vim-man: Enhanced man support
call dein#add('vim-utils/vim-man', {
  \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
\ })

" vim-vertical-move: Motions to move a cursor without changing the column
call dein#add('vim-utils/vim-vertical-move', {
  \ 'on_map': ['[v', ']v'],
\ })

" targets: Provides additional text objects
call dein#add('wellle/targets.vim')

" vim-vimlparser: VNimscript parser
call dein#add('ynkdir/vim-vimlparser', {
  \ 'on_cmd': 'VimLint',
  \ 'on_ft': 'vim',
\ })

" vim-code-dark (theme)
call dein#add('tomasiser/vim-code-dark')
