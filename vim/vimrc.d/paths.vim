" XDG basedir compilant locations
let g:xdg_cache_dir = expand(empty($XDG_CACHE_HOME)
  \                          ? '~/.cache' : '$XDG_CACHE_HOME')
let g:xdg_config_dir = expand(empty($XDG_CONFIG_HOME)
  \                           ? '~/.config' : '$XDG_CONFIG_HOME')
let g:xdg_data_dir = expand(empty($XDG_DATA_HOME)
  \                         ? '~/.data' : '$XDG_DATA_HOME')

for s:name in ['cache', 'config', 'data']
  let s:path = 'vim_' . s:name . '_dir'
  execute 'let g:' . s:path . ' = g:xdg_' . s:name . "_dir . '/vim'"
  if !isdirectory(get(g:, s:path))
    call mkdir(get(g:, s:path), 'p')
  endif
endfor
