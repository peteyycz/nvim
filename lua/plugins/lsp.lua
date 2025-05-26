local LspUtil = require "util.lsp"

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "vtsls", "elixirls", "eslint", "rust_analyzer", "clangd" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require "lspconfig"

      lspconfig.eslint.setup {
        filetypes = LspUtil.jslike_filetypes,
        on_attach = function(_client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }
      lspconfig.vtsls.setup {
        filetypes = LspUtil.jslike_filetypes,
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      }
      lspconfig.lua_ls.setup {
        on_attach = LspUtil.generic_on_attach,
      }

      lspconfig.clangd.setup {
        on_attach = LspUtil.generic_on_attach,
      }
      lspconfig.zls.setup {
        on_attach = LspUtil.generic_on_attach,
      }
      lspconfig.gleam.setup {
        on_attach = LspUtil.generic_on_attach,
      }
      lspconfig.elixirls.setup {
        on_attach = LspUtil.generic_on_attach,
      }
      lspconfig.rust_analyzer.setup {
        on_attach = LspUtil.generic_on_attach,
      }
    end,
  },
}
