local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Toggle NvimTree
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Open File Explorer
--keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- LSP Definitions
-- keymap.set("n", "gd", function()
--   require("telescope.builtin").lsp_definitions()
-- end, { desc = "[G]oto [D]efinition" })
-- keymap.set("n", "gr", function()
--   require("telescope.builtin").lsp_references()
-- end, { desc = "[G]oto [R]eferences" })
-- keymap.set("n", "gI", function()
--   require("telescope.builtin").lsp_implementations()
-- end, { desc = "[G]oto [I]mplementation" })
-- keymap.set("n", "<leader>D", function()
--   require("telescope.builtin").lsp_type_definitions()
-- end, { desc = "Type [D]efinition" })
-- keymap.set("n", "<leader>ds", function()
--   require("telescope.builtin").lsp_document_symbols()
-- end, { desc = "[D]ocument [S]ymbols" })

-- Move Lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Debugging Keymaps
keymap.set("n", "<F5>", function()
  require("dap").continue()
  -- require("csharp").run_project()
end, { desc = "Launch Project" })
-- keymap.set("n", "<F6>", function()
--   require("csharp").debug_project()
-- end, { desc = "Start/Continue Debugging" })
keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step Over" })
keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step Into" })
keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Step Out" })
keymap.set("n", "<Leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle Debug UI" })

--C#
keymap.set(
  "n",
  "<leader>td",
  "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>",
  { desc = "Debug File" }
)

keymap.set(
  "n",
  "<leader>tL",
  "<cmd>w|lua require('neotest').run.run_last({strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>",
  { desc = "Debug Last" }
)

keymap.set(
  "n",
  "<leader>tN",
  "<cmd>w|lua require('neotest').run.run({strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>",
  { desc = "Debug Nearest" }
)

-- Open compiler
keymap.set("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
keymap.set(
  "n",
  "<S-F6>",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
    .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)

-- Toggle compiler results
keymap.set("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
