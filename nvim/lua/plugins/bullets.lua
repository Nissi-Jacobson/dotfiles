-- Logseq
return
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text" },
    config = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text" }
      vim.g.bullets_outline_levels = { "ROM", "ABC", "num", "abc", "rom", "std-" }
      -- Automatically continue bullets
      vim.g.bullets_renumber_on_change = 1
      vim.g.bullets_auto_indent_after_colon = 1
    end,
  }


