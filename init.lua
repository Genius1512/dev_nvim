local config = require("user")

require("core.options")(config.opts, config.g, config.mapleader)
require("core.plugins")(config.plugins, config.colorscheme)
require("core.mappings")(config.mappings)
require("core.autocmds")(config.autocmds)

if config.colorscheme == nil then
else
	vim.cmd("colorscheme " .. config.colorscheme)
end
