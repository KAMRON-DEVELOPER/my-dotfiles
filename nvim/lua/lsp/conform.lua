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
