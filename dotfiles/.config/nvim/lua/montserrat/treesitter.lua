require('nvim-treesitter').install({
    'go',
    'cpp'
}):wait(300000)

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'go',
        'c',
        'cpp'
    },
    callback = function(args)
        pcall(vim.treesitter.start)
    end
})
