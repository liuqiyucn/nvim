return {
    'saghen/blink.cmp',
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- keymap = { preset = 'default' },
        keymap = {
            preset = 'none',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback'},
            ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback'},

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            cmdline = {},
            providers = {
                lsp = {
                    min_keyword_length = 3,
                    score_offset = 0,
                },
                path = {
                    min_keyword_length = 0,
                },
                snippets = {
                    min_keyword_length = 2,
                },
                buffer = {
                    min_keyword_length = 5,
                    max_items = 5,
                },
            },
        },
        completion = {
            accept = { auto_brackets = { enabled = true } },

            documentation = {
                auto_show = false,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = {
                    border = "double",
                    min_width = 10,
                    max_width = 40,
                    max_height = 30,
                },
            },
            menu = {
                border = "double",
                min_width = 50,
                max_height = 10,
            },
        },


    },
    opts_extend = { "sources.default" },
}
