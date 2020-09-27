if exists('$PKG_LICENSE_DIR')
  let s:project_root_heuristic = 'Makefile|all.do|build.py|setup.py'
  let g:projectionist_heuristics = {s:project_root_heuristic: {}}
  for [s:f, s:t] in [
    \   ['COPYING', 'GPL-3'],
    \   ['COPYING.LIB', 'LGPL-3'],
    \   ['LICENSE', 'MIT']
    \ ]
    let g:projectionist_heuristics[s:project_root_heuristic][s:f] = {
      \   'template': readfile(expand('$PKG_LICENSE_DIR/') . s:t),
      \   'type': tolower(split(s:t, '-')[0]),
      \ }
  endfor
endif
