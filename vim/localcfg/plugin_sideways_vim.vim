" Enable custom key maps
call MnemonicMap('sideways', {'local': v:true})

for s:key in ['Left', 'Right']
  execute 'nnoremap <silent> [sideways]<' . s:key . '>' .
    \ ' :<C-u>Sideways' . s:key . '<CR>'
  execute 'nnoremap <silent> [sideways]<S-' . s:key . '>' .
    \ ' :<C-u>SidewaysJump' . s:key . '<CR>'
endfor
