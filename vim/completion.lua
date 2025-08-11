vim.opt.completeopt = "menu,menuone,noinsert,preview"

local fzf = require("fzf-lua")
fzf.setup({ winopts = { backdrop = false, border = 'double' } })
fzf.register_ui_select()
