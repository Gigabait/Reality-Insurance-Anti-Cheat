# Reality Insurance AC Framework
A simple, easy anti-cheat framework to deal with cheaters of all types!

Please don't sell my code without my permission.

# Configuration

## Adding payloads...

Please use this file:
*anticheat/sv_class_anticheat.lua*

_*Please Note*_: that you will require aggression callbacks (explained after this) to properly use this

### Example:

```lua
	anticheat.handleMethods = {
		["speedhacks"] = {
			aggression.NuffliyVelocity, aggression.SendToHell
		},
		["cs_luaexpoitation"] = {
			aggression.Announce, aggression.KickPlayer
		},
	}
```

## Adding aggression callbacks...

Please use this file:
*anticheat/config/sv_class_aggression.lua*

This file keeps track of the various punishments you could use againest the violators

### Example:

```lua
	aggression.NuffliyVelocity = function (self)
		self.Player:SetVelocity (-1 * self.Player:GetVelocity ())
	end
```
## Adding triggers...

Not required but recommended you plop them in this location:
*anticheat/config/sv_anticheat_triggers.lua*

### Example 1:

```lua
	net.Receive ("ac_speedhacks", function (_, ply)
		-- Creates a new payload report with the subject 'speedhacks' and a description of the player's speed

		ri.handlePayload (ply, "speedhacks", ply:GetVelocity ():Length ())
	end)
```

### Example 2:

```lua
	function ValidateConVars ()
		local tblPlayers = player.GetAll ()
		for i = 1, #tblPlayers do
			if tblPlayers[i]:GetInfoNum ("sv_allowcslua") != 0 then

				-- Creates a new payload report with the subject 'speedhacks' and a description of nothing

				ri.handlePayload (ply, "cs_luaexpoitation", "")
			end
		end
	end
```