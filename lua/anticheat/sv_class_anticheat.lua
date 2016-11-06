aggression = {}

anticheat = {}
anticheat.__index = anticheat
anticheat.struct = {}

include "anticheat/config/sv_anticheat_phrases.lua"
include "anticheat/config/sv_anticheat_hmethods.lua"

-- Helper Methods
anticheat.GetPlayer = function (self)
	return self.Player
end

anticheat.GetPayloadName = function (self)
	return self.Method
end

anticheat.GetMethod= anticheat.GetPayloadName 

anticheat.GetPayload = function (self)
	return self.Payload
end

/**
 * Sets the actions of the payload
 *
 * @param self
 * @param Actions (Table of aggression callbacks)
 */
anticheat.SetActions = function (self, tblActions)
	self.Actions = tblActions
end


/**
 * Process all the agression callbacks on the payload
 *
 * @param self
 */

anticheat.ProcessActions = function (self)
	if not self.Actions then
		error ("attempting to anticheat/ProcessActions before using anticheat/SetActions!")
		return
	end
	for _, funcMethod in pairs (self.Actions) do
		funcMethod (self)
	end
end

/**
 * Creates a new payload report
 *
 * @param Player        (The Violator)
 * @param Payload Name  (Which payload should we use)
 * @param Payload Info  (What's in the payload)
 */

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