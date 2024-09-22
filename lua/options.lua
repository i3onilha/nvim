require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both'

local opt = vim.opt
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.scrolloff = 10
opt.relativenumber = true
opt.wrap = false
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
vim.cmd([[
    autocmd BufEnter * :Copilot suggestion
]])
vim.cmd([[
  augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])


-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
