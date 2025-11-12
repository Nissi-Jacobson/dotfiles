-- ~/.config/nvim/lua/plugins/obsidian.lua
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false, -- start in any markdown buffer
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "vault1",
          path = "~/Documents/Hybrid Brain/",
        },
        {
          name = "vault2",
          path = "~/Documents/brain-dump/",
        },
      },
      notes_subdir = "pages", -- new notes land here
      daily_notes = {
        folder = "journals",
        date_format = "%Y-%m-%d",
        alias_format = "%A, %d %B %Y",
        template = "daily.md", -- matches a file in templates/
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {},
      },
      attachments = {
        img_folder = "assets", -- paste images here
        img_text_func = function(client, path)
          -- Use Obsidian-style embed: ![[relative/path]]
          path = client:vault_relative_path(path) or path
          return string.format("![[%s]]", path)
        end,
      },
      ui = { enable = true }, -- fancy checkboxes, etc.
      completion = { nvim_cmp = false },
      --- Handle Logseq/Obsidian links like [[Note Title]]
      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
      end,
      picker = { name = "telescope.nvim" },
      --- Optional: frontmatter for Logseq compatibility
      disable_frontmatter = false,
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New Note" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Open Today's Daily" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Open Yesterday's Daily" },
      { "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search in Vault" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
      { "<leader>ol", "<cmd>ObsidianLink<cr>", desc = "Link to Note" },
      { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Template" },
      { "gd", "<cmd>ObsidianFollowLink<cr>", desc = "Follow Wiki Link" },
    },
  },
}
