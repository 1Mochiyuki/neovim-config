-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.surround").setup()
require("Comment").setup()
require("mini.files").setup()
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 12

require("catppuccin").setup()
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
}
