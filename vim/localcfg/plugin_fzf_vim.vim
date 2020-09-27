" Without a prefix, the exported commands shadow others
let g:fzf_command_prefix = 'FZF'

" Jump to existing windows when possible
let g:fzf_buffers_jump = 1

" Configure convenience mappings for common usage
call MnemonicMap('fzf', {'key': '`'})
for s:cmd in ['Ag', 'Buffers', 'Commands', 'Files', 'GFiles',
  \         'Lines', 'Maps', 'Marks', 'Windows']
  execute 'nmap <silent> [fzf]' . tolower(s:cmd[0]) . ' ' .
  \   ':FZF' . s:cmd . '<CR>'
endfor
