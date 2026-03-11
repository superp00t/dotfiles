-- we have nerd fonts, most likely.
vim.g.have_nerd_font = true

-- turn on relative line numbers
vim.o.relativenumber = true

-- turn off word wrap
vim.o.wrap = false

-- force the sign column to always be visible
vim.o.signcolumn = "yes"

-- configure tabs to appear as 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- disable swap files
vim.o.swapfile = false

-- disable search highlighting (annoying!)
vim.cmd('nohlsearch')

-- configure color scheme
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    style = 'dark',

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = false,

    -- Enable italic inlay type hints
    italic_inlayhints = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Apply theme colors to terminal
    terminal_colors = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

-- load the theme without affecting devicon colors.
vim.cmd('colorscheme vscode')
