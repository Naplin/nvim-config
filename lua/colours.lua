require('monokai-nightasty').setup({
	dark_style_background = 'transparent'
})

function LightToggle()
	vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end
