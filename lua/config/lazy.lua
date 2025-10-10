-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
        -- lsp
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'quangnguyen30192/cmp-nvim-ultisnips',
        -- snips
        'SirVer/ultisnips',
        'honza/vim-snippets',

        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
        },

        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
            -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
            ---@module 'render-markdown'
            ---@type render.md.UserConfig
            opts = {},
        },
        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- add options here
                -- or leave it empty to use the default settings
            },
            keys = {
                -- suggested keymap
                { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
            },
        },
        {
            "epwalsh/obsidian.nvim",
            version = "*",  -- recommended, use latest release instead of latest commit
            lazy = true,
            ft = "markdown",
            -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
            -- event = {
                --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
                --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
                --   -- refer to `:h file-pattern` for more examples
                --   "BufReadPre path/to/my-vault/*.md",
                --   "BufNewFile path/to/my-vault/*.md",
                -- },
                dependencies = {
                    -- Required.
                    "nvim-lua/plenary.nvim",

                    -- see below for full list of optional dependencies 👇
                },
                opts = {
                    workspaces = {
                        {
                            name = "personal",
                            path = "~/vaults/personal",
                        },
                        {
                            name = "work",
                            path = "~/vaults/work",
                        },
                    },

                    -- see below for full list of options 👇
                },
            },

        'phaazon/hop.nvim',
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
        },
        {
            'dhruvasagar/vim-table-mode',
            ft = { "markdown" },
        },
        {
            "folke/flash.nvim",
            event = "VeryLazy",
            ---@type Flash.Config
            opts = {},
            -- stylua: ignore
            keys = {
                { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
                { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
                { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
                { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
                { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
            },
        },
        {
            'echasnovski/mini.nvim',
            version = '*'
        },
        {
            "mason-org/mason.nvim",
            opts = {}
        }

    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
