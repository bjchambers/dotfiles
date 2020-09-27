" Use the faster C version when available
if executable('editorconfig')
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = 'editorconfig'
endif

" We manage colorcolumn, so disable this plugins support
let g:EditorConfig_max_line_indicator = 'none'

" Ignore vim-fugitive buffers
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
