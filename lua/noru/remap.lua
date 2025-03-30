vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>",vim.cmd.w) -- Save a file
vim.keymap.set("i", "jj", "<ESC>", { silent = true }) -- Use jj in instert mode to swap back to normal mode

-- Making delete permamently delete stuff and add new keybind for it (cut operation)
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
-- Making x delete stuff without messing with the clipboard
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })
-- Set Ctrl x for cutting stuff
vim.keymap.set({ "n", "v" }, "<C-x>", "d", { noremap = true, silent = true })
-- Normal mode mappings (switching windows)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Insert mode mappings (switching windows and staying in Insert mode)
vim.keymap.set('i', '<C-h>', '<Esc><C-w>h', opts)
vim.keymap.set('i', '<C-j>', '<Esc><C-w>j', opts)
vim.keymap.set('i', '<C-k>', '<Esc><C-w>k', opts)
vim.keymap.set('i', '<C-l>', '<Esc><C-w>l', opts)
