vim.api.nvim_create_augroup("AutoFormatJson", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.json",
        group = "AutoFormatJson",
        callback = function()
          local formatter_path = '~/.config/nvim/lua/scripts/json-format.js'
          local buffer_path = vim.api.nvim_buf_get_name(0)
          vim.fn.system('node ' .. formatter_path .. ' ' ..buffer_path)
          vim.cmd('e')
        end,
    }
)
