-- use space as the leader key (a special prefix for key combinations)
vim.g.mapleader = ' '

-- save changes on <leader>w
vim.keymap.set('n', '<leader>w', ':update<cr>')

-- quit the editor on <leader>q
vim.keymap.set('n', '<leader>q', ':quit<cr>')

-- attempt to center view when navigating up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

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
