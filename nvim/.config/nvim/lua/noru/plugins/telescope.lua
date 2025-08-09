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
					layout_config = {
						preview_width = 0.7,
						width = 0.95,
						height = 0.9,
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
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", function()
				require("telescope.builtin").find_files({
					hidden = false,
					find_command = { "rg", "--files", "-g", "!.git" },
				})
			end, { noremap = true, silent = true })
			-- No preview project finder
			vim.keymap.set("n", "<leader>pF", function()
				require("telescope.builtin").find_files({
					hidden = false,
					find_command = { "rg", "--files", "-g", "!.git" },
					previewer = false,
					layout_config = {
						width = 0.8,
						height = 0.7,
					},
				})
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>phf", function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = true,
				})
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>phF", function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = true,
					previewer = false,
					layout_config = {
						width = 0.7,
						height = 0.8,
					},
				})
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<C-g>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>gs", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>gS", function()
				builtin.grep_string({
					search = vim.fn.input("Grep > "),
					previewer = false,
					layout_config = {
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
					layout_strategy = "horizontal",
					layout_config = {
						width = 0.8,
						preview_width = 0.4,
						height = 0.9,
						prompt_position = "top",
						preview_cutoff = 20,
						preview_height = function(_, _, max_lines)
							return max_lines - 15
						end,
					},
				},
			})
			vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
		end,
	},
}
