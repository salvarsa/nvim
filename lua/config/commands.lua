--Comando para recargr la configuracion de neovim
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

