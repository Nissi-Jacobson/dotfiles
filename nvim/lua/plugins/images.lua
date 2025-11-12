-- ~/.config/nvim/lua/plugins/images.lua
return {
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = function()
          return "assets" -- relative to current note
        end,
        relative_to_current_file = true,
        prompt_for_file_name = true,
        use_absolute_path = false,
        insert_mode_after_paste = true,
      },
    },
    keys = {
      { "<leader>op", function() require("img-clip").paste_image() end, desc = "Paste image to assets/" },
    },
  },
}
