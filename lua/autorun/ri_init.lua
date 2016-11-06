if ModInfo then
	ModInfo.Name   = "Reality Insurance"
	ModInfo.Author = "Potatofactory"
	ModInfo.Type   = "Addon"

	function TestSuccess ()
		return true
	end
end

if ModuleLoad then
	ModuleLoad.Dir ("client/hud/*")
else
	AddCSLuaFile    "autorun/modules/client/hudprint.lua"
end

include 	 "anticheat/sv_player_meta.lua"
include 	 "anticheat/sv_class_anticheat.lua"
AddCSLuaFile "anticheat/cl_listeners.lua"

util.AddNetworkString ("ri.alert")

ri = {}
_G.ri = ri

ri.isClubRandom = game.GetIPAddress () == "72.14.181.134:27015"

/**
 * Alerts all the admins of the gameserver
 *
 */

function ri.alert ()
	for _, ply in pairs (player.GetAll ()) do
		if ply:IsAdmin () then
			net.Start ("ri.alert")
			net.WriteTable ({})
			net.Send (ply)
		end
	end
end

/**
 * Creates a new payload report (pre)
 *
 * @param Player        (The Violator)
 * @param Payload Name  (Which payload should we use)
 * @param Payload Info  (What's in the payload)
 */
function ri.handlePayload (ply, strPayloadName, strPayloadValue)

	local payload = anticheat.Create (ply, strPayloadName, strPayloadValue)

	local tblActions = {}

	if anticheat.handleMethods[strPayloadName:lower ()] then
		tblActions = anticheat.handleMethods[strPayloadName:lower ()]
	else
		tblActions = anticheat.handleMethods["~default"]
	end

	payload.Actions      = tblActions
	payload:ProcessActions ()

	local strLog = string.format (anticheat.PhraseManager["LoggingFormat"], ply:Nick (), ply:SteamID (), strPayloadName, strPayloadValue)

	print (strLog)
	ServerLog (strLog)
end

include "anticheat/config/sv_anticheat_triggers.lua"