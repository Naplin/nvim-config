require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'ocamllsp', 'lua_ls', 'pyright' }
})

local on_attach = function(_, _)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').ocamllsp.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.fn.getcwd()
	end,
}
require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach
}
require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = on_attach
}
--local lsp_zero = require('lsp_zero')
