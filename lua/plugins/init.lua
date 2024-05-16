return {
	{
		"stevearc/conform.nvim",
		config = function()
		event = 'BufWritePre',
			require "configs.conform"
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server", "stylua",
				"html-lsp", "css-lsp" , "prettier", "gopls"
			},
		},
	},
	{
	  "neovim/nvim-lspconfig",
	  config = function()
	    require("nvchad.configs.lspconfig").defaults()
	    require "configs.lspconfig"
	  end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	--
	--
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
