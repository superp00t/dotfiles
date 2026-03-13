vim.lsp.config('lua_ls', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.lua',
	callback = function()
		vim.lsp.buf.format({
			async = false
		})
	end
})

vim.lsp.enable('lua_ls')
