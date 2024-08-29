return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",  --Esta chimbada nos ayuda con los procesos asincronicos
    },
    config = function()
      -- Configurar nvim-dap
      local dap = require('dap')
      local dapui = require('dapui')

      -- Configuración de nvim-dap-ui
      require('dapui').setup()

      -- Configuración de nvim-dap-virtual-text con argumento
      require('nvim-dap-virtual-text').setup({
        enabled = true,                    -- Habilitar la visualización de texto virtual
        enabled_commands = true,           -- Habilitar comandos de texto virtual
        highlight_changed_variables = true, -- Resaltar variables cambiadas
        highlight_new_as_changed = true,   -- Resaltar nuevas variables como cambiadas
        show_stop_reason = true,           -- Mostrar razón de parada
        commented = false,                 -- Mostrar el valor en el comentario al lado
        only_first_definition = true,      -- Mostrar texto virtual solo en la primera definición
        all_references = false,            -- Mostrar texto virtual en todas las referencias
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
          else
            return variable.name .. ' = ' .. variable.value
          end
        end,
        virt_text_pos = 'eol',             -- Posición del texto virtual
        all_frames = true,                 -- Mostrar texto virtual para todas las pilas de llamadas
        virt_lines = false,                -- Mostrar texto virtual como líneas virtuales
        virt_text_win_col = nil            -- Columna de la ventana de texto virtual
      })

      -- Configuración de adaptadores de depuración para Node.js
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { os.getenv('HOME') .. '/vscode-node-debug2/out/src/nodeDebug.js' }
      }

      -- Configuración para archivos JavaScript
      dap.configurations.javascript = {
        {
          type = 'node2',
          request = 'launch',
          name = "Launch JavaScript File",  -- Añadir campo 'name' requerido
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }

      -- Configuración para archivos TypeScript
      dap.configurations.typescript = {
        {
          type = 'node2',
          request = 'launch',
          name = "Launch TypeScript File",  -- Añadir campo 'name' requerido
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
          outFiles = { "${workspaceFolder}/dist/**/*.js" },
        },
      }

      -- Integración con nvim-dap-ui para abrir y cerrar la interfaz automáticamente
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  }
}

