return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,

	config = function()

   dim_inactive_windows = false
   extend_background_behind_borders = true

		enable = {
			terminal = true
		}

		vim.cmd [[colorscheme rose-pine-moon]]
	end
}

}
