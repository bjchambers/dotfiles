" Use custom maps
call MnemonicMap('vebugger', {'local': v:true})
let g:vebugger_leader='[vebugger]'

" Configure symbols
let g:vebugger_breakpoint_text = '⇒'
let g:vebugger_currentline_text = '●'

" Use Python 3 as default
let g:vebugger_path_python_lldb = "python3"
