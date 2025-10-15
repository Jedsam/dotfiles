return {
   "3rd/diagram.nvim",
   dependencies = {
      { "3rd/image.nvim", opts = {} },
   },
   config = function()
      require("diagram").setup({
         events = {
            -- render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
            clear_buffer = { "BufLeave" },
         },
         renderer_options = {
            mermaid = {
               background = nil,
               theme = nil,
               scale = nil,
               cli_args = {
                  "--backgroundColor transparent",
                  "--theme dark",
                  "--scale 4",
                  "--width 1600",
                  "--height 1200",
               },
            },
         },
      })
   end,
   keys = {
      {
         "<leader>md",
         function()
            require("diagram").show_diagram_hover()
         end,
         mode = "n",
         ft = { "markdown", "norg" },
         desc = "Show diagram in new tab",
      },
   },
}
