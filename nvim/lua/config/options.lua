local opt = vim.opt

opt.fillchars = { eob = " " }

-- remove background color
vim.opt.pumblend = 0

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- enable mouse mode
opt.mouse = "a"

-- show numbres
vim.wo.number = true

-- no swapfile
vim.opt.swapfile = false

-- disable text wrap
opt.wrap = false

-- system clipboard
opt.clipboard = "unnamedplus"


-- enable ignorecase + smartcase for better searching
opt.ignorecase = true
opt.smartcase = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

-- better splitting
opt.splitbelow = true
opt.splitright = true

-- enable 24-bit color
opt.termguicolors = true

-- enable the sign column to prevent the screen from jumping
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"
