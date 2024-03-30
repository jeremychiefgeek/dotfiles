return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      terminal_opts = {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        title = "I'm So Lazy",
        title_pos = "center",
        width = 0.5,
        height = 0.5,
      }
    }
