vim.api.nvim_create_augroup("AutoFormatPrettier", {})

-- good improvement here could be using a prettier server
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
       -- it can also handle json, but script implementation
       -- works better
        pattern = "*.tsx,*.ts,*.js,*.jsx,*.css,*.scss,*.json",
        group = "AutoFormatPrettier",
        callback = function()
          if  io.open("./node_modules/.bin/prettier", "r") == nil then
            return
          end
          local buffer_path = vim.api.nvim_buf_get_name(0)
          local command = 'silent !./node_modules/.bin/prettier ' .. buffer_path .. ' --write'
          vim.cmd(command)
        end,
    }
)
