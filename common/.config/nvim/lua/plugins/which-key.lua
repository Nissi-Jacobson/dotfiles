return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    sort = { "icase", "alphanum" },  -- Just alphanum for ascending alphabetical order
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    spec = {
      { "<leader>o", group = "obsidian" },
      { "<leader>l", group = "latex" },
      { "<leader>m", group = "markdown" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
