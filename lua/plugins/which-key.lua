return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts_extend = { "specs" },
  opts = {
    delay = 300,
    preset = "helix",
    -- icons = {
    --   rules = {
    --     { key = "<leader>:", icon = "🕘" },
    --   }
    -- },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>s", group = "search" },
        { "<leader>c", group = "code" },
        { "<leader>w", group = "window" },
        { "<leader>u", group = "ui" },
        { "<leader>q", group = "quit" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        {"<localLeader>l", group = "tex", icon = {icon = '' , color = 'blue'}},
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
      },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<c-q>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },

}
