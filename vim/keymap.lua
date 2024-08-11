local neogit = require('neogit')

-- buffers
vim.keymap.set('n', '[b',  ':bprev<cr>')
vim.keymap.set('n', ']b',  ':bnext<cr>')
vim.keymap.set('n', '<leader>bf',  ':Buffers<cr>')
vim.keymap.set('n', '<leader>bd',  ':bdelete<cr>')

-- files
vim.keymap.set('n', '<leader><leader>',  ':Files<cr>')
vim.keymap.set('n', '<leader>ff',  ':Files<cr>')
vim.keymap.set('n', '<leader>fs',  ':grep<space>')

-- tabs
vim.keymap.set('n', '[t',  ':tabprev<cr>')
vim.keymap.set('n', ']t',  ':tabnext<cr>')
vim.keymap.set('n', '<leader>tn',  ':tabnew<cr>')
vim.keymap.set('n', '<leader>tf',  ':tabfind')

-- quickfix
vim.keymap.set('n', '[q',  ':cprev<cr>')
vim.keymap.set('n', ']q',  ':cnext<cr>')

-- git
vim.keymap.set('n', '<Leader>gg', neogit.open)
vim.keymap.set('n', '<leader>gf',  ':GFiles<cr>')

-- lsp
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'cr', vim.lsp.buf.rename)
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'cu', vim.lsp.buf.references)
vim.keymap.set('n', 'ch', vim.lsp.buf.signature_help)
