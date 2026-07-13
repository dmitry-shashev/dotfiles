-- go to split
vim.keymap.set('n', 'gv', function()
  vim.cmd('vsp')
  require('telescope.builtin').lsp_definitions({})
end)

-- get all uses
vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references({})
end)

-- go to definition
vim.keymap.set('n', 'gd', function()
  require('telescope.builtin').lsp_definitions({})
end)

vim.keymap.set('n', ';<space>', vim.lsp.buf.code_action)

return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("bashls", {
      filetypes = { "sh", "zsh" },
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })

    vim.lsp.config("emmet_language_server", {
      filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
      init_options = {
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = true,
        syntaxProfiles = {},
        variables = {},
      },
    })

    vim.lsp.config("eslint", {
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })

        vim.keymap.set('n', "'<space>", function()
          vim.lsp.buf.code_action({
            filter = function(action)
              return string.find(action.title, "import")
            end,
            apply = true,
          })
          vim.lsp.buf.code_action({
            filter = function(action)
              return string.find(action.title, "Update the dependencies array")
            end,
            apply = true,
          })
        end, { buffer = bufnr })
      end,
    })

    vim.lsp.config("cssls", { capabilities = capabilities })
    vim.lsp.config("jsonls", { capabilities = capabilities })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("yamlls", {})

    vim.fn.setenv("CPLUS_INCLUDE_PATH", "/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11")
    vim.lsp.config("ccls", {
      init_options = {
        index = { threads = 0 },
        clang = { excludeArgs = { "-frounding-math" } },
      },
    })

    vim.lsp.config("ruff", {
      cmd = { "./venv/bin/ruff", "server" },
      root_markers = { ".git", "pyproject.toml" },
    })

    vim.lsp.enable({
      "bashls",
      "ts_ls",
      "emmet_language_server",
      "eslint",
      "cssls",
      "jsonls",
      "html",
      "yamlls",
      "ccls",
      "ruff",
    })
  end,
}
