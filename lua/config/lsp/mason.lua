require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "biome", 'marksman', 'pyright', 'ruff_lsp', 'ruby_ls', 'rust_analyzer'},
}

