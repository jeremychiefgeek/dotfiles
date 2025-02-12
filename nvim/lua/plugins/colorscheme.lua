return {
  {
    --"catppuccin/nvim",
    --"shaunsingh/nord.nvim",
    -- "AlexvZyl/nordic.nvim",
    "blazkowolf/gruber-darker.nvim",
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("catppuccin")
      -- vim.cmd.colorscheme("nord")
      vim.cmd.colorscheme("gruber-darker")
    end,
  },
}
