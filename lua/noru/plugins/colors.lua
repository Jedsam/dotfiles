

function ColorMyPencils(color)
    
    color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)
    
    -- Set the windows you want the background to be applied to
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
	
end


-- lua/plugins/rose-pine.lua
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
}
