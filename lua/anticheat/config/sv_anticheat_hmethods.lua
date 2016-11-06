include "anticheat/config/sv_class_aggression.lua"

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