return {
  "loctvl842/monokai-pro.nvim", -- Ensure the plugin name matches your setup
  enabled = true,
  lazy = false, -- Load the plugin immediately (set to true if you want lazy loading)
  opts = {
    transparent_background = false,
    terminal_colors = true,
    devicons = true, -- highlight the icons of `nvim-web-devicons`
    styles = {
      comment = { italic = true },
      keyword = { italic = true }, -- any other keyword
      type = { italic = true }, -- (preferred) int, long, char, etc
      storageclass = { italic = true }, -- static, register, volatile, etc
      structure = { italic = true }, -- struct, union, enum, etc
      parameter = { italic = true }, -- parameter pass in function
      annotation = { italic = true },
      tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    day_night = {
      enable = false, -- turn off by default
      day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      night_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    },
    inc_search = "background", -- underline | background
    background_clear = {
      "toggleterm",
      "telescope",
      "renamer",
      "notify",
      -- "neo-tree",
      "bufferline",
      "which-key",
      "lualine",
      "float_win",
      "which-key",
    },
    plugins = {
      bufferline = {
        underline_selected = false,
        underline_visible = false,
      },
      indent_blankline = {
        context_highlight = "pro", -- default | pro
        context_start_underline = true,
      },
    },
  },
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.api.nvim_set_hl(0, "Search", { bg = "#ffcc00", fg = "#000000", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "IncSearch", { bg = "#ff8700", fg = "#000000", bold = true, underline = true })   require("monokai-pro").load()
  end,
}
