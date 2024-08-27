return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    -- Arte ASCII combinado como un solo string
    local header_art = [[
________  ________  ________  ________     
|\   __  \|\   __  \|\   ____\|\   __  \    
\ \  \|\  \ \  \|\  \ \  \___|\ \  \|\  \   
 \ \   ____\ \  \\\  \ \  \  __\ \  \\\  \  
  \ \  \___|\ \  \\\  \ \  \|\  \ \  \\\  \ 
   \ \__\    \ \_______\ \_______\ \_______\
    \|__|     \|_______|\|_______|\|_______|
                                           
       ,                              
       \`-._           __             
        \\  \-..____,.'  `.           
         :  )       :      :\         
          ;'        '   ;  | :        
          )..      .. .:.`.; :        
         /::...  .:::...   ` ;        
         `:o>   /\o_>        : `.     
        `-`.__ ;   __..--- /:.   \    
        === \_/   ;=====_.':.     ;   
         ,/'`--'...`--....        ;   
              ;                    ;  
          . '                       ; 
        .'     ..     ,      .       ;
       :       ::..  /      ;::.     |
      /      `.;::.  |       ;:..    ;
     :         |:.   :       ;:.    ; 
     :         ::     ;:..   |.    ;  
      :       :;      :::....|     |  
      /\     ,/ \      ;:::::;     ;  
    .:. \:..|    :     ; '.--|     ;  
   ::.  :''  `-.,,;     ;'   ;     ;  
.-'. _.'\      / `;      \,__:      \ 
`---'    `----'   ;      /    \,.,,,/ 
                   `----`             
                                      ]]

    -- Función para dividir un string en líneas
    local function split_string(inputstr, sep)
      sep = sep or "\n"
      local t = {}
      for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
      end
      return t
    end

    -- Configurar el header usando la función de división
    dashboard.section.header.val = split_string(header_art)

    -- Centrar el contenido del dashboard
    local function center_text(text)
      local dashboard_width = 80 -- Ajusta este valor a tu gusto
      local lines = {}
      for _, line in ipairs(text) do
        local padding = math.floor((dashboard_width - #line) / 2)
        table.insert(lines, string.rep(" ", padding) .. line)
      end
      return lines
    end

    dashboard.section.header.val = center_text(dashboard.section.header.val)

    alpha.setup(dashboard.opts)
  end,
}

