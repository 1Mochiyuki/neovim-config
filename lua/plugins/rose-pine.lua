return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "main",
      dark_variant = "main",
      extend_background_behind_borders = true,
      enable = {
        terminal = false,
        legacy_highlights = true,
        migrations = true,
      },
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    })
  end,
}
