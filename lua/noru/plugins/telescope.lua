return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({})
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    find_command = { "rg", "--files", "--hidden", "-g", "!.git", },
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
