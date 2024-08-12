-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

--carga de plungins de lazy
lazy.setup({
  { 'folke/tokyonight.nvim', config = require('plugins.colorscheme') },
  { 'kyazdani42/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim', config = require('plugins.lualine') },
	{ 
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' }, 
    config = require('plugins.telescope')
  },
  { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate", config = require('plugins.treesitter') },
  { 
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v3.x", 
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" }, 
    config = require('plugins.neotree') 
  },
})


return lazy
