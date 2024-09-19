-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.surround").setup()
require("Comment").setup()

require("rose-pine").setup({
  variant = "main",
  dark_variant = "main",
  extend_background_behind_borders = true,
  enable = {
    terminal = true,
    legacy_highlights = true,
    migrations = true,
  },
  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },
})
vim.cmd("colorscheme rose-pine")
return {

  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
