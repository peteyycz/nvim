-- Key mappings
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Normal mode mappings
map("n", "<leader>a", "ggVG", options)
map("n", "<BS>", ":nohlsearch<CR>", { noremap = true, silent = false })

-- Visual mode mappings
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- Window navigation mappings
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

-- Custom commands
vim.api.nvim_create_user_command("E", function(opts)
  vim.cmd("e " .. opts.args)
end, { bang = true, nargs = "?" })
vim.api.nvim_create_user_command("W", function(opts)
  vim.cmd("w " .. opts.args)
end, { bang = true, nargs = "?" })
vim.api.nvim_create_user_command("Wq", function(opts)
  vim.cmd("wq " .. opts.args)
end, { bang = true, nargs = "?" })
vim.api.nvim_create_user_command("WQ", function(opts)
  vim.cmd("wq " .. opts.args)
end, { bang = true, nargs = "?" })
vim.api.nvim_create_user_command("Wa", function()
  vim.cmd("wa")
end, { bang = true })
vim.api.nvim_create_user_command("WA", function()
  vim.cmd("wa")
end, { bang = true })
vim.api.nvim_create_user_command("Q", function()
  vim.cmd("q")
end, { bang = true })
vim.api.nvim_create_user_command("QA", function()
  vim.cmd("qa")
end, { bang = true })
vim.api.nvim_create_user_command("Qa", function()
  vim.cmd("qa")
end, { bang = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked test",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
