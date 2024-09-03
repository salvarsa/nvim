return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require('nvim-tmux-navigation').setup({})
    vim.keymap.set("n", "<leader>h", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
    vim.keymap.set("n", "<leader>j", "<Cmd>NvimTmuxNavigateDown<CR>", {})
    vim.keymap.set("n", "<leader>k", "<Cmd>NvimTmuxNavigateUp<CR>", {})
    vim.keymap.set("n", "<leader>l", "<Cmd>NvimTmuxNavigateRight<CR>", {})
  end,
}
