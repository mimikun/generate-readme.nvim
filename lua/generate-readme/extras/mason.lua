local M = {}

---Get the installed lsp servers and tools by mason.nvim
---@return table
M.mason_tools = function()
    local install_dir = string.format("%s/bin", vim.env.MASON)

    if vim.fn.isdirectory(install_dir) == 0 then
        return {}
    end

    local files
    files = vim.split(vim.fn.globpath(install_dir, "*"), "\n", {})
    files = vim.tbl_map(function(file)
        return vim.fn.fnamemodify(file, ":t")
    end, files)

    table.sort(files)

    return files
end

return M
