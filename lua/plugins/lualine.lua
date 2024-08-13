---
-- lualine.nvim (statusline)
---
return function()
	require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = '|',
    section_separators = '',
  },
})
end
