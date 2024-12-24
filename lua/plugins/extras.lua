local null_ls = require("null-ls")

-- Configure null-ls and return an empty table
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.goimports,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})

return {}
