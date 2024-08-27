return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = [[
________  ________  ________  ________     
|\   __  \|\   __  \|\   ____\|\   __  \    
\ \  \|\  \ \  \|\  \ \  \___|\ \  \|\  \   
 \ \   ____\ \  \\\  \ \  \  __\ \  \\\  \  
  \ \  \___|\ \  \\\  \ \  \|\  \ \  \\\  \ 
   \ \__\    \ \_______\ \_______\ \_______\
    \|__|     \|_______|\|_______|\|_______|
                                           
		]]

    alpha.setup(dashboard.opts)
  end,
}
