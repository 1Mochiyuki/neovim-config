-- Using lazy.nvim
return -- Using lazy.nvim
-- Using lazy.nvim
{
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup({
      -- optional configuration here
    })
    require("bamboo").load()
  end,
}
