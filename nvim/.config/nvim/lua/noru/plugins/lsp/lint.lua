return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            local linter = require("lint")
            -- Run vim.bo.filetype to get the filetype of a file
            linter.linters_by_ft = {
                c = { 'cpplint', 'cppcheck' },
                cmake = { 'cmakelint' },
                markdown = { 'vale' },
            }
            -- Lint on event
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    -- try_lint without arguments runs the linters defined in `linters_by_ft`
                    -- for the current filetype
                    linter.try_lint()

                    -- You can call `try_lint` with a linter name or a list of names to always
                    -- run specific linters, independent of the `linters_by_ft` configuration
                    -- require("lint").try_lint("cspell")
                end,
            })
        end
    },
}
