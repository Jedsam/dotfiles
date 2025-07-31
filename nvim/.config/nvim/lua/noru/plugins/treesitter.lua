return {
	-- The treesitter, the guy behind all the parser stuff, I think?
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"vimdoc",
					"javascript",
					"typescript",
					"c",
					"lua",
					"rust",
					"jsdoc",
					"bash",
					"java",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
				auto_install = true,

				indent = {
					enable = true,
				},

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					disable = function(lang, buf)
						if lang == "html" then
							print("disabled")
							return true
						end

						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							vim.notify(
								"File larger than 100KB treesitter disabled for performance",
								vim.log.levels.WARN,
								{ title = "Treesitter" }
							)
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end,
	},

	-- Adds a window at the top of the screen showing the current context
	{
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
	-- Adds useful keybinds and highlighting which relate to treesitter
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		after = "nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				refactor = {
					smart_rename = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
						keymaps = {
							smart_rename = "false",
						},
					},
					navigation = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
						keymaps = {
							goto_definition = "false",
							list_definitions = "false",
							list_definitions_toc = "false",
							goto_next_usage = "false",
							goto_previous_usage = "false",
						},
					},

					enable = true,
					-- Set to false if you have an `updatetime` of ~100.
					clear_on_cursor_move = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- Textobject selections (inner/outer)
							["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
							["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
							["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
							["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
							["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
							["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
							["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
							["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
							["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
							["at"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
							["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
							["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },
							["as"] = { query = "@statement.outer", desc = "Select outer part of a statement" },
							["ap"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["ip"] = { query = "@call.inner", desc = "Select inner part of a function call" },
							["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
							["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
							["l="] = { query = "@assignment.lhs", desc = "Select left part of an assignment" },
							["r="] = { query = "@assignment.rhs", desc = "Select right part of an assignment" },
						},

						include_surrounding_whitespace = true, -- Extends selections to include whitespace
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>sa"] = "@parameter.inner",
							["<leader>sf"] = "@function.inner",
							["<leader>sc"] = "@class.inner",
							["<leader>si"] = "@conditional.inner",
							["<leader>sl"] = "@loop.inner",
							["<leader>sb"] = "@block.inner",
							["<leader>sp"] = "@call.inner",
							["<leader>st"] = "@comment.outer", -- Comments typically only have "outer"
						},
						swap_previous = {
							["<leader>Sa"] = "@parameter.inner",
							["<leader>Sf"] = "@function.inner",
							["<leader>Sc"] = "@class.inner",
							["<leader>Si"] = "@conditional.inner",
							["<leader>Sl"] = "@loop.inner",
							["<leader>Sb"] = "@block.inner",
							["<leader>Sp"] = "@call.inner",
							["<leader>St"] = "@comment.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- Records jumps in the jumplist
						goto_next_start = {
							["]f"] = { query = "@function.outer", desc = "Next function start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },
							["]a"] = { query = "@parameter.inner", desc = "Next parameter start" },
							["]t"] = { query = "@comment.outer", desc = "Next comment start" },
							["]s"] = { query = "@statement.outer", desc = "Next statement start" },
							["]b"] = { query = "@block.outer", desc = "Next block start" },
							["]p"] = { query = "@call.outer", desc = "Next call start" },
						},
						goto_next_end = {
							["]F"] = { query = "@function.outer", desc = "Next function end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
							["]A"] = { query = "@parameter.inner", desc = "Next parameter end" },
							["]T"] = { query = "@comment.outer", desc = "Next comment end" },
							["]S"] = { query = "@statement.outer", desc = "Next statement end" },
							["]B"] = { query = "@block.outer", desc = "Next block end" },
							["]P"] = { query = "@call.outer", desc = "Next call end" },
						},
						goto_previous_start = {
							["[f"] = { query = "@function.outer", desc = "Previous function start" },
							["[c"] = { query = "@class.outer", desc = "Previous class start" },
							["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
							["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
							["[a"] = { query = "@parameter.inner", desc = "Previous parameter start" },
							["[t"] = { query = "@comment.outer", desc = "Previous comment start" },
							["[s"] = { query = "@statement.outer", desc = "Previous statement start" },
							["[b"] = { query = "@block.outer", desc = "Previous block start" },
							["[p"] = { query = "@call.outer", desc = "Previous call start" },
						},
						goto_previous_end = {
							["[F"] = { query = "@function.outer", desc = "Previous function end" },
							["[C"] = { query = "@class.outer", desc = "Previous class end" },
							["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
							["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
							["[A"] = { query = "@parameter.inner", desc = "Previous parameter end" },
							["[T"] = { query = "@comment.outer", desc = "Previous comment end" },
							["[S"] = { query = "@statement.outer", desc = "Previous statement end" },
							["[B"] = { query = "@block.outer", desc = "Previous block end" },
							["[P"] = { query = "@call.outer", desc = "Previous call end" },
						},
					},
				},
			})
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			-- Repeat movement with ; and ,
			-- ensure ; goes forward and , goes backward regardless of the last direction
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

			-- vim way: ; goes to the direction you were moving.
			-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		after = "nvim-treesitter",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
	},
}
