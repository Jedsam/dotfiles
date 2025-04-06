return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            vim.diagnostic.config({
                virtual_lines = { current_line = true }
            })
            vim.lsp.set_log_level("off")
        end
    }
}

