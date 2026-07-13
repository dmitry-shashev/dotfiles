-- it adds highlights
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  config = function()
    local parsers = {
      "bash",
      "css",
      "gitignore",
      "graphql",
      "html",
      "http",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "yaml",
    }

    require("nvim-treesitter").setup({})
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "css",
        "gitignore",
        "graphql",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "scss",
        "sh",
        "sql",
        "typescript",
        "typescriptreact",
        "yaml",
        "zsh",
      },
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
