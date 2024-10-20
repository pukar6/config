return {
	{
		"neovim/nvim-lspconfig",
		event = {

			"BufReadPost", "BufNewFile",

		},

		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},


		setup = function()
			local config = {
				virtual_text = false, -- disable virtual text

				signs = {
					active = signs, -- show signs
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}

			vim.diagnostic.config(config)
		end,

		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "clangd" } })
			require 'lspconfig'.clangd.setup {
				capabilities = capabilities,
				cmd = { "/usr/bin/clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
				root_dir = require'lspconfig'.util.root_pattern(
					'.clangd'
					, '.clang-tidy'
					, '.clang-format'
					, 'compile_commands.json'
					, 'compile_flags.txt'
					, 'configure.ac'
					, '.git'
				),
				single_file_support = true,
			}
			require 'lspconfig'.lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}

			}
		end,

		keys = { { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" } }
	}
}
