-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Key mappings
vim.api.nvim_set_keymap("n", "<Enter>", "o <ESC>", {})
vim.api.nvim_set_keymap("n", "<S-Enter>", "O <ESC>", {})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("", "<C-v>", '"+p', { noremap = true })
vim.api.nvim_set_keymap("", "<C-v>", '"+p', { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {})
vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- Go to the end of the line
vim.keymap.set({ "n", "v" }, "gl", "$", { noremap = true, silent = true })
-- Go to the first character of the line
vim.keymap.set({ "n", "v" }, "gh", "^", { noremap = true, silent = true })
-- Go to the markdown header below
vim.keymap.set({ "n", "v" }, "gj", "/^#<CR>", { noremap = true, silent = true })
-- Go to the markdown header above
vim.keymap.set({ "n", "v" }, "gk", "?^#<CR>", { noremap = true, silent = true })
