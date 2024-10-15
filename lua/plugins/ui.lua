return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
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
        prompt_prefix = " ",
        selection_caret = " ",
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
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<C-n>", "<CMD>Neotree reveal<CR>", desc = "Open tree view" },
    }
  }
}
