-- it adds highlights
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

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = function()
    require("nvim-treesitter").install(parsers):wait(300000)
  end,
  config = function()
    require("nvim-treesitter").setup({})

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
