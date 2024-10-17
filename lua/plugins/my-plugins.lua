return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<C-p>",
        require("telescope.builtin").find_files,
        desc = "Find files",
      },
      {
        "<leader>fs",
        require("telescope.builtin").live_grep,
        desc = "Search in project",
      },
      {
        "<leader>fu",
        require("telescope.builtin").lsp_references,
        desc = "Find LSP References",
      },
    },
    -- change some options
    opts = {
      defaults = {
        path_display = { "smart" },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<C-u>"] = false,
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "tsx",
        "typescript",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
        vim.keymap.set("n", "<leader>gC", "<cmd>Gdiffsplit!<cr>", { desc = "Conflict 3-way split" })
        vim.keymap.set("n", "<leader>gd", "<cmd>Gdiff<cr>", { desc = "Gdiff" })
        vim.keymap.set("n", "<leader>gD", "<cmd>Git log --stat -p<cr>", { desc = "Git log --stat -p" })
        vim.keymap.set("n", "<leader>ge", ":Gedit ", { desc = "Gedit" }) -- Gedit can take commit objects
        vim.keymap.set(
          "n",
          "<leader>gl",
          [[<cmd>Git log --format="%h [%ad] [%an] %s"<cr>]],
          { desc = "Git log oneline" }
        )
        vim.keymap.set("n", "<leader>gL", "<cmd>Git log<cr>", { desc = "Git log" })
        vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { desc = "G" })
        vim.keymap.set("n", "<leader>gP", "<cmd>Git pull", { desc = "Git pull" })
        vim.keymap.set(
          "n",
          "<leader>gp",
          "<cmd>Git -c push.default=current push<cr>",
          { desc = "Git -c push.default=current push" }
        )
        vim.keymap.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Gread" })
        vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Gwrite" })
        vim.keymap.set("n", "<leader>gu", "<cmd>diffupdate<cr>", { desc = "diffupdate" })
        vim.keymap.set("n", "<leader>g2", "<cmd>diffget //2<cr>", { desc = "diffget //2" })
        vim.keymap.set("n", "<leader>g3", "<cmd>diffget //3<cr>", { desc = "diffget //3" })
      end)
    end,
  },
}
