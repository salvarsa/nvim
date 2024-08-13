-- ~/.config/nvim/lua/config/keymaps.lua
vim.g.mapleader = ' ' 

vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^') 
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_') 
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') 
vim.keymap.set({'n', 'x'}, 'gy', '"+y') 
vim.keymap.set({'n', 'x'}, 'gp', '"+p') 
vim.keymap.set({'n', 'x'}, 'gP', '"+P') 
vim.keymap.set({'n', 'x'}, 'gx', '"+d') 
vim.keymap.set({'n', 'x'}, 'x', '"_x') 
vim.keymap.set({'n', 'x'}, 'X', '"_d') 
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>') 
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>') 
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>') 

-- Asegúrate de que Telescope esté cargado antes de usarlo
local telescope_status_ok, telescope = pcall(require, 'telescope.builtin')
if telescope_status_ok then
  vim.keymap.set('n', '<leader>f', telescope.find_files, {})
else
  vim.notify('Telescope no está cargado', vim.log.levels.ERROR)
end

-- Ensure Telescope is loaded before using it
local telescope_status_ok, builtin = pcall(require, 'telescope.builtin')
if telescope_status_ok then
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
else
  vim.notify('Telescope not loaded. Please check installation.', vim.log.levels.ERROR)
end


vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', {})

