local colors = {
    blue = "#80a0ff",
    cyan = "#79dac8",
    black = "#080808",
    white = "#c6c6c6",
    red = "#ff5189",
    violet = "#c0a1fe",
    bg = "#191919",

    visual = "#FFCFA8",
    insert = "#82d9c2",
    replace = "#FF8080",
    normal = "#A0A0A0",
}
local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.normal },
        b = { fg = colors.white, bg = colors.bg },
        c = { fg = colors.white },
    },

    insert = { a = { fg = colors.black, bg = colors.insert } },
    visual = { a = { fg = colors.black, bg = colors.visual } },
    replace = { a = { fg = colors.black, bg = colors.replace } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
    },
}

local config = {
    options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                separator = { left = " " },
                right_padding = 2,
                left_padding = 2,
            },
        },
        lualine_b = {
            "branch",
            "diff",
            {
                "filename",
                path = 4,
            },
        },

        lualine_c = {
            "macro_recording",
        },
        lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } } },
        lualine_y = {
            {
                function()
                    return "@staticdots ૮₍ • ˕ - ₎ა♡"
                end,
            },
        },
        lualine_z = {

            {
                separator = { right = " " },
                function()
                    local clients = vim.lsp.get_clients()
                    local msg = "LSP: "
                    if #clients <= 0 then
                        return msg .. "None"
                    end

                    return msg .. clients[1].name
                end,
                right_padding = 2,
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        -- display macro recording
        { "yavorski/lualine-macro-recording.nvim" },
    },
    config = function()
        require("lualine").setup(config)
    end,
}
