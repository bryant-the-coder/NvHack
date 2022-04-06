vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup({
    -- log_level = "trace",
    -- log_to_file = true,
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    async_directory_scan = false,
    enable_diagnostics = true,
    default_component_configs = {
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            default = "*",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
        },
        git_status = {
            symbols = {
                -- Change type
                added = "✚",
                deleted = "✖",
                modified = "",
                renamed = "",
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
    },
    window = {
        position = "right",
        width = 30,
        mappings = {
            ["<space>"] = "toggle_node",
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["C"] = "close_node",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["R"] = "refresh",
            ["/"] = "fuzzy_finder",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["a"] = "add",
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination
            ["m"] = "move", -- takes text input for destination
            ["q"] = "close_window",
        },
    },
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db",
                ".git",
                ".gitattributes",
                "node_module",
                "package-lock.json",
            },
            never_show = { -- remains hidden even if visible is toggled to true
                --".DS_Store",
                --"thumbs.db"
            },
        },
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
    },
    buffers = {
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
            },
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
    event_handlers = {
        {
            {
                event = "file_renamed",
                handler = function(args)
                    -- fix references to file
                    print(args.source, " was renamed to ", args.destination)
                end,
            },
            {
                event = "file_moved",
                handler = function(args)
                    -- fix references to file
                    print(args.source, " was moved to ", args.destination)
                end,
            },
            filesystem = {
                commands = {
                    -- Override delete to use trash instead of rm
                    delete = function(state)
                        local path = state.tree:get_node().path
                        vim.fn.system({ "trash", vim.fn.fnameescape(path) })
                        require("neo-tree.sources.manager").refresh(state.name)
                    end,
                },
            },
            -- Custom Window Chooser for File Open commands
            event = "file_open_requested",
            handler = function(args)
                local state = args.state
                local path = args.path
                local open_cmd = args.open_cmd or "edit"

                -- use last window if possible
                local suitable_window_found = false
                local nt = require("neo-tree")
                if nt.config.open_files_in_last_window then
                    local prior_window = nt.get_prior_window()
                    if prior_window > 0 then
                        local success = pcall(vim.api.nvim_set_current_win, prior_window)
                        if success then
                            suitable_window_found = true
                        end
                    end
                end

                -- find a suitable window to open the file in
                if not suitable_window_found then
                    if state.window.position == "right" then
                        vim.cmd("wincmd t")
                    else
                        vim.cmd("wincmd w")
                    end
                end
                local attempts = 0
                while attempts < 4 and vim.bo.filetype == "neo-tree" do
                    attempts = attempts + 1
                    vim.cmd("wincmd w")
                end
                if vim.bo.filetype == "neo-tree" then
                    -- Neo-tree must be the only window, restore it's status as a sidebar
                    local winid = vim.api.nvim_get_current_win()
                    local width = require("neo-tree.utils").get_value(state, "window.width", 40)
                    vim.cmd("vsplit " .. path)
                    vim.api.nvim_win_set_width(winid, width)
                else
                    vim.cmd(open_cmd .. " " .. path)
                end

                -- If you don't return this, it will proceed to open the file using built-in logic.
                return { handled = true }
            end,
        },
    },
})
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
