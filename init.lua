-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.files").setup({
    mappings = {
        go_in = "<CR>",
    },
})
-- local lspconfig = require("lspconfig")
-- lspconfig.dartls.setup({
--   cmd = { "dart", "language-server", "--protocol=lsp" },
-- })
require("catppuccin").setup({})

if jit.os == "Windows" then
    vim.o.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
    vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
end
-- vim.opt.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
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
