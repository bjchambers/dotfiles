" Use custom maps
call MnemonicMap('gitgutter')
let g:gitgutter_map_keys = v:false

for [s:key, s:cmd] in [
  \   ['Down',  'NextHunk'],
  \   ['Up',    'PrevHunk'],
  \   ['Space', 'Toggle'],
  \ ]
  execute 'nnoremap <silent> [gitgutter]<' . s:key . '> '
    \ ':GitGutter' . s:cmd . '<CR>'
endfor
nnoremap <silent> [gitgutter]p :GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]q :GitGutterQuickFix<CR>

" If you have more than 100 edits, you should probably commit
let g:gitgutter_max_signs = 100

" Use location list for GitGutterQuickFix output
let g:gitgutter_use_location_list = v:true

" Configure symbols
if has('gui_running')
  let g:gitgutter_sign_added              = ''
  let g:gitgutter_sign_modified           = ''
  let g:gitgutter_sign_removed            = ''
  let g:gitgutter_sign_removed_first_line = '˙'
  let g:gitgutter_sign_modified_removed   = ''
endif

" Don't override sign column
let g:gitgutter_override_sign_column_highlight = v:false

" Use fancy icons for signs if possible
if has('gui_running')
  for [s:icon, s:signs] in items({
    \   'list-add': ['Added'],
    \   'edit-copy': ['Modified'],
    \   'list-remove': ['Removed', 'RemovedFirstLine', 'ModifiedRemoved']
    \ })
    for s:sign in s:signs
      execute 'sign define GitGutterLine' . s:sign .
          \ ' icon=' . expand('~/.vim/icons/' . s:icon . '.png')
    endfor
  endfor
endif
