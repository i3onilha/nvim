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
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim", "lua", "vimdoc",
	     "html", "css"
			},
		},
	},
}

