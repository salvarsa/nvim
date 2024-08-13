-- ~/.config/nvim/lua/plugins/colorscheme.lua
return function()
  -- Configura kanagawa.nvim
  require('kanagawa').setup({
    -- Configuraciones específicas para el modo más oscuro
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none" -- Configuración de fondo más oscuro
          }
        }
      }
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        -- Añade más overrides aquí si es necesario
      }
    end,
  })
  
  -- Aplica el esquema de color kanagawa
  vim.cmd.colorscheme('kanagawa')
end

