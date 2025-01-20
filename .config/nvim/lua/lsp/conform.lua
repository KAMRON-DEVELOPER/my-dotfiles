return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black", lsp_format = "fallback" }, -- Conform will run multiple formatters sequentially
				zig = { "zigfmt", lsp_format = "fallback" },
				rust = { "rustfmt", lsp_format = "fallback", stop_after_first = true },
				go = { "goimports", "gofmt", "gofumpt", stop_after_first = true, lsp_format = "fallback" }, -- gofmt, gofumpt, goimports
				dart = { "dart_format" },
				c = { "clangformat" },
				cpp = { "clangformat" },
				cmake = { "gersemi" },
				javascript = { "prettier", "prettierd", stop_after_first = true }, -- Conform will run the first available formatter
				typescript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				yaml = { "prettier", "prettierd", stop_after_first = true },
				toml = { "taplo" },
				json = { "prettier", "prettierd", stop_after_first = true },
				html = { "prettier", "prettierd", stop_after_first = true },
				css = { "prettier", "prettierd", stop_after_first = true },
				markdown = { "prettier", "prettierd", stop_after_first = true },
			},

			formatters = {
				dart_format = {
					prepend_args = { "--line-length", "220" }, -- Customize line length here
				},
			},

			format_on_save = {
				timeout_ms = 3000, -- Increase the timeout to 2000 ms (or more if needed)
			},

			notify_on_error = true, -- Conform will notify you when a formatter errors
			notify_no_formatters = true, -- Conform will notify you when no formatters are available for the buffer

			-- format_on_save = {
			-- lsp_fallback = true,
			-- async = false,
			-- timeout_ms = 500,
			-- },
		})
	end,
}
