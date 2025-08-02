return {
  {

    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
      registries = {
        "github:Crashdummyy/mason-registry",
        "github:mason-org/mason-registry",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  -- {
  --   "mason-org/mason.nvim",
  --   cmd = "Mason",
  --   keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  --   build = ":MasonUpdate",
  --   opts_extend = { "ensure_installed" },
  --   opts = {
  --     ensure_installed = {
  --       "luacheck",
  --       "shellcheck",
  --       "shfmt",
  --       "tailwindcss-language-server",
  --       "typescript-language-server",
  --       "css-lsp",
  --       "ols",
  --       "csharpier",
  --       "prettier",
  --     },
  --     registries = {
  --       "github:Crashdummyy/mason-registry",
  --       "github:mason-org/mason-registry",
  --     },
  --   },
  --   ---@param opts MasonSettings | {ensure_installed: string[]}
  --   config = function(_, opts)
  --     require("mason").setup(opts)
  --     local mr = require("mason-registry")
  --     mr:on("package:install:success", function()
  --       vim.defer_fn(function()
  --         -- trigger FileType event to possibly load this newly installed LSP server
  --         require("lazy.core.handler.event").trigger({
  --           event = "FileType",
  --           buf = vim.api.nvim_get_current_buf(),
  --         })
  --       end, 100)
  --     end)
  --
  --     mr.refresh(function()
  --       for _, tool in ipairs(opts.ensure_installed) do
  --         local p = mr.get_package(tool)
  --         if not p:is_installed() then
  --           p:install()
  --         end
  --       end
  --     end)
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     inlay_hints = { enabled = true },
  --     ---@type lspconfig.options
  --     servers = {
  --       -- omnisharp = {
  --       --   organize_imports_on_format = true,
  --       --   enable_import_completion = true,
  --       -- },
  --       cssls = {},
  --       tailwindcss = {
  --         root_dir = function(...)
  --           return require("lspconfig.util").root_pattern(".git")(...)
  --         end,
  --       },
  --       harper_ls = {},
  --       tsserver = {
  --         root_dir = function(...)
  --           return require("lspconfig.util").root_pattern(".git")(...)
  --         end,
  --         single_file_support = false,
  --         settings = {
  --           typescript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "literal",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = false,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --           javascript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "all",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = true,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --         },
  --       },
  --       html = {},
  --       sourcekit = {},
  --       lua_ls = {
  --         -- enabled = false,
  --         single_file_support = true,
  --         settings = {
  --           Lua = {
  --             workspace = {
  --               checkThirdParty = false,
  --             },
  --             completion = {
  --               workspaceWord = true,
  --               callSnippet = "Both",
  --             },
  --             misc = {
  --               parameters = {
  --                 -- "--log-level=trace",
  --               },
  --             },
  --             hint = {
  --               enable = true,
  --               setType = false,
  --               paramType = true,
  --               paramName = "Disable",
  --               semicolon = "Disable",
  --               arrayIndex = "Disable",
  --             },
  --             doc = {
  --               privateName = { "^_" },
  --             },
  --             type = {
  --               castNumberToInteger = true,
  --             },
  --             diagnostics = {
  --               disable = { "incomplete-signature-doc", "trailing-space" },
  --               -- enable = false,
  --               groupSeverity = {
  --                 strong = "Warning",
  --                 strict = "Warning",
  --               },
  --               groupFileStatus = {
  --                 ["ambiguity"] = "Opened",
  --                 ["await"] = "Opened",
  --                 ["codestyle"] = "None",
  --                 ["duplicate"] = "Opened",
  --                 ["global"] = "Opened",
  --                 ["luadoc"] = "Opened",
  --                 ["redefined"] = "Opened",
  --                 ["strict"] = "Opened",
  --                 ["strong"] = "Opened",
  --                 ["type-check"] = "Opened",
  --                 ["unbalanced"] = "Opened",
  --                 ["unused"] = "Opened",
  --               },
  --               unusedLocalExclude = { "_*" },
  --             },
  --             format = {
  --               enable = false,
  --               defaultConfig = {
  --                 indent_style = "space",
  --                 indent_size = "2",
  --                 continuation_indent_size = "2",
  --               },
  --             },
  --           },
  --         },
  --       },
  --     },
  --     setup = {},
  --   },
  -- },
}
