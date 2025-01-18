-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("mini.operators").setup()
require("mini.splitjoin").setup()
require("mini.files").setup({
    mappings = {
        go_in = "<CR>",
    },
})

require("mini.surround").setup({
    mappings = {
        add = "<leader>sa",
        delete = "<leader>sd",
        find = "<leader>sf",
        find_left = "<leader>sF",
        highlight = "<leader>sh",
        update_n_lines = "<leader>sn",
    },
})

-- uses ripgrep instead of regular grep
vim.o.grepprg = "rg --vimgrep --smart-case --hidden"
vim.o.grepformat = "%f:%l:%c:%m"
-- sets <search query>/g to be on by default, add /g to end of search query to undo this
vim.o.gdefault = true

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

vim.opt.scrolloff = 4
vim.opt.mouse = ""
