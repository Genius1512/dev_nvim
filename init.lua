local config = require("user")

require("core.options")(config.opts, config.g, config.colorscheme, config.mapleader)
require("core.plugins")(config.plugins, config.colorscheme)
require("core.mappings")(config.mappings)
require("core.autocmds")(config.autocmds)
