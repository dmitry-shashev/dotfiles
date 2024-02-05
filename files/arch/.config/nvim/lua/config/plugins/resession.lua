return {
  'stevearc/resession.nvim',
  opts = {},
  config = function()



    local resession = require("resession")
    resession.setup({
      autosave = {
          enabled = true,
          interval = 60,
          notify = true,
        },
    })


    vim.keymap.set("n", ";o", function()
      if vim.fn.argc(-1) == 0 then
        resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
      end
    end)

    -- auto save session
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        if vim.fn.argc(-1) == 0 then
          resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
        end
      end,
    })
  end
}
