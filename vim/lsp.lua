local lsp = require('lspconfig')
lsp.zls.setup{}
lsp.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
