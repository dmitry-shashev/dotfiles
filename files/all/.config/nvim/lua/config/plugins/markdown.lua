return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      enabled = true,
      file_types = { "markdown" },
      code = {
        style = "full",
        disable_background = { "diff" },
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      local function set_reader_keymap(bufnr)
        vim.keymap.set("n", ";r", function()
          require("render-markdown").buf_toggle()
        end, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          desc = "Toggle Markdown reader",
        })
      end

      set_reader_keymap(vim.api.nvim_get_current_buf())

      local group = vim.api.nvim_create_augroup("MarkdownReaderKeymap", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "markdown",
        callback = function(args)
          set_reader_keymap(args.buf)
        end,
      })
    end,
  },
}
