-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add acy additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<BS>", "<CMD>nohlsearch<CR>")
map("n", "<leader>a", "ggVG", { desc = "Select whole file" })
