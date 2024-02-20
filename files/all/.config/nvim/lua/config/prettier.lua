vim.api.nvim_create_augroup("AutoFormatPrettier", {})

-- good improvement here could be using a prettier server
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.tsx,*.ts,*.js,*.jsx,*.css,*.scss,*.json",
        group = "AutoFormatPrettier",
        callback = function()
          if not (io.open("./node_modules/.bin/prettier", "r") == nil) then
            local buffer_path = vim.api.nvim_buf_get_name(0)
            local command = 'silent !./node_modules/.bin/prettier ' .. buffer_path .. ' --write'
            vim.cmd(command)
          end
        end,
    }
)
