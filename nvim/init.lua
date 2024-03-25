require("chiefgeek")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

--[[local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.odin = {
        install_info = {
            url = "https://github.com/ap29600/tree-sitter-odin",
            branch = "main",
            files = {"src/parser.c"}
        },
        filetype = "odin",
    }]]
--
