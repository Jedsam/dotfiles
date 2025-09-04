return {
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         require("telescope").setup({
            defaults = {
               sorting_strategy = "ascending",
               layout_strategy = "horizontal",
               line_width = "full",
               wrap_results = true,
               wrap_line = true,
               layout_config = {
                  horizontal = {
                     preview_width = 0.65,
                  },
                  width = 0.99,
                  height = 0.99,
                  prompt_position = "bottom",
                  preview_cutoff = 20,
               },
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
         -- Wrap lines in previewer
         vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePreviewerLoaded",
            callback = function()
               vim.wo.wrap = true
               vim.wo.linebreak = true
            end,
         })
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<leader>pf", function()
            builtin.find_files({
               hidden = false,
               find_command = { "rg", "--files", "-g", "!.git" },
            })
         end, { noremap = true, silent = true })
         -- No preview project finder
         vim.keymap.set("n", "<leader>pF", function()
            builtin.find_files({
               hidden = false,
               find_command = { "rg", "--files", "-g", "!.git" },
               previewer = false,
               layout_config = {
                  preview_width = 0.70,
                  width = 0.8,
                  height = 0.7,
               },
            })
         end, { noremap = true, silent = true })
         vim.keymap.set("n", "<leader>phf", function()
            builtin.find_files({
               hidden = true,
               no_ignore = true,
            })
         end, { noremap = true, silent = true })
         vim.keymap.set("n", "<leader>phF", function()
            builtin.find_files({
               hidden = true,
               no_ignore = true,
               previewer = false,
               layout_config = {
                  preview_width = 0.60,
                  width = 0.7,
                  height = 0.8,
               },
            })
         end, { noremap = true, silent = true })
         vim.keymap.set("n", "<C-g>", builtin.git_files, {})
         vim.keymap.set("n", "<leader>lgs", function()
            builtin.live_grep()
         end)
         vim.keymap.set("n", "<leader>lgS", function()
            builtin.live_grep({
               previewer = false,
               layout_config = {
                  preview_width = 0.60,
                  width = 0.8,
                  height = 0.9,
               },
            })
         end)
         vim.keymap.set("n", "<leader>gs", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
         end)
         vim.keymap.set("n", "<leader>gS", function()
            builtin.grep_string({
               search = vim.fn.input("Grep > "),
               previewer = false,
               wrap_line = true,
               layout_config = {
                  preview_width = 0.60,
                  width = 0.8,
                  height = 0.9,
               },
            })
         end)
         -- Use yanky with telescope
         require("telescope").load_extension("yank_history")
      end,
   },
   {
      -- Plugin for code actions
      "aznhe21/actions-preview.nvim",
      config = function()
         require("actions-preview").setup({
            telescope = {
               sorting_strategy = "ascending",
               layout_strategy = "vertical",
               layout_config = {
                  preview_width = 0.60,
                  width = 0.99,
                  height = 0.99,
                  prompt_position = "top",
                  preview_cutoff = 20,
               },
            },
         })
         vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
      end,
   },
}
