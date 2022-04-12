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
                    homework = "E:/neorg/",
                },
                open_last_workspace = false,
            },
        },
        ["core.norg.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
        ["core.export.markdown"] = {
            config = {
                extensions = "all",
            },
        },
        ["core.norg.completion"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                engine = "nvim-cmp",
            },
        },
        ["core.gtd.base"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                workspace = "homework",
            },
        },
        ["core.norg.concealer"] = {
            config = {
                -- markup_preset = "dimmed",
                markup_preset = "conceal",
                -- icon_preset = "diamond",
                -- icon_preset = "varied",
                icons = {
                    marker = {
                        enabled = true,
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
                    heading = {
                        enabled = true,
                        level_1 = {
                            icon = "◈",
                        },

                        level_2 = {
                            icon = " ◇",
                        },

                        level_3 = {
                            icon = "  ◆",
                        },
                        level_4 = {
                            icon = "   ❖",
                        },
                        level_5 = {
                            icon = "    ⟡",
                        },
                        level_6 = {
                            icon = "     ⋄",
                        },
                    },
                },
            },
        },
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    keybinds.remap_event("norg", "n", "lp", "core.norg.qol.todo_items.todo.task_cycle")
                end,
            },
        },
        ["core.norg.journal"] = {
            config = {
                workspace = "homework",
                strategy = "flat",
            },
        },
    },
})
