-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>rne", function()
    local cword = vim.fn.expand("<cword>")

    return string.format("oif %s != nil {<CR>}<Esc>Oreturn %s<Esc>O", cword, cword)
end, { expr = true })

vim.keymap.set("n", "<leader>ne", function()
    local cword = vim.fn.expand("<cword>")
    return string.format("oif %s != nil {<CR>}<Esc>O", cword)
end, { expr = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", " e", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader><leader>x", ":source %<cr>")

local neogit = require("neogit")

vim.keymap.set("n", "<leader>gg", function()
    neogit.open({ kind = "floating" })
end)

vim.keymap.set("n", "<leader>gc", function()
    neogit.open({ "commit" })
end)

vim.keymap.set("n", "<leader>gb", function()
    neogit.open({ "branch" })
end)

vim.keymap.set("n", "<leader>gm", function()
    neogit.open({ "merge" })
end)

vim.keymap.set("n", "<leader>gr", function()
    neogit.open({ "remote" })
end)

vim.keymap.set("n", "<leader>gp", function()
    neogit.open({ "pull" })
end)

vim.keymap.set("n", "<leader>gs", function()
    neogit.open({ "stash" })
end)

vim.keymap.set("n", "<leader>gw", function()
    neogit.open({ "worktree" })
end)

vim.keymap.set("n", "<leader>grb", function()
    neogit.open({ "rebase" })
end)

vim.keymap.set("n", "<leader>gi", function()
    neogit.open({ "ignore" })
end)

vim.keymap.set("n", "<leader>gf", function()
    neogit.open({ "log" })
end)

vim.keymap.set("n", "<leader>gps", function()
    neogit.open({ "push" })
end)
