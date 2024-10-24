-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.showmatch = true -- Highlight matching pair
vim.opt.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,space:·"
vim.opt.showbreak = "↪"
vim.opt.visualbell = true -- No noise just flash

-- Visual tweaks
vim.opt.cursorcolumn = true -- Highlight the coloumn of the cursor
vim.opt.textwidth = 120

-- Real programmers don't use TABs but spaces
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search tweaks
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true -- Set /g flag regex search

vim.o.background = "dark"
