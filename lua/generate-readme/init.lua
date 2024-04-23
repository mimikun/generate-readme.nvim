local uv = vim.uv
local get_plugins = require("generate-readme.plugins.lazy").plugin_full_list()
local get_ref_links = require("generate-readme.plugins.lazy").markdown_reflinks()
local get_treesitter_parsers = require("generate-readme.extras.treesitter")
local get_lsp_servers = require("generate-readme.extras.lsp")
local get_mason_tools = require("generate-readme.extras.mason")

local M = {}

M.readme_path = string.format("%s/README.md", vim.fn.stdpath("config"))

local buf_data = {}
table.insert(buf_data, "# My neovim configuration")
table.insert(buf_data, "")
table.insert(buf_data, "## Plugins")
table.insert(buf_data, "")
table.insert(buf_data, "手動で配置してください")
table.insert(buf_data, "")

function M.generate()
    local readme = {}
    readme.plugins = get_plugins()
    readme.lspServers = get_lsp_servers()
    readme.masonTools = get_mason_tools()
    readme.treesitterParsers = get_treesitter_parsers()
    readme.refLinks = get_ref_links()

    table.insert(buf_data, table.concat(readme.plugins, "\n"))
    table.insert(buf_data, "")
    table.insert(buf_data, "### Denops Plugins")
    table.insert(buf_data, "")
    table.insert(buf_data, "Disable when [human rights] are violated.")
    table.insert(buf_data, "[denops.vim] needs [human rights].")
    table.insert(buf_data, "")
    table.insert(buf_data, "手動で配置してください")
    table.insert(buf_data, "")
    table.insert(buf_data, "### Vim Script Plugins")
    table.insert(buf_data, "")
    table.insert(buf_data, "手動で配置してください")
    table.insert(buf_data, "")
    table.insert(buf_data, "#### Colorscheme")
    table.insert(buf_data, "")
    table.insert(buf_data, "手動で配置してください")
    table.insert(buf_data, "")
    table.insert(buf_data, "### Lua Plugins")
    table.insert(buf_data, "")
    table.insert(buf_data, "手動で配置してください")
    table.insert(buf_data, "")
    table.insert(buf_data, "#### Colorscheme")
    table.insert(buf_data, "")
    table.insert(buf_data, "手動で配置してください")
    table.insert(buf_data, "")
    table.insert(buf_data, "## nvim-treesitter parsers")
    table.insert(buf_data, "")
    table.insert(buf_data, table.concat(readme.treesitterParsers, "\n"))
    table.insert(buf_data, "")
    table.insert(buf_data, "## Mason managed tools")
    table.insert(buf_data, "")
    table.insert(buf_data, table.concat(readme.masonTools, "\n"))
    table.insert(buf_data, "")
    table.insert(buf_data, "## LSP servers")
    table.insert(buf_data, "")
    table.insert(buf_data, table.concat(readme.lspServers, "\n"))
    table.insert(buf_data, "")
    table.insert(
        buf_data,
        "[human rights]:https://github.com/mimikun/dotfiles/blob/master/docs/GLOSSARY.md#human-rights"
    )
    table.insert(buf_data, table.concat(readme.refLinks, "\n"))

    local data = table.concat(buf_data, "\n")
    local fd = assert(uv.fs_open(M.readme_path, "w", 438))
    assert(uv.fs_write(fd, data))
    assert(uv.fs_close(fd))

    vim.notify("[generate-readme] README.md file generated.", nil, nil)
end

return M
