return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local select_opts = {behavior = cmp.SelectBehavior.Insert}

      -- See :help cmp-config
      cmp.setup({
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        sources = {
          {name = 'luasnip', keyword_length = 1},
          {name = 'path'},
          {name = 'nvim_lsp', keyword_length = 1},
          {name = 'nvim_lsp_signature_help'},
          {name = 'buffer', keyword_length = 100},
        },
        window = {
          documentation = cmp.config.window.bordered()
        },
        formatting = {
          fields = {'menu', 'abbr', 'kind'},
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = '',
              luasnip = '',
              buffer = '',
              path = '',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
        -- See :help cmp-mapping
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),

          ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({select = false}),

          ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, {'i', 's'}),

          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i', 's'}),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
      })
    end,
  },
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-nvim-lsp'},

}
