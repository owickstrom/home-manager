local neogit = require('neogit')
neogit.setup {}
vim.keymap.set('n', '<Leader>g', neogit.open)
