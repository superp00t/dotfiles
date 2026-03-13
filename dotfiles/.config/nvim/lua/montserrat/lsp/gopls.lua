vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    root_markers = { 'go.mod', '.git' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            }
        }
    }
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go', 
    callback = function()
        vim.lsp.buf.format({
			async = false
		})
		vim.lsp.buf.code_action({
			context = {
				only = {
					'source.organizeImports'
				}
			},
			apply = true
		})
	end
})

vim.lsp.enable('gopls')
