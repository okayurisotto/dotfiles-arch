" dein {{{

let s:dein_dir = expand('$XDG_DATA_HOME/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:config_dir = expand('$XDG_CONFIG_HOME/nvim')

execute 'set runtimepath+=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)

call dein#add('vim-denops/denops.vim')
call dein#add('vim-skk/skkeleton.vim')

call dein#end()

filetype plugin indent on
syntax enable

execute 'source ' . s:config_dir . '/skkeleton.vim'

" }}}
lua require('settings')
lua require('keymaps')

" autocmd {{{

augroup yank_hightlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=150 }
augroup END

" https://qiita.com/delphinus/items/aea16e82de2145d2a6b7
augroup terminal
  autocmd!
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  autocmd TermOpen * setlocal nocursorline nonumber
augroup END

" }}}
