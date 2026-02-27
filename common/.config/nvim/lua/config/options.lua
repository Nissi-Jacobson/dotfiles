-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

---
-- Disable modelines completely
vim.o.modeline = false
vim.o.modelines = 0
---

---
-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt
opt.conceallevel = 2 -- prettier Markdown
opt.wrap = true -- soft wrap prose
opt.linebreak = true -- wrap at word boundaries
opt.spell = true -- spell-check by default in md
opt.spelllang = { "en" }
opt.foldenable = false


-- Treat hidden files as searchable, but we'll ignore noisy dirs via ripgrep flags
opt.grepprg = [[rg --vimgrep --smart-case --hidden]]
---

