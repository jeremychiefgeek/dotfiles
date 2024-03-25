vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme rose-pine]])
require("lualine").setup({
	options = {
		theme = "rose-pine",
		-- ... your lualine config
	},
})

function ColorMyPencils(color)
	color = color or "rose-pine" --"gruvbox" --"gruv-vsassist"--"gruvbox"--"onedark"--"rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
