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

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.cpp,*.h",
        group = "AutoFormatPrettier",
        callback = function()
            local buffer_path = vim.api.nvim_buf_get_name(0)
            local command = 'silent !clang-format -i ' .. buffer_path
            vim.cmd(command)
        end,
    }
)

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormatPrettier",
        callback = function()
            local buffer_path = vim.api.nvim_buf_get_name(0)
            local command = 'silent !./venv/bin/black ' .. vim.fn.shellescape(buffer_path) .. ' --target-version=py39 --line-length=120'
            vim.cmd(command)
        end,
    }
)
