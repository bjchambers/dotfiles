" Prepare localcfg to read optional configs
let g:localcfg_cfgs = []

" Build dependent settings
let g:localcfg_features = [
  \ 'autocmd', 'diff', 'gui_macvim', 'gui_running', 'menu', 'quickfix',
  \ 'spell',
\ ]

" Dein managed packages
" Disabled projects may provide optional negative configs for alternatives.
for s:bundle in values(dein#get())
  let s:enabled = get(s:bundle, 'if', v:true)
  let s:cfgname = 'plugin_' . substitute(s:bundle.name, '[-.]', '_', 'g')
  let g:localcfg_cfgs += [(s:enabled ? '' : 'not') . s:cfgname]
endfor

" Read defined configs
call localcfg#docfg()
