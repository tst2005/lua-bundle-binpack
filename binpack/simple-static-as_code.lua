
local function pack_as_code(data)
	local o,e = "[=[","]=]"
	local special = '!'
	local unpackcode=[[:gsub("]]..special..[[o", "[=["):gsub("]]..special..[[e", "]=]"):gsub("]]..special..[[r", "\r"):gsub("]]..special..[[n", "\n"):gsub("]]..special..[[0","]]..special..[[")]]
	return "("..o.. (data:gsub(special, special.."0"):gsub("%[=%[",special.."o"):gsub("%]=%]",special.."e"):gsub("\r", special.."r"):gsub("\n", special.."n") )..e..")"..unpackcode
end

return {
	pack = pack_as_code,
}
