local present, neorg = pcall(require, "neorg")
if not present then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					gtd = "C:/Users/User/AppData/Local/nvim/todos/",
				},
			},
		},
		["core.norg.completion"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				engine = "nvim-cmp",
			},
		},
		["core.gtd.base"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				workspace = "gtd",
			},
		},
		["core.norg.concealer"] = {
			config = {
				markup_preset = "dimmed",
				icon_preset = "diamond",
				icons = {
					marker = {
						icon = " ",
					},
					todo = {
						enable = true,
						pending = {
							-- icon = ""
							icon = "",
						},
						uncertain = {
							icon = "?",
						},
						urgent = {
							icon = "",
						},
						on_hold = {
							icon = "",
						},
						cancelled = {
							icon = "",
						},
					},
				},
			},
		},
	},
})
