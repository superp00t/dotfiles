-- use space as the leader key (a special prefix for key combinations)
vim.g.mapleader = ' '

-- save changes on <leader>w
vim.keymap.set('n', '<leader>w', ':update<cr>')

-- quit the editor on <leader>q
vim.keymap.set('n', '<leader>q', ':quit<cr>')

-- attempt to center view when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
