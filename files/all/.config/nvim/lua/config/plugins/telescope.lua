-- brew install rg

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    function vim.getVisualSelection()
      vim.cmd('noau normal! "vy"')
      local text = vim.fn.getreg('v')
      vim.fn.setreg('v', {})

      text = string.gsub(text, "\n", "")
      if #text > 0 then
        return text
      else
        return ''
      end
    end

    local opts = { noremap = true, silent = true }

    -- Telescope setup with ignored patterns
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "venv", "%.git/", "build", "dist", "%.idea/" }
      }
    })

    -- for visual mode we try to find the selected
    local tb = require('telescope.builtin')
    local keymap = vim.keymap.set
    keymap('v', ';f', function()
      local text = vim.getVisualSelection()
      tb.find_files({ default_text = text })
    end, opts)
    keymap('v', ';s', function()
      local text = vim.getVisualSelection()
      tb.live_grep({ default_text = text })
    end, opts)

    local map = vim.api.nvim_set_keymap
    map('n', ';f', ':<C-u>Telescope find_files<CR>', opts)
    map('n', ';s', ':<C-u>Telescope live_grep<CR>', opts)
  end
}
