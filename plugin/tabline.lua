-- local colors = {
--   bg = '#202328',
--   fg = '#bbc2cf',
--   yellow = '#ECBE7B',
--   cyan = '#008080',
--   darkblue = '#081633',
--   green = '#98be65',
--   orange = '#FF8800',
--   violet = '#a9a1e1',
--   magenta = '#c678dd',
--   blue = '#51afef',
--   red = '#ec5f67'
-- }
--
--
--
--
--     hi default link TablineCurrent         TabLineSel
--     hi default link TablineActive          PmenuSel
--     hi default link TablineHidden          TabLine
--     hi default link TablineFill            TabLineFill
--     hi default link tabline_a_normal       lualine_a_normal
--     hi default link tabline_b_normal       lualine_b_normal
--     hi default link tabline_c_normal       lualine_c_normal
require'tabline'.setup {enable = false}

require'lualine'.setup {
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
}

vim.api.nvim_set_keymap('n', '<space>tn', ':<C-u>tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>tr', ':<C-u>TablineTabRename ', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>bb', ':<C-u>TablineBuffersBind ', { noremap = true })
vim.api.nvim_set_keymap('n', 'gn', ':<C-u>TablineBufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gb', ':<C-u>TablineBufferPrevious<CR>', { noremap = true, silent = true })
