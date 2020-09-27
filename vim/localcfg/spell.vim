" Automatically rebuild spellfile on write
augroup ben_spell
  autocmd BufWritePost ~/.vim/spell/*.add silent mkspell! %
augroup END
