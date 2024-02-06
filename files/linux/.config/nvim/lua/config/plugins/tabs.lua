local theme = {
  fill = 'TabLineFill',
  head = 'TabLine',
  current_tab = 'TabLineSel',
  current_tab = { fg = '#F8FBF6', bg = '#896a98', style = 'italic' },
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter', dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()

    local map = vim.api.nvim_set_keymap
    local default_opts = {noremap = true, silent = true}
    map('n', 'gt', ':<C-u>tabedit<CR>', default_opts)
    map('n', ',', ':tabprevious<CR>', default_opts)
    map('n', '.', ':tabnext<CR>', default_opts)

    require('tabby.tabline').set(function(line)
      return {
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep(' [', hl, theme.fill),
            tab.number(),
            tab.name(),
            line.sep('] ', hl, theme.fill),
            hl = hl,
            margin = '-',
          }
        end),
        line.spacer(),
        hl = theme.fill,
      }
    end)
  end
}
