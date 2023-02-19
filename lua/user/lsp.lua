local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    "pyright",
    "rust_analyzer",
    "lua_ls"
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
