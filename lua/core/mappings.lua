return function(mappings)
    local wk = require("which-key")
    for mode, mapping in pairs(mappings) do
        wk.register(mapping, { mode = mode })
    end
end
