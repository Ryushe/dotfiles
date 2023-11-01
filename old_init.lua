# heheh
 
-- Key mappings
vim.api.nvim_set_keymap('n', '<Enter>', 'o <ESC>', {})
vim.api.nvim_set_keymap('n', '<S-Enter>', 'O <ESC>', {})
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })

-- Turn syntax highlighting on
vim.cmd('syntax on')

-- Number lines
vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
