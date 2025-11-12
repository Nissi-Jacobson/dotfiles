-- ~/.config/nvim/lua/plugins/markdown.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown" },
    opts = {
      markdown = {
        fat_headlines = true,
        bullets = { "-", "*", "+" },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
