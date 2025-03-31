return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.diagnostics.checkstyle.with({
                    extra_args = { "-c", "/google_checks.xml" },
                }),
                -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
