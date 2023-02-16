return function(mappings)
    local wk = require("which-key")
    for k, v in pairs(mappings) do
        wk.register(v, { mode = k })
    end
end
