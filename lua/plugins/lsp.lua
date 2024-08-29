return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tsserver",
      }
    })

		 local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end

		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				lua = {
					telemetry = {enable = false},
					workspace  = { checkThirdParty = false }
				}
			}
		})

	-- Configuración del servidor HTML (html)
    require("lspconfig").html.setup({
      on_attach = on_attach,
    })

    -- Configuración del servidor CSS (cssls)
    require("lspconfig").cssls.setup({
      on_attach = on_attach,
    })

    -- Configuración del servidor TypeScript/JavaScript (tsserver)
    require("lspconfig").tsserver.setup({
      on_attach = on_attach,
    })
  end
}
