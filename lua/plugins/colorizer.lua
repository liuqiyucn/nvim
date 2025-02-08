return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  enabled = true,
  opts = {},
  config = function()
    require("colorizer").setup()
  end,
}
