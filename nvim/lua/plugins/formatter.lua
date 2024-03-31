return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.DEBUG,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				cs = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					-- require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						-- if util.get_current_buffer_file_name() == "special.lua" then
						-- return nil
						-- end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "csharpier",
							args = {},
							stdin = true,
						}
					end,
				},

				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},

				vue = {
					require("formatter.filetypes.vue").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				--  ["*"] = {
				-- "formatter.filetypes.any" defines default configurations for any
				-- filetype
				-- require("formatter.filetypes.any").remove_trailing_whitespace
				-- }
			},
		})
	end,
}