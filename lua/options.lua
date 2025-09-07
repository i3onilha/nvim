require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both'

local opt = vim.opt
opt.encoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.scrolloff = 10
opt.relativenumber = true
opt.wrap = false
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.background = "dark"

local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local api = vim .api
api.nvim_set_hl(0, "Comment", { fg = "#7CFC00", italic = true })
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
cmd([[
    autocmd BufEnter * :Copilot suggestion
]])
cmd([[
  augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])
autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})
