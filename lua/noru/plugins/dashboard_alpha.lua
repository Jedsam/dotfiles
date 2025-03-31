return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional, but nice for icons if your theme uses them
	},
	config = function()
		local alpha = require("alpha")
		local fn = vim.fn -- Access Neovim functions if needed

		local quotes = {
			"Simplicity is the ultimate sophistication. - Leonardo da Vinci",
			"Code is like humor. When you have to explain it, it’s bad. - Cory House",
			"The best way to predict the future is to invent it. - Alan Kay",
			"Make it work, make it right, make it fast. - Kent Beck",
		}

		local header_text = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		local top_padding_value = 2 -- <<< ADJUST THIS VALUE FOR CENTERING

		local padding_element = { type = "padding", val = top_padding_value }

		alpha.setup({

			layout = {

				-- CENTERING PADDING (applied to the whole block below)

				padding_element,

				-- CUSTOM ASCII Header

				{

					type = "text",

					val = header_text,

					opts = {

						position = "center",

						hl = "Comment", -- Or your preferred highlight
					},
				},
				-- Padding below header (Custom)
				{ type = "padding", val = 2 },

				-- Random Quote (Custom)
				{
					type = "text",
					val = quotes[math.random(#quotes)], -- Select a random quote
					opts = {
						position = "center",
						hl = "Number", -- Highlight group for the quote
						wrap = "center",
					},
				},
			},

			-- opts = {

			-- General alpha options if needed

			-- }
		})
	end,
}
