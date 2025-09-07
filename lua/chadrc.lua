-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lu
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "mito-laser",
  statusline = {
    separator_style = "block",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}
M.plugins = "custom.plugins"

return M

