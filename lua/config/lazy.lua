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
   { 
    'rebelot/kanagawa.nvim', 
    config = require('plugins.colorscheme') -- Carga la configuración del tema desde este archivo
  },
  { 'kyazdani42/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim', config = require('plugins.lualine') },
	{ 
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = {"smart"},
          file_ignore_patterns = {},
          winblend = 0,
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              mirror = false,
            },
            vertical = {
              mirror = false,
            },
          },
          mappings = {
            i = {
              ["<C-n>"] = "cycle_history_next",
              ["<C-p>"] = "cycle_history_prev",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        extensions = {},
      }
    end,
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
