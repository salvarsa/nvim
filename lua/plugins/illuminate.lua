return {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure({
      providers = {
        'regex',
      },
      delay = 200,  -- Tiempo de retardo antes de resaltar las coincidencias (en milisegundos)
      filetypes_denylist = {  -- Tipos de archivo en los que no quieres que funcione
        'NvimTree',
        'packer',
        'dashboard',
      },
    })

    -- Mapeos para moverse entre coincidencias iluminadas
    vim.keymap.set("n", "<a-n>", "<cmd>lua require('illuminate').next_reference{wrap=true}<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<a-p>", "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<cr>", { noremap = true, silent = true })
    
    -- Cambiar el grupo de resaltado de Illuminate
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3b4261", underline = false })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3b4261", underline = false })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3b4261", underline = false })
  end
}
