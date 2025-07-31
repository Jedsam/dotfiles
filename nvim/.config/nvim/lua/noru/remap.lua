vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>", vim.cmd.w) -- Save a file
vim.keymap.set("i", "jj", "<ESC>", { silent = true }) -- Use jj in instert mode to swap back to normal mode

-- Making delete permamently delete stuff and add new keybind for it (cut operation)
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
-- Making x delete stuff without messing with the clipboard
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })
-- Making c change stuff without messign with the clipboard
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true })

-- Set Ctrl x for cutting stuff
vim.keymap.set({ "n", "v" }, "<C-x>", "d", { noremap = true, silent = true })

-- Add move operation for visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Smoother scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Add <leader> + x for Ctrl + X (decrease)
vim.keymap.set("n", "<leader>x", "<C-x>", { noremap = true })

-- Add a new line without insert mode
vim.keymap.set("n", "<leader>o", "o<C-[>", { silent = true })
vim.keymap.set("n", "<leader>O", "O<C-[>", { silent = true })

-- Select all text
-- vim.keymap.set("n", "<C-a>", "gg0VG")
