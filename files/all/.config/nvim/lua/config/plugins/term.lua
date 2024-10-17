local venv_activated = false
local node_path_added = false

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 50,
    open_mapping = [[<F12>]],
    direction = "horizontal",
    on_open = function(term)
      local venv_path = "./venv/bin/activate"
      local node_bin = "./node_modules/.bin"

      vim.defer_fn(function()
        -- Activate Python venv
        if not venv_activated and vim.fn.filereadable(venv_path) == 1 then
          term:send("\r. " .. venv_path .. "\r", false)
          venv_activated = true

          vim.defer_fn(function()
            term:send("clear", false)
            venv_activated = true
          end, 10)
        end

        -- Add node_modules/.bin to PATH
        if not node_path_added and vim.fn.isdirectory(node_bin) == 1 then
          -- Prepend node bin path to PATH
          term:send("export PATH=" .. node_bin .. ":$PATH\r", false)
          node_path_added = true

          vim.defer_fn(function()
            term:send("clear", false)
            venv_activated = true
          end, 10)
        end
      end, 100)
    end,
  }
}
