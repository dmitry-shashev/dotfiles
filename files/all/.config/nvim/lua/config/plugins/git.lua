return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signcolumn = true,
        numhl      = true,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', '<space>h', function()
            vim.schedule(function()
              gs.next_hunk()
              gs.preview_hunk()
            end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '<space>l', function()
            vim.schedule(function()
              gs.prev_hunk()
              gs.preview_hunk()
            end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '<space>L', function()
            vim.schedule(function()
              gs.reset_hunk()
            end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '<space>H', function ()
            if vim.wo.diff then
              vim.cmd('wincmd h')
              vim.cmd('q')
            else
              vim.schedule(function()
                gs.diffthis()
              end)
            end  
            return '<Ignore>'
          end, {})

          map('n', "'f", function ()
            require('telescope.builtin').git_status({})
          end, {})
        end
      }
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      local map = vim.api.nvim_set_keymap
      local default_opts = {noremap = true, silent = true}
      map('n', ';g', ':<C-u>GitBlameToggle<CR>', default_opts)
      map('n', ';G', ':<C-u>GitBlameCopyCommitURL<CR>:<C-u>GitBlameOpenCommitURL<CR>', default_opts)

      require("gitblame").setup { enabled = false }
    end,
  }
}
