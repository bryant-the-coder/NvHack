local module = [[
local M = {}

${1:code}

return M
]]

local mappings = [[
map("$1", "$2", "<cmd>$0<CR>")
]]

return {
	parse({ trig = "M" }, module),
	parse({ trig = "map" }, mappings),

	s({ trig = "Ses" }, {
		t({ "-- TODO: " }),
		i(1, "By who?"),
		f(function()
			local input = vim.fn.input(" Enter time in HH:MM or MM format: ")
			local plus_hour, plus_min
			if input:find(":") == nil then
				plus_hour = 00
				plus_min = input
			else
				plus_hour, plus_min = input:match("(%d+):(%d+)")
			end

			local t = os.date("%H:%M")
			local h = tonumber(string.sub(t, 1, 2))
			local m = tonumber(string.sub(t, 4, 5))
			-- add plus_hour and plus_min to current time
			h = h + tonumber(plus_hour)
			m = m + tonumber(plus_min)
			-- if minutes are more than 60, add 1 hour and subtract 60 minutes
			if m > 60 then
				h = h + 1
				m = m - 60
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
}

-- TODO: aloof [2:00 H](2:37 PM -> 4:37 PM){topic}
