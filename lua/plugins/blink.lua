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
    version = "v0.6.2",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLA GS="-C target-feature=-crt-static" cargo build --release',
    sources = {
        completion = {
            enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev", "async_path", "dadbod" },
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
            dadbod = { name = "dadbod", module = "vim_dadbod_completion.blink" },
        },
    },
    opts = {

        keymap = {
            ["<CR>"] = {
                function(cmp)
                    if cmp.is_in_snippet() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
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
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },

        highlight = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = true,
        },
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "normal",
        windows = {

            autocomplete = {
                border = "rounded",

                selection = "auto_insert",
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                },
            },
        },

        -- experimental auto-brackets support
        -- accept = { auto_brackets = { enabled = true } }

        -- experimental signature help support
        signature_help = { enabled = true },
    },
}
return config
