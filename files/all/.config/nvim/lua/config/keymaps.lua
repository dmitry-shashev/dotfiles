local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- undo till space instead of the line
map('i', '<space>', "<Space><C-g>u", default_opts)

-- copy file/folder path
map('n', 'yf', ":let @+=expand('%:p')<CR>", default_opts)
map('n', 'yd', ":let @+=expand('%:p:h')<CR>", default_opts)

-- close buffer/tab
map('n', 'q', ':wq<CR>', default_opts)
map('n', 'Q', ':<C-u>tabclose<CR>', default_opts)

-- copy till the end of the line
map('n', 'Y', 'y$', default_opts)

-- save on double space
map('n', '<space><space>', '<Esc>:<C-u>w<CR>', default_opts)

-- splits
map('n', ';v', ':vsp<CR>', default_opts)
map('n', ';b', ':sp<CR>', default_opts)

-- resize splits
map('n', '_', ':<C-u>resize +5<CR>', default_opts)
map('n', '+', ':<C-u>resize -5<CR>', default_opts)
map('n', '-', ':<C-u>vertical resize +5<CR>', default_opts)
map('n', '=', ':<C-u>vertical resize -5<CR>', default_opts)

-- splits navigation
map('n', 'gh', '<C-W><C-H>', default_opts)
map('n', 'gj', '<C-W><C-J>', default_opts)
map('n', 'gk', '<C-W><C-K>', default_opts)
map('n', 'gl', '<C-W><C-L>', default_opts)

-- jump navigation
map('n', 'gi', '<C-I>', default_opts)
map('n', 'go', '<C-O>', default_opts)

-- bookmarks
map('i', '<M-f>', '<ESC>', default_opts)
map('v', '<M-f>', '<ESC>', default_opts)
map('n', 'ma', 'mA', default_opts)
map('n', '<space>a', '`Azz<C-e>', default_opts)
map('n', 'ms', 'mS', default_opts)
map('n', '<space>s', '`Szz<C-e>', default_opts)
map('n', 'md', 'mD', default_opts)
map('n', '<space>d', '`Dzz<C-e>', default_opts)
map('n', 'mf', ':delmarks A<CR>:delmarks S<CR>:delmarks D<CR>', default_opts)


-- jump to errors
vim.keymap.set('n', '<space>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>j', vim.diagnostic.goto_next)

-- apply prettier
vim.keymap.set('n', ';p', function()
  local buffer_path = vim.api.nvim_buf_get_name(0)
  local command = 'silent !prettier ' .. buffer_path .. ' --write --config ~/.config/prettier/.prettierrc.json --ignore-path'
  vim.cmd('w')
  vim.cmd(command)
  print('prettier formatting applied')
end)

