local config = {
    "saghen/blink.cmp",

    optional = true,
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        {
            "saghen/blink.compat",
            -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
            version = "*",
            -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
            lazy = true,
            -- make sure to set opts so that lazy.nvim calls blink.compat's setup
            opts = {
                impersonate_nvim_cmp = true,
                debug = true,
            },
        },
        { "FelipeLema/cmp-async-path" },
        {
            "supermaven-inc/supermaven-nvim",
            config = function()
                require("supermaven-nvim").setup({

                    disable_inline_completion = true,
                    disable_keymaps = true,
                    log_level = "off",
                })
            end,
        },
    },

    -- use a release tag to download pre-built binaries
    version = "v0.9.2",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLA GS="-C target-feature=-crt-static" cargo build --release',
    opts = {

        sources = {
            default = {

                "lsp",
                "path",
                "snippets",
                "buffer",
                "async_path",
                "supermaven",
            },

            providers = {
                async_path = {
                    name = "async_path",
                    module = "blink.compat.source",
                },
                supermaven = {
                    name = "supermaven",
                    kind = "Supermaven",
                    module = "blink.compat.source",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        keymap = {
            preset = "none",
            ["<CR>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
            ["<C-f>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "scroll_documentation_up", "fallback" },
            ["<C-j>"] = { "scroll_documentation_down", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
            ["<C-l>"] = { "snippet_forward", "fallback" },
        },
        completion = {

            keyword = {
                range = "full",
            },
            trigger = {
                show_on_accept_on_trigger_character = false,
                show_on_insert_on_trigger_character = true,
            },
            list = {
                selection = "auto_insert",
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            ghost_text = {
                enabled = true,
            },

            menu = {
                border = "rounded",
                scrollbar = false,
                draw = {

                    columns = { { "label", gap = 1 }, { "kind" } },
                },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        signature = { enabled = true },
    },
}
return config
