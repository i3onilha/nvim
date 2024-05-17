require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Normal Mode Remaps
map('n', 'j', 'jzz', default_opts)
map('n', '<Down>', 'jzz', default_opts)
map('n', 'k', 'kzz', default_opts)
map('n', '<Up>', 'kzz', default_opts)
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', 'G', 'Gzz', default_opts)
map('n', 'ml', ':vertical resize 80<CR>', default_opts)
map('n', 'mi', ':resize 30<CR>', default_opts)
map('n', 's', ':w<CR>', default_opts)

-- Execute Commands
map('n', '<M-h>', ':tabprevious<CR>', default_opts)
map('n', '<M-l>', ':tabnext<CR>', default_opts)

-- Function Keys Mappings
map('n', '<F4>', ':go fmt %<CR>', default_opts)
map('n', '<F8>', ':go run %<CR>', default_opts)
map('n', '<F9>', ':go run .<CR>', default_opts)
map('n', 'Q', ':q<CR>', default_opts)

-- Source, Split, Tab and Buffer Commands
map('n', 'so', ':so ~/.config/nvim/lua/mappings.lua<CR>', default_opts)
map('n', 'em', ':e ~/.config/nvim/lua/mappings.lua<CR>', default_opts)
map('n', 'sp', ':vsplit<CR>', default_opts)
map('n', 'sP', ':split<CR>', default_opts)
map('n', 'SP', ':split<CR>', default_opts)
map('n', 'st', ':tabnew<CR>', default_opts)
map('n', 'nt', ':tabnew<CR>', default_opts)
map('n', 'bp', ':bprevious<CR>', default_opts)
map('n', 'bn', ':bnext<CR>', default_opts)

-- Tab and Number Settings
map('n', 't4', ':set autoindent noexpandtab tabstop=4 shiftwidth=4 ts=4 sw=4<CR>', default_opts)
map('n', 't2', ':set autoindent noexpandtab tabstop=2 shiftwidth=2 ts=2 sw=2<CR>', default_opts)
map('n', 'cn', ':set norelativenumber!<CR>', default_opts)

-- Edit Commands
map('n', 'se', ':e %<CR>', default_opts)
map('n', 'sf', ':e %<CR>', default_opts)

-- Git Commands
map('n', 'ga', ':!git a %<CR>', default_opts)
map('n', 'GA', ':!git a .<CR>', default_opts)
map('n', 'gs', ':!git st<CR>', default_opts)
map('n', 'gc', ':!git ci -m "', default_opts)

-- Telescope commands
map('n', '<C-p>', '<cmd>Telescope find_files<CR>', default_opts)
map('n', '<C-g>', '<cmd>Telescope live_grep<CR>', default_opts)
map('n', 'pb', '<cmd>Telescope buffers<CR>', default_opts)
map('n', 'pt', '<cmd>Telescope help_tags<CR>', default_opts)

-- Select block commands
map('n', '<C-\\>', ':lua SelectBlock()<CR>', default_opts)
map('n', '|', ':lua SelectBlock()<CR>', default_opts)
function SelectBlock()
    vim.cmd([[normal! V]])
    vim.cmd([[normal! $]])
    vim.cmd([[normal! %]])
end

-- CoC Actions
map('n', 'gd', ':call CocAction(\'jumpDefinition\', \'vsplit\')<CR>', default_opts)
map('n', 'GD', ':call CocAction(\'jumpDefinition\', \'split\')<CR>', default_opts)
map('n', 'gt', ':call CocAction(\'jumpDefinition\', \'tabe\')<CR>', default_opts)
map('n', 'ge', ':call CocAction(\'jumpDefinition\', \'e\')<CR>', default_opts)

-- Others
map('n', 'cp', ':Copilot suggestion<CR>')
map('n', 'e', ':e<CR>', default_opts)
