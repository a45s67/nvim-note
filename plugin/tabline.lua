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


local custom_gruvbox = require'lualine.themes.gruvbox'





require'tabline'.setup {
  -- defaults configuration options
  enable = true,
  options = {
  -- if lualine is installed tabline will use separators configured in lualine by default.
  -- These options can be used to override those settings.
    section_separators = {'', ''},
    component_separators = {'', ''},
    theme = custom_gruvbox,
    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = false, -- shows base filename only instead of relative path in filename
  }
}
vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]
