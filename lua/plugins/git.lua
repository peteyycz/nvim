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
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
        vim.keymap.set("n", "<leader>gd", "<cmd>vertical Gdiff<cr>", { desc = "Gdiff" })
        vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { desc = "G" })
        vim.keymap.set(
          "n",
          "<leader>gp",
          "<cmd>Git -c push.default=current push<cr>",
          { desc = "Git -c push.default=current push" }
        )
      end)
    end,
  },
}
