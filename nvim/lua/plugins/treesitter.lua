return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        "c_sharp",
        "c",
        "vue",
      },
      auto_install = true,
      hightlight = {
        enable = true,
        additional_vim_regex_hightlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
