return {
   {
      "stevearc/oil.nvim",
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "nvim-mini/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
      config = function()
         require("oil").setup({
            win_options = {
               signcolumn = "yes:2",
            },
            keymaps = {
               ["<CR>"] = "actions.select",
               ["<C-s>"] = false,
               ["g?"] = { "actions.show_help", mode = "n" },
               ["<C-p>"] = "actions.preview",
               ["<C-c>"] = { "actions.close", mode = "n" },
               ["<C-l>"] = "actions.refresh",
               ["<Tab>"] = { "actions.parent", mode = "n" },
               ["_"] = { "actions.open_cwd", mode = "n" },
               ["`"] = { "actions.cd", mode = "n" },
               ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
               ["gs"] = { "actions.change_sort", mode = "n" },
               ["gx"] = "actions.open_external",
               ["g."] = { "actions.toggle_hidden", mode = "n" },
               ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            use_default_keymaps = false,
            preview_split = "left",
         })
         vim.keymap.set("n", "<leader>w", "<CMD>Oil<CR>", { desc = "Open parent directory" })
         vim.api.nvim_create_autocmd("User", {
            pattern = "OilEnter",
            group = augroup,
            callback = function()
               if is_previewing then
                  return
               end
               is_previewing = true
               require("oil").open_preview()
            end,
         })
      end,
   },
   {
      "benomahony/oil-git.nvim",
      dependencies = { "stevearc/oil.nvim" },
      -- opts = {
      --    highlights = {
      --          OilGitModified = { fg = "#ff0000" }, -- Custom colors
      --    },
      -- },
      -- No opts or config needed! Works automatically
   },
   {
      "JezerM/oil-lsp-diagnostics.nvim",
      dependencies = { "stevearc/oil.nvim" },
      opts = {},
   },
}
