require'hop'.setup()
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', 'fc', function()
    hop.hint_char1({ current_line_only = true })
end, {remap=true})

vim.keymap.set('','fw', function()
    hop.hint_words({ current_line_only = true })
end, {remap=true})

vim.keymap.set('','<Space>w', function()
    hop.hint_words()
end, {remap=true})

vim.keymap.set('','<Space>l', function()
    hop.hint_lines_skip_whitespace()
end, {remap=true})

-- vim.keymap.set('','s', function()
--      hop.hint_char2({ case_insensitive = true })
-- end, {remap=true})
