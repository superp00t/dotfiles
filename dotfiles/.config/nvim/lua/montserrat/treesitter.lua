vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'go'
	},
	callback = function(args)
		vim.treesitter.start()
	end
})
