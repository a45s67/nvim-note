-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local notifier = vim.notify("Try to attach LSP to this buffer...")
    -- Disable coc to prevent collision, and revert the tagfunc setting.
    if (vim.g.coc_enabled == 1) then
        notifier = vim.notify("Try to attach LSP to this buffer...Disabling Coc", "warn", {replace = notifier})
        vim.api.nvim_command('CocDisable')
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    notifier = vim.notify("Try to attach LSP to this buffer...Setting keymaps", "warn", {replace = notifier})
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set({'n', 'v'}, '<space>a', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.notify("Try to attach LSP to this buffer...Successed!", "info", {replace = notifier})
end

local capabilities = require("config.lsp.nvim-cmp").default_capabilities()

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local clangd_bin = 'clangd'
if vim.fn.executable('clangd') == 1 then
    clangd_bin = 'clangd'
else
    clangd_bin = 'clangd-17'
end

require('lspconfig')['clangd'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {
        -- Source: https://www.reddit.com/r/neovim/comments/pxd2og/comment/heofie3/?utm_source=share&utm_medium=web2x&context=3
        -- see clangd --help-hidden
        clangd_bin,
        "--background-index",
        -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
        -- to add more checks, create .clang-tidy file in the root directory
        -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion=iwyu",
    },
}

require('lspconfig')['gopls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
require('lspconfig')['biome'].setup{
    capabilities = capabilities,
    on_attach = on_attach
}

require('lspconfig')['ruff_lsp'].setup{
    on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}
require('lspconfig')['pyright'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        -- [How to use ruff-lsp along with pyright in Neovim · Issue #384 · astral-sh/ruff-lsp](https://github.com/astral-sh/ruff-lsp/issues/384)
        pyright = {
            disableOrganizeImports = true, -- Using Ruff
        },
        python = {
            analysis = {
                ignore = { '*' }, -- Using Ruff
                typeCheckingMode = 'off', -- Using mypy
            },
        },
    }
}
require'lspconfig'.marksman.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['ruby_lsp'].setup{
    on_attach = on_attach,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
}
