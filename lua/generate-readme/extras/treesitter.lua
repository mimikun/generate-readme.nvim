local M = {}
local ts = require("nvim-treesitter.configs")

---Get the installed treesitter parsers by nvim-treesitter
---@return table
M.treesitter_parsers = function()
    local parsers = ts.get_ensure_installed_parsers()

    table.sort(parsers)

    return parsers
end

return M
