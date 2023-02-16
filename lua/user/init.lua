return {
    opts = {
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,
    },
    g = {},
    plugins = {
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
        }
    },
    lazy_opts = {
        root = vim.fn.stdpath("data") .. "/lazy"
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
