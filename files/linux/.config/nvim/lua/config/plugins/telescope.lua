return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local map = vim.api.nvim_set_keymap
    local default_opts = {noremap = true, silent = true}
    map('n', ';f', ':<C-u>Telescope find_files<CR>', default_opts)
    map('n', ';s', ':<C-u>Telescope live_grep<CR>', default_opts)
  end
}
