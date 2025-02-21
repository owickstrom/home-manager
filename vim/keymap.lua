local neogit = require('neogit')

-- buffers
vim.keymap.set('n', '[b', ':bprev<cr>')
vim.keymap.set('n', ']b', ':bnext<cr>')
vim.keymap.set('n', '<leader>bb', ':FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>')

-- files
vim.keymap.set('n', '<leader><leader>', ':FzfLua files<cr>')
vim.keymap.set('n', '<leader>ff', ':FzfLua files<cr>')
vim.keymap.set('n', '<leader>fs', ':FzfLua grep<space>')

-- tabs
vim.keymap.set('n', '[t', ':tabprev<cr>')
vim.keymap.set('n', ']t', ':tabnext<cr>')
vim.keymap.set('n', '<leader>tn', ':tabnew<cr>')
vim.keymap.set('n', '<leader>tf', ':FzfLua tabs')

-- quickfix
vim.keymap.set('n', '[q', ':cprev<cr>')
vim.keymap.set('n', ']q', ':cnext<cr>')

-- completion
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')

-- git
vim.keymap.set('n', '<Leader>gg', neogit.open)
vim.keymap.set('n', '<leader>gf', ':FzfLua git_files<cr>')
vim.keymap.set('n', '<leader>gl', ':FzfLua git_commits<cr>')
vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<cr>')

-- lsp
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', ':FzfLua lsp_code_actions<cr>')
vim.keymap.set('n', '<leader>cf', ':FzfLua lsp_finder<cr>')
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>cu', ':FzfLua lsp_references<cr>')
vim.keymap.set('n', '<leader>ch', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>cws', ':FzfLua lsp_live_workspace_symbols<cr>')
vim.keymap.set('n', '<leader>cwd', ':FzfLua lsp_workspace_diagnostics<cr>')

vim.keymap.set('n', '<leader>ac', ':CopilotChat<cr>')
vim.keymap.set('n', '<leader>ae', ':CopilotChatExplain<cr>')
vim.keymap.set('n', '<leader>ar', ':CopilotChatReview<cr>')

-- compile
vim.keymap.set('n', '<F5>', ':make<cr>')
