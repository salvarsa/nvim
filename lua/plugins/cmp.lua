return {
  -- Autocompletado
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',  -- Fuente para LSP
      'hrsh7th/cmp-buffer',    -- Fuente para buffer
      'hrsh7th/cmp-path',      -- Fuente para rutas
      'hrsh7th/cmp-cmdline',   -- Fuente para línea de comandos
      'L3MON4D3/LuaSnip',      -- Motor de snippets
      'saadparwaiz1/cmp_luasnip', -- Fuente para LuaSnip
      'onsails/lspkind-nvim',  -- Añade iconos a las sugerencias
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind') -- Añade iconos a las sugerencias

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Usa LuaSnip para expandir snippets
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
            },
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- Configuración para la línea de comandos
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
      })

      -- Configura el LSP
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        capabilities = capabilities
      }
    end
  },
  -- Otros plugins...
}

