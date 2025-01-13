return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Highlight all files
        css = { rgb_fn = true }, -- Enable rgb() and rgba() for CSS
        html = { names = false }, -- Disable color names like Blue or Gray in HTML
      })
    end,
  },
}
