return {
  {
    -- smooth scrolling
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({
        -- easing_function = 'quadratic'
      })
      local t = {}
      t[';u'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
      t[';d'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
      require('neoscroll.config').set_mappings(t)
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
}
