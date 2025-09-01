return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		lazy = false, -- neo-tree will lazily load itself
		-- ---@module 'neo-tree'
		-- ---@type neotree.Config
		opts = {
			-- options go here
		},
	},
	lazy = false,

	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Neotree toggle" })
		keymap.set("n", "<C-p>", ":Neotree buffers reveal float<CR>", { desc = "Neotree buffers reveal float" })

		vim.diagnostic.config({
			virtual_text = true,
			-- signs = {
			-- 	severity = {
			-- 		min = vim.diagnostic.severity.HINT,
			-- 	},
			-- },
			icons = {
				Error = " ",
				Warn = " ",
				Info = " ",
				Hint = "󰌵 ",
			},
			signs = {
				error = { text = " ", texthl = "DiagnosticSignError" },
				warn = { text = " ", texthl = "DiagnosticSignWarn" },
				info = { text = " ", texthl = "DiagnosticSignInfo" },
				hint = { text = "󰌵", texthl = "DiagnosticSignHint" },
			},
		})

		-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		-- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			use_popups_for_input = true,

			source_selector = {
				winbar = false,
				statusline = false,
			},

			default_component_configs = {

				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					provider = function(icon, node, _) -- default icon provider utilizes nvim-web-devicons if available
						if node.type == "file" or node.type == "terminal" then
							local success, web_devicons = pcall(require, "nvim-web-devicons")
							local name = node.type == "terminal" and "terminal" or node.name
							if success then
								local devicon, hl = web_devicons.get_icon(name)
								icon.text = devicon or icon.text
								icon.highlight = hl or icon.highlight
							end
						end
					end,
					default = "*",
					highlight = "NeoTreeFileIcon",
				},

				modified = {
					symbol = "*",
					highlight = "NeoTreeModified",
				},
				indent = {
					indent_size = 2,
					padding = 0,
				},

				-- git status
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},

			-- window settings
			window = {
				position = "left",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["t"] = { "toggle_node" },
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel",
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["c"] = "copy",
					["m"] = "move",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["q"] = "close_window",
					["R"] = "refresh",
					["i"] = "show_file_details",
					["?"] = "show_help",
				},
			},

			-- filesystem settings
			filesystem = {
				follow_current_file = {
					enabled = false,
					leave_dirs_open = false,
				},
			},

			-- buffer settings
			buffers = {
				follow_current_file = {
					enabled = false,
					leave_dirs_open = false,
				},
			},
		})
	end,
}
