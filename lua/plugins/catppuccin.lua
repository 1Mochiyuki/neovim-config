return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        flavour = "macchiato",
        integrations = {
          ts_rainbow = true,
        },
        color_overrides = {
          all = {
            rosewater = "#f4dbd6",
            flamingo = "#f0c6c6",
            pink = "#f5bde6",
            mauve = "#c1a1ff",
            red = "#ed8796",
            maroon = "#ee99a0",
            peach = "#4fcead",
            yellow = "#dfa2d5",
            green = "#add4ae",
            teal = "#8bd5ca",
            sky = "#91d7e3",
            sapphire = "#7dc4e4",
            blue = "#91bbf7",
            -- lavender = "#FFFFFF",
            lavender = "#b9d1e4",
            text = "#dadada",
            subtext1 = "#b8c0e0",
            subtext0 = "#a5adcb",
            overlay2 = "#939ab7",
            overlay1 = "#8087a2",
            overlay0 = "#6e738d",
            surface2 = "#585f82",
            surface1 = "#494d64",
            surface0 = "#363a4f",
            base = "#24273a",
            mantle = "#1e2030",
            crust = "#181926",
          },
        },
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
