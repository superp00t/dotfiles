vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'go'
	},
	callback = function(args)
		pcall(vim.treesitter.start)
	end
})
