-- tab settings
vim.opt.tabstop = 4 -- Amount of spaces a \t character represent
vim.opt.softtabstop = 4 -- Amount of spaces when pressing TAB or Backspace 
vim.opt.shiftwidth = 4 -- Amount of spaces used for indentation 
vim.opt.expandtab = true -- Converts \t into spaces when pressing TAB

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.fillchars:append { eob = " " }

-- Enable incremental search for "/" command
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Disable default status line showing the current mode (INSERT, VISUAL etc.)
vim.opt.showmode = false
