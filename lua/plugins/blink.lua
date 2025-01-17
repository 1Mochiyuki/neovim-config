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
        { "niuiic/blink-cmp-rg.nvim" },
        { "FelipeLema/cmp-async-path" },
        { "moyiz/blink-emoji.nvim" },
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
    version = "v0.10.0",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- On musl libc based systems you need to add this flag
    -- build = 'RUSTFLA GS="-C target-feature=-crt-static" cargo build --release',

    opts = {

        snippets = {
            preset = "luasnip",
        },
        sources = {
            default = {

                "lsp",
                "snippets",
                "buffer",
                "async_path",
                "supermaven",
                "ripgrep",
                "emoji",
            },

            providers = {
                async_path = {
                    module = "blink.compat.source",
                    name = "async_path",
                },
                emoji = {
                    module = "blink-emoji",
                    name = "Emoji",
                    score_offset = 15, -- Tune by preference
                    opts = { insert = true }, -- Insert emoji (default) or complete its name
                },
                supermaven = {

                    name = "supermaven",
                    kind = "Supermaven",
                    module = "blink.compat.source",
                    score_offset = 100,
                    async = true,
                },
                ripgrep = {

                    module = "blink-cmp-rg",
                    name = "Ripgrep",
                    kind = "Ripgrep",
                    max_items = 3,
                    min_keyword_length = 3,
                    opts = {
                        -- prefix_min_len = 3,
                        get_command = function(context, prefix)
                            return {
                                "rg",
                                "--no-config",
                                "--json",
                                "--word-regexp",
                                "--ignore-case",
                                "--",
                                prefix .. "[\\w_-]+",
                                vim.fs.root(0, ".git") or vim.fn.getcwd(),
                            }
                        end,

                        get_prefix = function(context)
                            return context.line:sub(1, context.cursor[2]):match("[%w_-]+$") or ""
                        end,
                    },
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
                selection = { preselect = false, auto_insert = true },
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

                    columns = { { "kind_icon", "label", gap = 1 } },
                },
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
            kind_icons = {
                Ripgrep = "[RG]",
                Text = "󰉿",
                Method = "󰊕",
                Function = "󰊕",
                Constructor = "󰒓",

                Field = "󰜢",
                Variable = "",
                Property = "󰖷",

                Class = "",
                Interface = "",
                Struct = "",
                Module = "󰅩",

                Unit = "󰪚",
                Value = "󰦨",
                Enum = "󰦨",
                EnumMember = "󰦨",

                Keyword = "󰻾",
                Constant = "󰏿",

                Snippet = "",
                Color = "󰏘",
                File = "󰈔",
                Reference = "󰬲",
                Folder = "󰉋",
                Event = "󱐋",
                Operator = "󰪚",
                TypeParameter = "",
            },
        },

        signature = { enabled = true },
    },
}
return config
