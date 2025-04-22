return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({})
    vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol", noremap = true, silent = true })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
