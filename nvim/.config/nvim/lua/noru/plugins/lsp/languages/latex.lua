return {
   "lervag/vimtex",
   lazy = false,
   disabled = true,
   tag = "v2.15",
   init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk_engines = {
         _ = "-lualatex",
      }

      vim.g.vimtex_compiler_latexmk = {
         backend = "nvim",
         build_dir = "",
         callback = 1,
         continuous = 1,
         executable = "latexmk",
         options = {
            "-pdf",
            "-interaction=nonstopmode",
            "-synctex=1",
         },
      }
   end,
}
