return {
  {
    --"catppuccin/nvim",
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("catppuccin")
      vim.cmd.colorscheme("nord")
    end,
  },
}
