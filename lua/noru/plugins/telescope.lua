return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    hidden = true,
                    no_ignore = true,
                    file_ignore_patterns = {
                        "node_modules",
                        ".ruff_cache",
                        ".git/",
                        ".mypy_cache",
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", function()
                require("telescope.builtin").find_files({
                    hidden = false,
                    find_command = { "rg", "--files", "-g", "!.git", },
                })
            end, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>phf", function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end, { noremap = true, silent = true })
            vim.keymap.set("n", "<C-g>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>gs", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
        end,
    },
    {
        -- Plugin for code actions
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
        end,
    },
}
