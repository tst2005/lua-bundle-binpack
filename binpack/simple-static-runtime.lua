
local special = "A"
local function pack(data)
	return data:gsub(special, special.."0"):gsub("\r", special.."r"):gsub("\n", special.."n")
end

local function unpack(data)
	return data:gsub(special.."n", "\n"):gsub(special.."r", "\r"):gsub(special.."0", special)
end

return {
	pack = pack,
	unpack = unpack,
}
