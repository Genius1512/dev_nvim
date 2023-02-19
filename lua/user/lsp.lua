local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    "pyright"
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
