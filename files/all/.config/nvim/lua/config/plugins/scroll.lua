return {
  {
    -- smooth scrolling
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({
        mappings = {
          [';u'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}},
          [';d'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
        }
      })
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
}
