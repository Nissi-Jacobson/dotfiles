return {
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
    init = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
      vim.g.bullets_enable_in_empty_buffers = 0
      vim.g.bullets_checkbox_markers = " x"
      vim.g.bullets_set_mappings = 1
      vim.g.bullets_delete_last_bullet_if_empty = 1
    end,
    keys = {
      { "<Tab>", "<Plug>(bullets-demote)", mode = "i", ft = "markdown", desc = "Indent list item" },
      { "<S-Tab>", "<Plug>(bullets-promote)", mode = "i", ft = "markdown", desc = "Dedent list item" },
      { ">>", "<Plug>(bullets-demote)", mode = "n", ft = "markdown", desc = "Indent list item" },
      { "<<", "<Plug>(bullets-promote)", mode = "n", ft = "markdown", desc = "Dedent list item" },
      { ">", "<Plug>(bullets-demote)", mode = "v", ft = "markdown", desc = "Indent list items" },
      { "<", "<Plug>(bullets-promote)", mode = "v", ft = "markdown", desc = "Dedent list items" },
    },
  },
}
