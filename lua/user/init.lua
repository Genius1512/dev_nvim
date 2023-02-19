return {
    colorscheme = "catppuccin",
    mapleader = " ",
    opts = {
        -- 4 wide tabs
		shiftwidth = 4,
		tabstop = 4,
		expandtab = true,

		-- line numbers
		number = true,
		relativenumber = true,

		-- use signcolumn
		signcolumn = "yes",

		-- timeout to execute key presses
		timeoutlen = 150
	},
    g = {},
    mappings = {
        n = {
            ["<leader>"] = {
                -- basic actions
                w = {
                    function()
                        local file_name = vim.fn.bufname() -- get current file name
                        if file_name == "" then -- is it an empty buffer?
                            vim.api.nvim_feedkeys(":w ", "n", true) -- yes, prepare write command for user to type the filename in
                        else
                            vim.cmd([[ write ]]) -- no, already is a file, just save
			            end
                    end,
                    "Save the file",
                },
                q = { "<cmd>q<cr>", "Close the editor" },
                n = { "<cmd>enew<cr>", "Create a new file" },

                -- file management ui
                f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
                e = { "<cmd>Neotree float<cr>", "Open the file tree" },
            }
        },
        i = {},
        v = {},
        x = {},

    },
    plugins = {
        -- file management ui
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            dependencies = {
                "nvim-lua/plenary.nvim"
            },
            config = {
                defaults = {
                    file_ignore_patterns = {
                        "target/",
                        "node_modules/",
                    }
                }
            },
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            config = function()
                vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            end,
        },

        -- lsp
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            dependencies = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                { 'williamboman/mason.nvim' }, -- Optional
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' }, -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'hrsh7th/cmp-buffer' }, -- Optional
                { 'hrsh7th/cmp-path' }, -- Optional
                { 'saadparwaiz1/cmp_luasnip' }, -- Optional
                { 'hrsh7th/cmp-nvim-lua' }, -- Optional

                -- Snippets
                { 'L3MON4D3/LuaSnip' }, -- Required
                { 'rafamadriz/friendly-snippets' }, -- Optional
            },
            config = function()
                require("user.lsp")
            end
        },
        {
            "folke/trouble.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = {
                position = "right",
                width = 35,
            },
        },

        -- more information
        { "lewis6991/gitsigns.nvim", config = true },

        -- themes
        {
            "catppuccin/nvim",
            name = "catppuccin",
            config = {
                flavour = "mocha",
            },
        },
    },
    autocmds = {},
}
