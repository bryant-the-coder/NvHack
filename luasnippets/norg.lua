---@diagnostic disable: undefined-global
return {
    s("h1", {
        t({ "* " }),
        i(1),
    }),
    s("h2", {
        t({ "** " }),
        i(1),
    }),
    s("h3", {
        t({ "*** " }),
        i(1),
    }),
    s("h4", {
        t({ "**** " }),
        i(1),
    }),
    s("h5", {
        t({ "***** " }),
        i(1),
    }),
    s({ trig = "ses" }, {
        t({ "Session " }),
        i(1),
        f(function()
            local input = vim.fn.input(" Enter time in HH:MM or MM format: ")
            local plus_hour, plus_min
            if input:find(":") == nil then
                plus_hour = 00
                plus_min = input
            else
                plus_hour, plus_min = input:match("(%d+):(%d+)")
            end

            -- Getting system time
            local t = os.date("%H:%M")
            local h = tonumber(string.sub(t, 1, 2))
            local m = tonumber(string.sub(t, 4, 5))

            -- Add plus_hour & plus_min to current time
            h = h + tonumber(plus_hour)
            m = m + tonumber(plus_min)
            -- If minutes > 60, add 1 hour and minus 60min
            if m > 60 then
                h = h + 1
                m = n - 60
            end
            if h > 24 then
                h = h - 24
            end
            if m < 10 then
                m = "0" .. m
            end

            local added_time
            if plus_hour ~= 00 then
                added_time = plus_hour .. ":" .. plus_min .. " H"
            else
                added_time = plus_min .. "M"
            end

            local session_time = h .. ":" .. m

            local twentry_four_to_twelve_hour = function(t)
                local hour, min = t:match("(%d+):(%d+)")
                if tonumber(hour) > 12 then
                    hour = tonumber(hour) - 12
                    return hour .. ":" .. min .. " PM"
                else
                    return hour .. ":" .. min .. " AM"
                end
            end

            local current_12_hour = twentry_four_to_twelve_hour(t)
            local session_12_hour = twentry_four_to_twelve_hour(session_time)

            return " [" .. added_time .. "]" .. "(" .. current_12_hour .. " -> " .. session_12_hour .. ")"
        end, {}),
        t({ "{" }),
        i(2, "topic"),
        t({ "}" }),
    }),
    s({ trig = "sF", docstring = "sF" }, {
        t("** Session "),
        i(1, "1 "),
        f(function()
            result = {}
            result.start_hour = os.date("%I") -- defining start hour
            result.start_min = os.date("%M") -- defining start min
            result.status = function()
                return os.date("%p") -- finding wheter pm or am
            end
            result.format = function(ses)
                local hour = tonumber(result.end_hour)
                local min = tonumber(result.end_min)

                if hour < 10 then
                    -- result.end_hour = string.sub(tostring(result.end_hour),2,2)
                    result.start_hour = string.sub(tostring(result.start_hour), 2, 2)
                end
                if min >= 60 then
                    result.end_min = min - 60
                    result.end_hour = 1 + hour
                end
                if tonumber(result.end_min) < 10 then
                    print("hello")
                    result.end_min = "0" .. result.end_min
                end
                print(result.end_min)
                return "{" .. ses .. " H}" .. " [ " .. result.start_time() .. " -> " .. result.end_time() .. " ]"
            end
            result.adder = function()
                local time = vim.fn.input("Enter session time (H:M) = ")
                local hour = string.sub(time, 1, 1)
                local min = string.sub(time, 3, 4)
                result.end_hour = tonumber(result.start_hour) + tonumber(hour)
                result.end_min = tonumber(result.start_min) + tonumber(min)
                return result.format(time)
                -- result.format(result.end_hour,result.end_min)
            end
            result.end_time = function()
                return result.end_hour .. ":" .. result.end_min .. result.status()
            end
            result.start_time = function()
                return result.start_hour .. ":" .. result.start_min .. result.status()
            end
            return " " .. result.adder()
        end),
        t({ "", "  > " }),
        i(0),
    }),
}
