lua require('settings')
lua require('keymaps')

augroup yank_hightlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=150 }
augroup END

" https://qiita.com/delphinus/items/aea16e82de2145d2a6b7
augroup terminal
  autocmd!
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  autocmd TermOpen * setlocal nocursorline nonumber norelativenumber
augroup END
