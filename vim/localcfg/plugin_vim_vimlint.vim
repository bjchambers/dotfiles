" Prefer quickfix integration
let g:vimlint#config = {'output': 'quickfix'}

" Disable timing
let g:vimlint#config['quiet'] = v:true

" And need lint to use abort
let g:vimlint#config['func_abort'] = v:true
