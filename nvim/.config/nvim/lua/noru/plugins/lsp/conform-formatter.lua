return {
   {
      "stevearc/conform.nvim",
      opts = {},
      config = function()
         require("conform").setup({
            formatters_by_ft = {
               lua = { "stylua" },
               -- Conform will run multiple formatters sequentially
               python = { "isort", "black" },
               -- You can customize some of the format options for the filetype (:help conform.format)
               rust = { "rustfmt", lsp_format = "fallback" },
               -- Conform will run the first available formatter
               javascript = { "prettierd", "prettier", stop_after_first = true },
               c = { "astyle" },
               cpp = { "clang-format" },
               -- java = { "google-java-format" },
            },
            format_after_save = {
               lsp_format = "fallback",
            },
            formatters = {
               ["stylua"] = {
                  prepend_args = {
                     "--indent-type",
                     "Spaces",
                     "--indent-width",
                     "3",
                  },
               },
               ["clang-format"] = {
                  prepend_args = {
                     "--style={IndentWidth: 2, TabWidth: 2, UseTab: Never, ColumnLimit: 110, BinPackParameters: false, BinPackArguments: false, AllowAllParametersOfDeclarationOnNextLine: false, AlignAfterOpenBracket: AlwaysBreak, PenaltyBreakBeforeFirstCallParameter: 1, IndentAccessModifiers: false, AccessModifierOffset: -1, SpacesBeforeTrailingComments: 2, SeparateDefinitionBlocks: Always, }",
                  },
               },
            },
         })
         -- Format on save
         -- vim.api.nvim_create_autocmd("BufWritePre", {
         -- 	pattern = "*",
         -- 	callbac = function(args)
         -- 		require("conform").format({ bufnr = args.buf, async = true })
         -- 	end,
         -- })
      end,
   },
}
