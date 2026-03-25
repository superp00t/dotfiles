require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close, -- Close telescope on first press of Esc
            },
        },
    },
})
