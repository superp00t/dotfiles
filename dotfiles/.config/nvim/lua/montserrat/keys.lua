-- use space as the leader key (a special prefix for key combinations)
vim.g.mapleader = ' '

-- save changes on <leader>w
vim.keymap.set('n', '<leader>w', ':update<cr>')

-- quit the editor on <leader>q
vim.keymap.set('n', '<leader>q', ':quit<cr>')

-- attempt to center view when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- yank currently selected word to system clipboard on <leader>c
vim.keymap.set('n', '<leader>c', 'viw"+y')

-- controlling the file explorer
vim.keymap.set('n', '<leader>e', ':Ex<cr>')

-- controlling buffers
vim.keymap.set('n', '<tab>', ':bnext<cr>')
vim.keymap.set('n', '<S-tab>', ':bprev<cr>')
vim.keymap.set('n', '<leader>x', ':bdelete<cr>')

-- fuzzy finding with Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})

-- go to definition using LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- textobjects selection
vim.keymap.set({ 'x', 'o' }, 'am', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'im', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ac', function()
    require('nvim-treesitter-textojects.select').select_textobject('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ic', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ 'x', 'o' }, 'as', function()
    require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
end)

-- textobjects motions
vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
    vim.api.nvim_feedkeys('zz', 'n', false)
end)
-- You can also pass a list to group multiple queries.
vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
    require('nvim-treesitter-textobjects.move').goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
end)
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
end)

vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
end)

vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
    vim.api.nvim_feedkeys('zz', 'n', false)
end)

vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
end)

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ 'n', 'x', 'o' }, ']d', function()
    require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[d', function()
    require('nvim-treesitter-textobjects.move').goto_previous('@conditional.outer', 'textobjects')
end)
