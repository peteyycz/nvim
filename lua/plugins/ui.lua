return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd.colorscheme "gruvbox"
    end,
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = { show_hidden = true },
      keymaps = {
        ["<C-p>"] = false
      },
    },
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        desc = "Open parent directory",
        mode = "n",
      }
    },
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
