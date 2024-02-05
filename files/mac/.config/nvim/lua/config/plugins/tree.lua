return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim"},
  config = function()
    local map = vim.api.nvim_set_keymap
    local default_opts = {noremap = true, silent = true}
    map('n', ';n', ':<C-u>Neotree toggle<CR>', default_opts)
    map('n', ';t', ':<C-u>Neotree<CR>', default_opts)
    map('n', "'t", ':<C-u>Neotree filesystem reveal<CR>', default_opts)
    map('n', ";m", ':<C-u>Neotree float git_status<CR>', default_opts)

    vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
      {text = "󰌵", texthl = "DiagnosticSignHint"})

    require("neo-tree").setup({
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      close_if_last_window = true,
      window = {
        width = 56,
        mappings = {
          ["z"] = "close_node",
          ["Z"] = "close_all_nodes",
        }
      },
      buffers = {
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            ".idea",
            ".git",
            ".husky",
            ".github"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db"
          },
        },
      },
    })
  end
}

