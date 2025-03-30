return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
        icons = false, -- setting to "true" requires "nvim-web-devicons"
        status = false,
    },
    keys = {
        { "<leader>a", "<cmd>silent Grapple toggle<cr>", desc = "Tag a file" },
        { "<c-e>", "<cmd>silent Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

        { "<c-h>", "<cmd>silent Grapple select index=1<cr>", desc = "Select first tag" },
        { "<c-j>", "<cmd>silent Grapple select index=2<cr>", desc = "Select second tag" },
        { "<c-k>", "<cmd>silent Grapple select index=3<cr>", desc = "Select third tag" },
        { "<c-l>", "<cmd>silent Grapple select index=4<cr>", desc = "Select fourth tag" },

    },
}
    
