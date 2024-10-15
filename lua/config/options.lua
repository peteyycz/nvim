-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.mapleader = " "

opt.autowrite = true 
opt.showmatch = true -- Highlight matching pair
opt.completeopt = "menu,menuone,noselect"
opt.list = true
opt.listchars = "tab:▸ ,eol:¬,extends:❯,precedes:❮,space:·"
opt.showbreak = "↪"
opt.visualbell = true -- No noise just flash

-- Visual tweaks
opt.cursorcolumn = true -- Highlight the coloumn of the cursor
opt.textwidth = 120
opt.relativenumber = true

-- Real programmers don't use TABs but spaces
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search tweaks
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true -- Set /g flag regex search
