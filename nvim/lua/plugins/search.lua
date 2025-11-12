-- ~/.config/nvim/lua/plugins/preview.lua
return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>ov", ":MarkdownPreviewToggle\n", desc = "Preview Markdown" },
    },
  },
}
