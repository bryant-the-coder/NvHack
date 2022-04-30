local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
    return
end
local relative = "editor"
fidget.setup({
    text = {
        spinner = "moon",
        -- spinner = {
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        --     " ",
        -- },
        done = "",
        commenced = " ",
        completed = " ",
    },
    align = {
        bottom = true,
        right = true,
    },
    timer = {
        spinner_rate = 100,
        fidget_decay = 500,
        task_decay = 300,
    },
    window = {
        relative = relative,
        blend = 0,
        zindex = nil,
    },
    fmt = {
        leftpad = true,
        stack_upwards = true,
        max_width = 0,
        -- function to format fidget title
        fidget = function(fidget_name, spinner)
            return string.format("%s %s", spinner, fidget_name)
        end,
        -- function to format each task line
        task = function(task_name, message, percentage)
            return string.format(
                "%s%s [%s]",
                message,
                percentage and string.format(" (%s%%)", percentage) or "",
                task_name
            )
        end,
    },
    debug = {
        logging = false,
        strict = false,
    },
})
