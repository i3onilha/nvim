require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
map('n', 'ml', ':vertical resize +10<CR>', default_opts)
map('n', 'mi', ':vertical resize -10<CR>', default_opts)
map('n', 'rs', ':resize ', default_opts)
map('n', 'rv', ':vertical resize ', default_opts)
map('n', 's', ':w<CR>', default_opts)

-- Execute Commands
map('n', '<M-h>', ':tabprevious<CR>', default_opts)
map('n', '<M-l>', ':tabnext<CR>', default_opts)

-- Function Keys Mappings
map('n', '<F4>', ':!go fmt %<CR>', default_opts)
map('n', '<F8>', ':!go run %<CR>', default_opts)
map('n', '<F9>', ':!go run .<CR>', default_opts)
map('n', 'Q', ':q<CR>', default_opts)

-- Source, Split, Tab and Buffer Commands
map('n', 'so', ':so ~/.config/nvim/lua/mappings.lua<CR>', default_opts)
map('n', 'em', ':e ~/.config/nvim/lua/mappings.lua<CR>', default_opts)
map('n', 'et', ':e ~/.config/nvim/lua/chadrc.lua<CR>', default_opts)
map('n', 'eo', ':e ~/.config/nvim/lua/options.lua<CR>', default_opts)
map('n', '>', ':vsplit<CR>', default_opts)
map('n', '<', ':split<CR>', default_opts)
map('n', 'sp', ':vsplit<CR>', default_opts)
map('n', 'sP', ':split<CR>', default_opts)
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
map('n', 'ga', ':!git a %<CR><ESC>', default_opts)
map('n', 'GA', ':!git a .<CR>', default_opts)
map('n', 'gs', ':!git st<CR>', default_opts)
map('n', 'gc', ':!git ci -m "', default_opts)

-- Telescope commands
map('n', '<C-p>', '<cmd>Telescope find_files<CR>', default_opts)
map('n', '<C-g>', '<cmd>Telescope live_grep<CR>', default_opts)

map('n', 'dp', ':GoDebugBreakpoint<CR>', default_opts)
map('n', 'ds', ':GoDebugStop<CR>', default_opts)
map('n', 'dr', ':GoDebugRestart<CR>', default_opts)
map('n', 'de', ':GoDebugStep<CR>', default_opts)
map('n', 'do', ':GoDebugStepOut<CR>', default_opts)
map('n', 'dn', ':GoDebugNext<CR>', default_opts)
map('n', 'dt', ':GoDebugTest<CR>', default_opts)
-- Select block commands
map('n', '<C-\\>', ':lua SelectBlock()<CR>', default_opts)
map('n', '|', ':lua SelectBlock()<CR>', default_opts)
function SelectBlock()
    vim.cmd([[normal! V]])
    vim.cmd([[normal! $]])
    vim.cmd([[normal! %]])
end

-- Go definition
map('n', 'ge', ':lua GoDefinition("e")<CR>', default_opts)
function GoDefinition(split_cmd)
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
    if err or result == nil or vim.tbl_isempty(result) then
      print("Definition not found")
      return
    end
    if vim.tbl_islist(result) then
      vim.lsp.util.jump_to_location(result[1], split_cmd == 'split' and 'split' or nil)
    else
      vim.lsp.util.jump_to_location(result, split_cmd == 'split' and 'split' or nil)
    end
  end)
end

-- Others
map('n', 'cp', ':Copilot suggestion<CR>')
map('n', 'e', ':e<CR>', default_opts)
map('n', 'ln', ':lua Toggle_line_numbers_and_sign_column()<CR>', default_opts)

function Toggle_line_numbers_and_sign_column()
	if vim.o.number then
		-- If line numbers are currently enabled, disable them and the sign column
		vim.o.number = false
		vim.o.relativenumber = false
		vim.o.signcolumn = "no"
	else
		-- If line numbers are currently disabled, enable them and the sign column
		vim.o.number = true
		vim.o.relativenumber = true
		vim.o.signcolumn = "yes"
	end
end-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
