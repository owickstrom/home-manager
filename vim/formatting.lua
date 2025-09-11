require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "yapf" },
    nix = { "nixfmt" },
    ocaml = { "ocamlformat" },
    zig = { "zigfmt" },
    javascript = { "biome", "prettier" },
    typescript = { "biome", "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
