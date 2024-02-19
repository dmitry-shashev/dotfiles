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

          -- we need it here in order to be sure that we backup it after formatting
          if not (io.open("./.gitignore", "r") == nil) then
            local command = 'silent !node ~/scripts/zsh/extra/backup.js ' .. vim.fn.getcwd()
            vim.cmd(command)
          end
        end,
    }
)
