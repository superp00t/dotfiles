vim.g.mapleader = ' '

-- save changes on <leader>w
vim.keymap.set('n', '<leader>w', ':update<cr>')

-- attempt to center view when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
