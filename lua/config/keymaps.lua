local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mapeos para navegar entre paneles
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Mapeos para cortar, copiar y pegar
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- Guardar el archivo
map("n", "<leader>w", ":w<CR>")

-- Dividir ventanas
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")

-- Reemplazar la palabra bajo el cursor
map("n", "<leader>r", ":%s/<C-r><C-w>//g<Left><Left>", { silent = false })

-- Configuración específica de plugins
local M = {}

M.setup = function()
  -- Neo-tree
  map("n", "<leader>e", ":Neotree filesystem reveal left<CR>")
  map("n", "<leader>bf", ":Neotree buffers reveal float<CR>")
  map("n", "<leader>q", ":Neotree close<CR>")
end

return M
