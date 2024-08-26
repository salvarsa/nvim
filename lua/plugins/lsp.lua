return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	--con esto cargo el servidor de lenguajes
	config = function()
	  --vim.keymaps.set('n', '<space>', vim.diagnostic.open_float)
		--vim.keymaps.set('n', '[d', vim.diagnostic.goto_prev)
		--vim.keymaps.set('n', ']d', vim.diagnostic.goto_next)
		--vim.keymaps.set('n', '<space>q', vim.diagnostic.setloclist)

		local on_attach = function(_, bufnr)
			vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})
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
	end
}
