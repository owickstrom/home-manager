require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    nix = { "nixfmt" },
    ocaml = { "ocamlformat" },
    zig = { "zigfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
  },
})
