local lsp = require('lspconfig')
lsp.zls.setup {}
lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
lsp.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lsp.pyright.setup {}
lsp.gopls.setup {}
lsp.hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

lsp.jdtls.setup({
  settings = {
    java = {
      format = {
        enabled = false,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      completion = { guessMethodArguments = true },
    }
  }
})

lsp.clangd.setup {}

lsp.ts_ls.setup {}

lsp.biome.setup {}

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '',
  command = 'TSEnable highlight'
})

-- https://github.com/neovim/neovim/issues/30985
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
  },
  filetypes = {
    ["*"] = true,
  },
})

require("CopilotChat").setup {}
