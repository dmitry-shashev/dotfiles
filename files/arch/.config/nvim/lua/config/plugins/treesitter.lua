-- it adds highlights
return {
  "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "gitignore",
        "graphql",
        "http",
        "scss",
        "sql",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
}
