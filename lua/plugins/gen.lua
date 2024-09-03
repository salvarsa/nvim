return {
    "David-Kunz/gen.nvim",
    opts = {
        model = "llama3", -- El modelo predeterminado a usar.
        quit_map = "q", -- Tecla para cerrar la ventana de respuesta.
        retry_map = "<leader>r", -- Mapeo de teclas para re-enviar el prompt.
        accept_map = "<leader><CR>", -- Mapeo de teclas para aceptar el resultado.
        host = "localhost", -- Host que ejecuta el servicio de Ollama.
        port = "11434", -- Puerto en el que Ollama está escuchando.
        display_mode = "split", -- Modo de visualización para ver si mejora la usabilidad.
        show_prompt = true, -- Mostrar el prompt enviado a Ollama.
        show_model = false, -- No mostrar el modelo al inicio de la sesión de chat.
        no_auto_close = false, -- No cerrar la ventana automáticamente.
        hidden = false, -- No ocultar la ventana de generación.
        init = function(options)
            pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        end,
        command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
        debug = false, -- No imprimir errores y comandos ejecutados.
    },
    config = function(_, opts)
        require("gen").setup(opts)
        -- Integrar gen.nvim con Telescope para manejar el prompt
        require("telescope").load_extension("gen")
    end,
}

