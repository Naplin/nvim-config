require('monokai-nightasty').setup({
	dark_style_background = 'transparent'
})

vim.cmd.colorscheme('oxocarbon')
--local oxocarbon = require('oxocarbon')['oxocarbon']

function LightToggle()
	vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end
