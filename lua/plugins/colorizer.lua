return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        user_default_options = {
            mode = "background",
        },
    },
    config = function()
        require("colorizer").setup()
    end,
}
