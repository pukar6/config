return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{"<leader>fc", function() require("telescope.builtin").find_files({cwd = "~/.config"}) end, desc = "Find configs"},
		{"<leader>ls", function() require("telescope.builtin").lsp_document_symbols() end, desc = "List buffer symbols"},
		{"<leader>lS", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "List workspace symbols"},
		{"<leader>gI", function() require("telescope.builtin").lsp_implementations() end, desc = "Go to implementation"},
	}

}
