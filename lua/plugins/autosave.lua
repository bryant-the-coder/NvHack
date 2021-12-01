-- auto-save
local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = true,
        on_off_commands = true,
        clean_command_line_interval = 1,
        debounce_delay = 135
    }
)
