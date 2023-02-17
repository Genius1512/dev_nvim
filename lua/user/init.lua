return {
    colorscheme = "catppuccin",
    opts = {
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,
        timeoutlen = 200,
        signcolumn = "yes",
        number = true,
        relativenumber = true,
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
                e = { "<cmd>Neotree float<cr>", "Open the file explorer" },
                t = { "<cmd>TroubleToggle<cr>", "Open trouble" },
                ["/"] = { function() require("Comment.api").toggle.linewise.current() end, "Toggle comments" },
                g = { "<cmd>terminal lazygit<cr>i", "Open lazygit" },
            },
            f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
            e = { "<cmd>Neotree float<cr>", "Open the file explorer" },
            t = { "<cmd>TroubleToggle<cr>", "Open trouble" },
            g = { "<cmd>terminal lazygit<cr>i", "Open lazygit" },
        },
        i = {},
        v = {},
        x = {
            ["<leader>"] = {
                ["/"] = {
                    function()
                        local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
                        local api = require("Comment.api")
                        vim.api.nvim_feedkeys(esc, "nx", false)
                        api.toggle.linewise(vim.fn.visualmode())
                    end,
                    "Toggle comments"
                }
            }
        }

    },
    plugins = {
        {
            "windwp/nvim-autopairs",
            config = {},
        },
        {
            "numToStr/Comment.nvim",
            config = {}
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
            "lewis6991/gitsigns.nvim",
            config = {},
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
                local lsp = require('lsp-zero').preset("recommended")

                -- Configure lua language server for neovim
                lsp.nvim_workspace()

                lsp.setup()
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
