-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"

-- SSH sessions have no $DISPLAY/$WAYLAND_DISPLAY, so no clipboard provider
-- can work — and while 'clipboard' is set, Nvim deliberately skips its
-- automatic OSC 52 fallback (:h g:clipboard). Opt in explicitly so yanks
-- reach the local terminal's clipboard over SSH (kitty supports this).
local has_display = (vim.env.DISPLAY and #vim.env.DISPLAY > 0)
    or (vim.env.WAYLAND_DISPLAY and #vim.env.WAYLAND_DISPLAY > 0)
if not has_display then
  vim.g.clipboard = "osc52"
end
