function updateBackup()
  vim.fn.timer_start(5000, function()
    if not (io.open("./.gitignore", "r") == nil) then
      local command = 'silent !node ~/scripts/zsh/extra/backup.js ' .. vim.fn.getcwd()
      vim.cmd(command)

      updateBackup()
    end
  end)
end

updateBackup()

