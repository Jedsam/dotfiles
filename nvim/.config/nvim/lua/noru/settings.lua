-- tab settings
vim.opt.tabstop = 2      -- Amount of spaces a \t character represent
vim.opt.softtabstop = 2  -- Amount of spaces when pressing TAB or Backspace
vim.opt.shiftwidth = 2   -- Amount of spaces used for indentation
vim.opt.expandtab = true -- Converts \t into spaces when pressing TAB

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.fillchars:append({ eob = " " })

-- Enable incremental search for "/" command
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Disable default status line showing the current mode (INSERT, VISUAL etc.)
vim.opt.showmode = false

--Cursor is always block-cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"

-- Load folds when opening a buffer
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  desc = "load view (folds), when opening file",
  command = "silent! loadview",
})
