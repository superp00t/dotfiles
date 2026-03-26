vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    root_markers = { 'compile_commands.json', '.clangd', '.clang-tidy', '.git' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})

vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = { '*.c', '*.h', '*.cpp', '*.hpp', '*.m', '*.mm' },
    callback = function()
        -- Save the current cursor position to prevent jumping
        local view = vim.fn.winsaveview()

        -- Run clang-format on the current file path
        -- -i means "in-place" edit
        vim.fn.system({ 'clang-format', '-i', vim.fn.expand('%:p') })

        -- Reload the file buffer to show changes
        vim.cmd('edit!')

        -- Restore cursor position
        vim.fn.winrestview(view)
    end,
})

vim.lsp.enable('clangd')
