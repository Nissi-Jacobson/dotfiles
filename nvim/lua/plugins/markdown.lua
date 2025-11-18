-- Logseq
return  {
  "tadmccorkle/markdown.nvim",
  ft = "markdown",
  config = function()
    require("markdown").setup({
      mappings = {
        inline_surround_toggle = "gs",
        inline_surround_toggle_line = "gss",
        inline_surround_delete = "ds",
        inline_surround_change = "cs",
        link_add = "gl",
        link_follow = "gx",
        go_curr_heading = "]c",
        go_parent_heading = "]p",
        go_next_heading = "]]",
        go_prev_heading = "[[",
      },
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }
        
        -- Logseq-like bindings
        map("n", "<Tab>", "<cmd>lua require('markdown').indent()<cr>", opts)
        map("n", "<S-Tab>", "<cmd>lua require('markdown').unindent()<cr>", opts)
      end,
    })
  end,
}

