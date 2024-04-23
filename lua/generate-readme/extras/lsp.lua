local lspconfig = require("lspconfig")

local M = {}

---Get lsp servers
---@return table
M.lsp_servers = function()
    local servers = lspconfig.util.available_servers()

    table.sort(servers)

    return servers
end

return M
