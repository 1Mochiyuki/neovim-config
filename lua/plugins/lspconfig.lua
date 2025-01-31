return {
    "neovim/nvim-lspconfig",
    opts = {
        -- make sure mason installs the server
        servers = {
            ts_ls = {
                enabled = false,
            },
            vtsls = {
                enabled = false,
            },
        },
    },
}
