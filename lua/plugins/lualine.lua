local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#ff5189",
  violet = "#c0a1fe",
  grey = "#1e2030",
}
local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

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
    lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2, left_padding = 2 } },
    lualine_b = { "branch" },
    lualine_c = {},
    lualine_y = { "progress" },
    lualine_z = {

      {
        function()
          return "" .. os.date(" %a %I:%M %p")
        end,
        separator = { left = "", right = "" },
        left_padding = 2,
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
  config = function()
    require("lualine").setup(config)
  end,
}
