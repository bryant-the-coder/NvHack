function func2hex(func)
	return (string.dump(func):gsub(".", function(c)
		return ("%02X"):format(c:byte())
	end))
end

function hex2func(hex)
	return loadstring(hex:gsub("..", function(x)
		return string.char(tonumber(x, 16))
	end))
end

-- Convert a lua table into a lua syntactically correct string
function table_to_string(tbl)
	local result = "{"
	for k, v in pairs(tbl) do
		-- Check the key type (ignore any numerical keys - assume its an array)
		if type(k) == "string" then
			result = result .. '["' .. k .. '"]' .. "="
		end

		-- Check the value type
		if type(v) == "table" then
			result = result .. table_to_string(v)
		elseif type(v) == "function" then
			result = result .. func2hex(v)
		elseif type(v) == "boolean" then
			result = result .. tostring(v)
		else
			result = result .. '"' .. v .. '"'
		end
		result = result .. ","
	end
	-- Remove leading commas from the result
	if result ~= "" then
		result = result:sub(1, result:len() - 1)
	end
	return result .. "}"
end
