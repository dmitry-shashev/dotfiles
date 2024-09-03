-- transparent.lua contains opacity
-- vim.o.bg="light"

-- return {
--    "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme tokyonight]])
--     end,
-- }

-- return {
--     "sainnhe/everforest",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme everforest]])
--     end,
-- }

-- return {
--    "catppuccin/nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme catppuccin]])
--     end,
-- }

-- return {
--    "rose-pine/neovim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme rose-pine]])
--     end,
-- }

-- return {
--    "rmehri01/onenord.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme onenord]])
--     end,
-- }

-- return {
--    "morhetz/gruvbox",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme gruvbox]])
--     end,
-- }

-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "lighter"
-- return {
--     "marko-cerovac/material.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme material]])
--     end,
-- }

return {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_light')
  end,
}
