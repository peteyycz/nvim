return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end,
  },
  {
    "echasnovski/mini.statusline",
    opts = {
      use_icons = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<C-p>",
        -- FIXME: these requires are going to be running before initial install
        require "telescope.builtin".find_files,
        desc = "Find files",
      },
      {
        "<leader>fs",
        require "telescope.builtin".live_grep,
        desc = "Search in project",
      },
      {
        "<leader>fu",
        require "telescope.builtin".lsp_references,
        desc = "Find LSP References",
      },
    },
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
}
