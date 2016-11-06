include "anticheat/config/sv_class_aggression.lua"

-- Please put all your payloads here

anticheat.handleMethods = {
	["sandbox_armdupe"] = {
		aggression.Announce, aggression.KickPlayer
	},
	["scripthook"] = {
		aggression.Announce, aggression.PBanPlayer
	},
	["~default"] = {
		aggression.Announce
	}
}