-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_option("clipboard", "unnamedplus")

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

-- Options
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- Enable syntax highlighting
-- vim.cmd("syntax enable")
