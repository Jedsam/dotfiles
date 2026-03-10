return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
   },
   {
      "3rd/image.nvim",
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
   },
   {
      "kawre/leetcode.nvim",
      cmd = { "Leet" }, -- load plugin when these commands are called
      keys = {
         { "<leader>ls", "<cmd>Leet desc<cr>", mode = "n", desc = "Open LeetCode description" },
      },
      build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
      dependencies = {
         -- include a picker of your choice, see picker section for more details
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
      },
      opts = {
         arg = "leetcode.nvim",
         lang = "cpp",
         cn = { -- leetcode.cn
            enabled = false,
            translator = true,
            translate_problems = true,
         },
         storage = {
            home = vim.fn.stdpath("data") .. "/leetcode",
            cache = vim.fn.stdpath("cache") .. "/leetcode",
         },
         plugins = {
            non_standalone = false,
         },
         logging = true,
         injector = {},
         cache = {
            update_interval = 60 * 60 * 24 * 7,
         },
         editor = {
            reset_previous_code = true,
            fold_imports = true,
         },
         console = {
            open_on_runcode = true,
            dir = "row",
            size = {
               width = "90%",
               height = "75%",
            },
            result = {
               size = "60%",
            },
            testcase = {
               virt_text = true,
               size = "40%",
            },
         },
         description = {
            position = "bottom",
            width = "100%",
            show_stats = true,
         },
         picker = { provider = nil },
         hooks = {
            ["enter"] = {},
            ["question_enter"] = {},
            ["leave"] = {},
         },
         keys = {
            toggle = { "q" },
            confirm = { "<CR>" },
            reset_testcases = "r",
            use_testcase = "U",
            focus_testcases = "H",
            focus_result = "L",
         },
         theme = {},
         image_support = false,
      },
   },
}
