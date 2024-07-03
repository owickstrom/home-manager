vim.keymap.set('n', '[b',  ':bprev<cr>')
vim.keymap.set('n', ']b',  ':bnext<cr>')
vim.keymap.set('n', '<leader>bf',  ':buffers<cr>:buffer<space>')
vim.keymap.set('n', '<leader>bd',  ':bdelete<cr>')

vim.keymap.set('n', '[t',  ':tabprev<cr>')
vim.keymap.set('n', ']t',  ':tabnext<cr>')
vim.keymap.set('n', '<leader>tn',  ':tabnew<cr>')
vim.keymap.set('n', '<leader>tf',  ':tabfind')

vim.keymap.set('n', '[q',  ':cprev<cr>')
vim.keymap.set('n', ']q',  ':cnext<cr>')

vim.keymap.set('n', '<leader>f',  ':grep<space>')
