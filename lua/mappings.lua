require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "j", "jzz")
map("n", "<Down>", "jzz")
map("n", "k", "kzz")
map("n", "<Up>", "kzz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "G", "Gzz")
map("n", "s", ":w<CR>")
map("n", "Q", ":q<CR>")
map('n', 'sp', ':vsplit<CR>', default_opts)
map('n', 'sP', ':split<CR>', default_opts)
map("n", "<ln>", ":bprevious<CR>")
map("n", "<lp>", ":bnext<CR>")

map('n', 'pp', '<cmd>Telescope find_files<CR>', default_opts)
map('n', 'pg', '<cmd>Telescope live_grep<CR>', default_opts)
map('n', 'pb', '<cmd>Telescope buffers<CR>', default_opts)
map('n', 'pt', '<cmd>Telescope help_tags<CR>', default_opts)
map('n', 'so', ':so ~/.config/nvim/lua/mappings.lua<CR>', default_opts)
map('n', 'cp', ':Copilot suggestion<CR>', default_opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>")
