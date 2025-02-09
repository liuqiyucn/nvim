return {
  "nvim-telescope/telescope.nvim",
  -- event = "VimEnter",
  cmd = "Telescope",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",

      build = "make",

      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
            ["<C-l>"] = require("telescope.actions").select_default, -- open file
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
          hidden = true,
        },
      },
      live_grep = {
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
        additional_args = function(_)
          return { "--hidden" }
        end,
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
    -- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>s:", builtin.command_history, {desc = "Command History"})
    -- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "Grep in current buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Grep in Open Files" })
  end,
}
