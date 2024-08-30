return {
  -- Dependencias
  {
    "MunifTanjim/nui.nvim",
    lazy = true
  },
  {
    "rcarriga/nvim-notify",
    lazy = true
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },

  -- Configuración principal de Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-cmdline",
    },
    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      cmdline = {
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts) 
      
			-- Keybindings para Noice
      vim.keymap.set("n", "<leader>c", function()
        require("noice").cmd("show")
      end, { desc = "Show Noice Message History" })
      
      vim.keymap.set("n", "<leader>nl", function()
        require("noice").cmd("last")
      end, { desc = "Show Last Noice Message" })
      
      vim.keymap.set("n", "<leader>nh", function()
        require("noice").cmd("history")
      end, { desc = "Show Noice History" })
      
      vim.keymap.set("n", "<leader>nd", function()
        require("noice").cmd("dismiss")
      end, { desc = "Dismiss All Noice Messages" })
    end,
  }
}
