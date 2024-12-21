local config = {
    "saghen/blink.cmp",

    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        {
            "saghen/blink.compat",
            { "FelipeLema/cmp-async-path" },
            opts = {
                -- lazydev.nvim only registers the completion source when nvim-cmp is
                -- loaded, so pretend that we are nvim-cmp, and that nvim-cmp is loaded.
                -- this option only has effect when using lazy.nvim
                -- this should not be required in most cases
                impersontate_nvim_cmp = true,
            },
        },
    },

    -- use a release tag to download pre-built binaries
    version = "v0.8.0",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLA GS="-C target-feature=-crt-static" cargo build --release',
    sources = {
        completion = {
            enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev", "async_path" },
        },
        providers = {
            async_path = {
                name = "async_path",
                module = "blink.compat.source",
            },
            lazydev = {
                name = "lazydev",
                module = "blink.compat.source",
                score_offset = 3,
            },
        },
    },
    opts = {

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

            menu = {
                border = "rounded",
                scrollbar = false,
                draw = {
                    padding = 1,
                    gap = 1,

                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        -- experimental signature help support
        signature = { enabled = true },
    },
}
return config
