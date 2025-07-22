-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- plugins --
require("nvim_comment").setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = false,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil,
})

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- color highlights -> delete colorizer.lua too to remove
vim.o.termguicolors = true

-- Options
-- vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- lsp configs
-- vim.lsp.enable("bashls")
-- vim.lsp.enable("pyright")
