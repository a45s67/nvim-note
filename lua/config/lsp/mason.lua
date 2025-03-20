require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "biome", 'marksman', 'pyright', 'ruff', 'rust_analyzer', 'lua_ls' },
}
