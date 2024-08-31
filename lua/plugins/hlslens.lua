return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require('hlslens').setup()

    -- Mapeos para mejorar la navegación de búsqueda
    vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
    vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
    vim.keymap.set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true })
    vim.keymap.set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true })
  end
}

