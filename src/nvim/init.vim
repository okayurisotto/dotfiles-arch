" dein {{{

let s:dein_dir = expand('$XDG_DATA_HOME/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:config_dir = expand('$XDG_CONFIG_HOME/nvim')

execute 'set runtimepath+=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)

call dein#add('vim-denops/denops.vim')
call dein#add('vim-skk/skkeleton')

call dein#end()

filetype plugin indent on
syntax enable

" skkeleton {{{

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
    \   'eggLikeNewline': v:true,
    \   'globalJisyo': "~/.skk-dict.txt",
    \   'globalJisyoEncoding': "UTF-8",
    \   'markerHenkan': '-',
    \   'markerHenkanSelect': '+',
    \ })
  call skkeleton#register_kanatable('rom', {
    \   "z\<Space>": ["\u3000", ''],
    \   'z-': ['—', ''],
    \   'z/': ['・', ''],
    \
    \   '!': ['！', ''],
    \   '$': ['＄', ''],
    \   '&': ['＆', ''],
    \   '(': ['（', ''],
    \   ')': ['）', ''],
    \   '*': ['＊', ''],
    \   '+': ['＋', ''],
    \   '<': ['＜', ''],
    \   '=': ['＝', ''],
    \   '>': ['＞', ''],
    \   '@': ['＠', ''],
    \   '\': ['＼', ''],
    \   '{': ['｛', ''],
    \   '|': ['｜', ''],
    \   '}': ['｝', ''],
    \   '~': ['〜', ''],
    \ })
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

" }}}

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
