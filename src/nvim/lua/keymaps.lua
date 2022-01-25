local set_keymap = function(modes, lhs, rhs)
  for _, mode in pairs(modes) do
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
  end
end

-- cursor {{{

set_keymap({ 'n', 'v' }, 'gj',  'j')
set_keymap({ 'n', 'v' }, 'gk',  'k')
set_keymap({ 'n', 'v' },  'j', 'gj')
set_keymap({ 'n', 'v' },  'k', 'gk')

-- https://postd.cc/how-to-boost-your-vim-productivity/
set_keymap({ 'n', 'v' }, 'p', 'p`]')
set_keymap({      'v' }, 'y', 'y`]')

set_keymap({ 'c' }, '<C-f>', '<Right>');
set_keymap({ 'c' }, '<C-b>', '<Left>');

-- }}}

-- fold {{{

set_keymap({ 'n' }, '<Tab>', ':foldopen<CR>');
set_keymap({ 'n' }, '<S-Tab>', ':foldclose<CR>');

-- }}}

-- indent {{{

set_keymap({ 'n' }, '<S-h>', '<<');
set_keymap({ 'n' }, '<S-l>', '>>');

-- }}}

-- scroll {{{

set_keymap({ 'n', 'v' }, '<S-j>', '<C-e>')
set_keymap({ 'n', 'v' }, '<S-k>', '<C-y>')

set_keymap({ 'n' }, '<C-j>', '<S-j>')

-- }}}

-- search {{{

set_keymap({ 'n' }, '<C-c><C-c>', ':nohlsearch<CR>')

set_keymap({ 'n', 'v' }, 'n', 'nzz')
set_keymap({ 'n', 'v' }, 'N', 'Nzz')

-- }}}

-- <Leader> {{{

set_keymap({ 'n', 'v' }, '<Leader><CR>',     ':')
set_keymap({ 'n', 'v' }, '<Leader><Leader>', 'zz')
set_keymap({ 'n', 'v' }, '<Leader>h',        '0')
set_keymap({ 'n', 'v' }, '<Leader>j',        'G')
set_keymap({ 'n', 'v' }, '<Leader>k',        'gg')
set_keymap({ 'n', 'v' }, '<Leader>l',        '$')

set_keymap({ 'n' }, '<Leader>q', ':q<CR>')
set_keymap({ 'n' }, '<Leader>w', ':w<CR>')

-- }}}

-- <C-f> {{{

local prefixes = {
  ['n'] = '',
  ['i'] = '<Esc>',
  ['t'] = '<C-\\><C-N><Esc>',
}
local entries = {
  ['-'] =     ':split<CR>',
  ['<CR>'] =  ':',
  ['<Esc>'] = '',
  ['H'] =     '<C-w>H',
  ['J'] =     '<C-w>J',
  ['K'] =     '<C-w>K',
  ['L'] =     '<C-w>L',
  ['\\'] =    ':vsplit<CR>',
  ['h'] =     '<C-w>h',
  ['j'] =     '<C-w>j',
  ['k'] =     '<C-w>k',
  ['l'] =     '<C-w>l',
}

for mode, prefix in pairs(prefixes) do
  for input, output in pairs(entries) do
    set_keymap({ mode }, '<C-f>' .. input, prefix .. output)
  end
end

-- }}}
