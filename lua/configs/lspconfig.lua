-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }
local util = lspconfig.util

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- go
lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.intelephense.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		intelephense = {
			stubs = { "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter", "gd", "hash", "iconv", "json", "libxml", "mbstring", "mcrypt", "mysql", "mysqli", "pcre", "PDO", "pdo_mysql", "Phar", "posix", "readline", "Reflection", "session", "SimpleXML", "sockets", "SPL", "standard", "superglobals", "tokenizer", "xml", "xmlreader", "xmlwriter", "zip", "zlib" },
			files = {
				maxSize = 5000000,
			},
		},
	},
})
