return {
    colorscheme = "catppuccin",
    opts = {
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,
        timeoutlen = 200,
        signcolumn = "yes",
    },
    g = {
        mapleader = " ",
    },
    mappings = {
        n = {
            ["<leader>"] = {
                f = {
                    name = "File",
                    f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
                    n = { "<cmd>enew<cr>", "Create a new file" },
                },
                e = { "<cmd>Neotree float<cr>", "Open the file explorer" }
            },
            f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
            e = { "<cmd>Neotree float<cr>", "Open the file explorer" }
        },
        i = {},
        v = {},
    },
    plugins = {
        {
            "windwp/nvim-autopairs",
            config = {},
        },
        {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup({})
            end,
        },
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
            }
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

        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            dependencies = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {'williamboman/mason.nvim'},           -- Optional
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},         -- Required
                {'hrsh7th/cmp-nvim-lsp'},     -- Required
                {'hrsh7th/cmp-buffer'},       -- Optional
                {'hrsh7th/cmp-path'},         -- Optional
                {'saadparwaiz1/cmp_luasnip'}, -- Optional
                {'hrsh7th/cmp-nvim-lua'},     -- Optional

                -- Snippets
                {'L3MON4D3/LuaSnip'},             -- Required
                {'rafamadriz/friendly-snippets'}, -- Optional
            },
            config = function()
                local lsp = require('lsp-zero').preset({
                    name = 'minimal',
                    set_lsp_keymaps = true,
                    manage_nvim_cmp = true,
                    suggest_lsp_servers = false,
                })

                -- Configure lua language server for neovim
                lsp.nvim_workspace()

                lsp.setup()
            end
        },

        -- Themes
        { 
            "catppuccin/nvim",
            name = "catppuccin",
            config = {
                flavour = "mocha",
            }
        },
    },
    lazy_opts = {
        root = vim.fn.stdpath("data") .. "/lazy",
        install = {
            colorscheme = { "catppuccin" }
        }
    },
    autocmds = {
        {
            event = "VimEnter",
            cmd = {
                desc = "Start Telescope when vim is opened with no argumens",
                callback = function()
                    local should_skip = false
                    if vim.fn.argc() > 0 or vim.fn.line2byte "$" ~= -1 or not vim.o.modifiable then
                        should_skip = true
                    else
                        for _, arg in pairs(vim.v.argv) do
                            if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
                                should_skip = true
                                break
                            end
                        end
                    end
                    if not should_skip then vim.cmd("Telescope find_files") end
                end,
            }
        }
    }
}
