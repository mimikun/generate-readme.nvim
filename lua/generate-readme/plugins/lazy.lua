local lazy_plugins = require("lazy").plugins()

local M = {}

--- Get markdown reference links
---@return table
M.markdown_reflinks = function()
    local data = {}

    for _, plugin in pairs(lazy_plugins) do
        local name = plugin.name
        local url = plugin.url:gsub(".git$", "")

        table.insert(data, string.format("[%s]:%s", name, url))
    end

    table.sort(data)

    return data
end

--- Get Plugin lists
---@return table
M.plugin_full_list = function()
    local data = {}

    for _, plugin in pairs(lazy_plugins) do
        local name = plugin.name
        local dependencies = plugin.dependencies
        table.insert(data, string.format("- [%s]", name))
        if dependencies then
            for _, dp in pairs(dependencies) do
                table.insert(data, string.format("    - [%s]", dp))
            end
        end
    end

    return data
end

return M
