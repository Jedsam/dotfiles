return {
   "gbprod/yanky.nvim",
   config = function()
      require("yanky").setup({
         ring = {
            system_clipboard = { sync_with_ring = false },
            history_length = 100,
            storage = "shada",
            storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
            sync_with_numbered_registers = true,
            cancel_event = "update",
            ignore_registers = { "_", "+", "*" },
            update_register_on_cycle = false,
            permanent_wrapper = nil,
         },
         picker = {
            select = {
               action = nil, -- nil to use default put action
            },
            telescope = {
               use_default_mappings = true, -- if default mappings should be used
               mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
            },
         },
         system_clipboard = {
            sync_with_ring = true,
            clipboard_register = nil,
         },
         highlight = {
            on_put = true,
            on_yank = true,
            timer = 500,
         },
         preserve_cursor_position = {
            enabled = true,
         },
         textobj = {
            enabled = false,
         },
      })
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
      vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

      -- Add yanky history powered by telescope
      require("telescope").load_extension("yank_history")
      vim.keymap.set({ "n", "x" }, "<leader>y", function()
         require("telescope").extensions.yank_history.yank_history({
            previewer = false, -- disable preview
         })
      end)
   end,
}
