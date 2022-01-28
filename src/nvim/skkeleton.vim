imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
    \   'eggLikeNewline': v:true,
    \   'markerHenkan': '-',
    \   'markerHenkanSelect': '+',
    \ })
  call skkeleton#register_kanatable('rom', {
    \   "z\<Space>": ["\u3000", ''],
    \   'z-': ['―', ''],
    \   'z/': ['・', ''],
    \
    \   '!': ['！', ''],
    \   '$': ['＄', ''],
    \   '&': ['＆', ''],
    \   '(': ['（', ''],
    \   ')': ['）', ''],
    \   '*': ['＊', ''],
    \   '+': ['＋', ''],
    \   '/': ['／', ''],
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
