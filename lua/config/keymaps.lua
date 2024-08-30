-- Mapeos para navegar entre paneles
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })  -- Mover a la ventana izquierda
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })  -- Mover a la ventana inferior
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })  -- Mover a la ventana superior
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })  -- Mover a la ventana derecha

-- Mapeos para cortar, copiar y pegar
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true }) -- Copiar al portapapeles del sistema
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true }) -- Pegar desde el portapapeles del sistema
vim.keymap.set("n", "<leader>d", '"_d', { noremap = true, silent = true }) -- Cortar sin guardar en el registro

-- Guardar el archivo
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Dividir ventanas
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true }) -- Dividir ventana verticalmente
vim.keymap.set("n", "<leader>s", ":split<CR>", { noremap = true, silent = true })  -- Dividir ventana horizontalmente

-- Reemplazar la palabra bajo el cursor
vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>//g<Left><Left>", { noremap = true, silent = false })
