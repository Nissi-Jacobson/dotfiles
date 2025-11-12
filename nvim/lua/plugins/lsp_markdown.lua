-- ~/.config/nvim/lua/plugins/lsp_markdown.lua
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "markdownlint",      -- Linter
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          filetypes = { "markdown" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
}
