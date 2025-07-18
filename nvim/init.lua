-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_option("clipboard", "unnamed")
-- Copy/paste from system clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
-- Delete without changing the registers
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- 4 space indentation instead of 2
-- Helper function to set indentation per filetype
local function set_indentation(ft, sw, sts, ts, expand)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.opt_local.shiftwidth = sw
      vim.opt_local.softtabstop = sts
      vim.opt_local.tabstop = ts
      vim.opt_local.expandtab = expand
    end
  })
end

-- Examples:
set_indentation("python", 4, 4, 4, true)
set_indentation("lua",    2, 2, 2, true)
set_indentation("javascript", 4, 4, 4, true)
set_indentation("java", 4, 4, 4, true)
set_indentation("c", 4, 4, 4, false) -- for tabs instead of spaces
