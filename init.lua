-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.files").setup()
local lspconfig = require("lspconfig")
lspconfig.dartls.setup({
  cmd = { "dart", "language-server", "--protocol=lsp" },
})
require("catppuccin").setup({})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 12
vim.opt.mouse = ""

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
