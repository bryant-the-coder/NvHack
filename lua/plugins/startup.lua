local present, welcome = pcall(require, "welcome")
if not present then
	return
end

local fn = vim.fn

local plugins_count = fn.len(fn.globpath("$HOME/AppData/Local/nvim-data/site/pack/packer/start/", "*", 0, 1))
local datetime = os.date("%d-%m-%Y")
local ascii = {
	"                                                       ",
	"███    ██ ██    ██ ██   ██  █████   ██████ ██   ██     ",
	"████   ██ ██    ██ ██   ██ ██   ██ ██      ██  ██      ",
	"██ ██  ██ ██    ██ ███████ ███████ ██      █████       ",
	"██  ██ ██  ██  ██  ██   ██ ██   ██ ██      ██  ██      ",
	"██   ████   ████   ██   ██ ██   ██  ██████ ██   ██     ",
	"                                                       ",
}

welcome.setup({
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = ascii,
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Find File", "Telescope find_files", "<leader>ff" },
			{ " Find Word", "Telescope live_grep", "<leader>fw" },
			{ " Recent Files", "Telescope oldfiles", "<leader>fo" },
			{ " File Browser", "Telescope buffers", "<leader>fb" },
			{ " Colorschemes", "Telescope colorscheme", "<leader>fk" },
			{ " New File", "lua require'startup'.new_file()", "<leader>nf" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	footer = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Footer",
		margin = 5,
		content = {
			"┌─ Today is " .. datetime .. " ─┐",
			"└─ " .. plugins_count .. " plugins in total ─┘",
		},
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 0,
	},
})
