require('mini.ai').setup()
require('mini.comment').setup()
require('mini.move').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.surround').setup()

require('mini.files').setup()
vim.keymap.set('n', '\\e', '<Cmd>:lua MiniFiles.open()<CR>', { silent = true })
