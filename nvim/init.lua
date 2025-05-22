-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_option("clipboard", "unnamed")
-- Copy/paste from system clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
-- Delete without changing the registers
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
