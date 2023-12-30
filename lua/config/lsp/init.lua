require("config.lsp.mason")
require("config.lsp.nvim-cmp")
-- note: config/lsp/nvim-cmp is required here and in config/lsp/nvim-lspconfig, but require() will cache the module, so it must not affect the startuptime.
-- https://neovim.io/doc/user/lua.html#lua-module-load
require("config.lsp.nvim-lspconfig")
