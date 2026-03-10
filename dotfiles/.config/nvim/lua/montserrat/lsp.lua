vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    root_markers = { 'go.mod', '.git' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
 --           staticcheck = true,
            completeUnimported = true,
        },
    }
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go', 
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})

vim.lsp.enable('gopls')
