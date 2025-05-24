return {
	{
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
		enabled = false,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
