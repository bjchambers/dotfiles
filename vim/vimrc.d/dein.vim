" Make the dein submodule available
set runtimepath+=~/.vim/external/dein.vim

" Keep plugins and data in XDG basedir compliant location.
let g:dein_state_dir = g:vim_cache_dir . '/dein'
let g:dein_repos_dir = g:dein_state_dir . '/repos'

" Disable automatic re-caching
let g:dein#auto_recache = v:false

" If possible, support system notifications
if executable('notify-send') && exists('$DISPLAY')
  let g:dein#enable_notifications = v:true
endif

" Handle initial plugin configuration
if dein#load_state(g:dein_state_dir)
  call dein#begin(g:dein_state_dir, ['~/.vim/vimrc', '~/.vim/dein-packages.vim', expand('<sfile>')])

  source ~/.vim/dein-packages.vim

  call dein#end()
  call dein#save_state()
endif

call dein#call_hook('source')
call dein#call_hook('post_source')

if has('vim_starting')
  if dein#check_install()
    let v:warningmsg = 'dein: Missing plugins'
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
  endif
endif
