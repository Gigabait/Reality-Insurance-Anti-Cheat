aggression = {}

anticheat = {}
anticheat.__index = anticheat
anticheat.struct = {}

include "anticheat/config/sv_anticheat_phrases.lua"
include "anticheat/config/sv_anticheat_hmethods.lua"

anticheat.SetActions = function (self, tblActions)
	self.Actions = tblActions
end

anticheat.ProcessActions = function (self)
	if not self.Actions then
		error ("attempting to anticheat/ProcessActions before using anticheat/SetActions!")
		return
	end
	for _, funcMethod in pairs (self.Actions) do
		funcMethod (self)
	end
end

anticheat.Create = function (ply, strPayloadName, strPayloadValue)
	local struct = {
		["Player"] = ply,
		["Method"] = strPayloadName,
		["Payload"] = strPayloadValue,
		["Propeties"] = {
			["BanTime"] = (ply:GetAggressionPoints () + 1) * 60 * 24
		}
	}

	return setmetatable(struct, anticheat)
end