return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_method = "skim"
      -- vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      -- vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

      vim.g.vimtex_compiler_latexmk = {
        continuous = 0,
      }

      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
      -- vim.g.vimtex_complete_enabled = 0
    end,

  },
}
