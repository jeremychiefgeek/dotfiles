return {
  {
    --"catppuccin/nvim",
    --"shaunsingh/nord.nvim",
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("catppuccin")
      -- vim.cmd.colorscheme("nord")
      vim.cmd.colorscheme("nordic")
    end,
  },
}
