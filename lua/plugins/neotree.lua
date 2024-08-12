-- ~/.config/nvim/lua/plugins/neotree.lua
return function()
  require('neo-tree').setup({
    close_if_last_window = true,  -- Cierra Neo-tree si es la última ventana
    popup_border_style = "rounded", -- Bordes redondeados en las ventanas emergentes
    enable_git_status = true,  -- Muestra el estado de Git
    enable_diagnostics = true, -- Muestra diagnósticos de linter (como de LSP)
    filesystem = {
      follow_current_file = true, -- Sigue el archivo actual en el explorador
      use_libuv_file_watcher = true, -- Refresca automáticamente cuando cambian archivos
      hijack_netrw_behavior = "open_default", -- Remplaza el comportamiento de netrw
      filtered_items = {
        hide_dotfiles = false,  -- Muestra archivos ocultos (los que empiezan con .)
        hide_gitignored = true, -- Oculta archivos ignorados por git
      },
    },
    window = {
      position = "left", -- Posición de la ventana de Neo-tree (izquierda)
      width = 30, -- Ancho de la ventana de Neo-tree
    },
    buffers = {
      show_unloaded = true, -- Muestra los buffers que no están cargados
    },
    git_status = {
      window = {
        position = "float", -- Muestra el estado de Git en una ventana flotante
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        }
      }
    }
  })
end

