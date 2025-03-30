return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            vim.keymap.set({'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {} )
        end
    }
}

