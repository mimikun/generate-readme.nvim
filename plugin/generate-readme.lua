if vim.g.loaded_generate_readme then
    return
end

local gr = require("generate-readme")

vim.api.nvim_create_user_command("GenerateReadme", function()
    gr.generate()
end, { desc = "Generate a nvim README.md file" })

vim.api.nvim_create_user_command(
    "OpenReadme",
    string.format("edit %s", gr.readme_path),
    { desc = "Open the nvim README.md file" }
)

vim.g.loaded_generate_readme = true
