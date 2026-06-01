return {
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "",
        },
      },
    },
  },
  {
    dir = "/home/peteyycz/Code/src/github.com/peteyycz/gannotator",
    opts = {
      keymaps = {
        add    = "<leader>ca",
        edit   = "<leader>ce",
        delete = "<leader>cd",
        next   = "]a",
        prev   = "[a",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",               desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>",        desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<cr>",          desc = "Git push" },
      { "<leader>gP", "<cmd>Git pull<cr>",          desc = "Git pull" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>",        desc = "Git diff (split)" },
      { "<leader>gB", "<cmd>Git blame<cr>",         desc = "Git blame" },
      { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
      { "<leader>gw", "<cmd>Gwrite<cr>",            desc = "Git stage current file" },
      { "<leader>gr", "<cmd>Gread<cr>",             desc = "Git checkout current file" },
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
      notifier = {},
    },
    keys = {
      {
        "<leader>gb",
        function() Snacks.gitbrowse() end,
        desc = "Browse file on remote",
        mode = "n",
      },
    },
  },
}
