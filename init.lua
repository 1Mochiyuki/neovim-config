-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.files").setup({
    mappings = {
        go_in = "<CR>",
    },
})
require("catppuccin").setup({})
require("colorizer").setup()

if jit.os == "Windows" then
    vim.o.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
    vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
end

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 12
vim.opt.mouse = ""
