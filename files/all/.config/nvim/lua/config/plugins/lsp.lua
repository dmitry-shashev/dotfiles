-- due to problems with LSP - restart it on save
-- vim.api.nvim_create_augroup("AutoRestart_LSP", {})
-- vim.api.nvim_create_autocmd(
--     "BufWritePost",
--     {
--         pattern = "*.{js,jsx,ts,tsx}",
--         group = "AutoRestart_LSP",
--         callback = function()
--           vim.cmd('LspRestart')
--         end,
--     }
-- )



-- go to split
vim.keymap.set('n', 'gv', function()
  vim.cmd('vsp')
  require('telescope.builtin').lsp_definitions({})
end, { buffer = bufnr })

-- get all uses
vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references({})
end, { buffer = bufnr })

-- go to definition
vim.keymap.set('n', 'gd', function()
  require('telescope.builtin').lsp_definitions({})
end, { buffer = bufnr })

vim.keymap.set('n', ';<space>', vim.lsp.buf.code_action, { buffer = bufnr })



return {
  "neovim/nvim-lspconfig",
  config = function ()

    -- sudo npm i -g bash-language-server
    require("lspconfig").bashls.setup {
      filetypes = {"sh", "zsh"};
    }

    -- sudo npm install -g typescript typescript-language-server
    require("lspconfig").ts_ls.setup({ capabilities = capabilities })

    -- sudo npm i -g @olrtg/emmet-language-server
    require("lspconfig").emmet_language_server.setup({
      filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
      -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
      -- **Note:** only the options listed in the table are supported.
      init_options = {
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = true,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
      },
    })

    -- sudo npm install -g eslint
    -- next contains eslint/cssls/jsonls
    -- sudo npm i -g vscode-langservers-extracted
    require("lspconfig").eslint.setup {
      on_attach = function(client, bufnr)
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
    }

    -- It shows css errors and extend the auto-completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require('lspconfig').cssls.setup {
      capabilities = capabilities,
    }

    -- it shows json errors
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require'lspconfig'.jsonls.setup {
      capabilities = capabilities,
    }

    -- html
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require'lspconfig'.html.setup {
      capabilities = capabilities,
    }

    -- sudo npm i -g yaml-language-server
    require'lspconfig'.yamlls.setup({})

    -- sudo npm i -g prettier
    
    -- sudo apt install ccls
    -- each cpp project must contain ".git" folder
    vim.fn.setenv("CPLUS_INCLUDE_PATH", "/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11")
    require'lspconfig'.ccls.setup {
      init_options = {
        index = {
          threads = 0;
        };
        clang = {
          excludeArgs = { "-frounding-math"};
        };
      }
    }

    -- pip install ruff
  local lspconfig = require('lspconfig')
  lspconfig.ruff.setup({
    cmd = { "./venv/bin/ruff", "server" },
    root_dir = lspconfig.util.root_pattern(".git", "pyproject.toml")
  })

  end
}
