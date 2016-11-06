aggression.coolAnnounce = 0

aggression.Announce = function (self)
	local msg = anticheat.PhraseManager["ActAnnounce"].msg:format (self.Player:Nick ())
	if aggression.coolAnnounce < CurTime () then
		aggression.coolAnnounce = CurTime () + anticheat.PhraseManager["ActAnnounce"].time + 1
		ChatAddText2   ({"<texture=icon16/bell.png> " .. msg}, {msg})
		HUDPrint.Timed (msg, anticheat.PhraseManager["ActAnnounce"].time)
		return
	end
end
aggression.KickPlayer = function (self)
	ulx.kick (game.GetWorld (), self.Player, anticheat.PhraseManager["ActKickPlayer"])
end
aggression.PBanPlayer = function (self)
	ulx.ban (game.GetWorld (), self.Player, 0, string.format (anticheat.PhraseManager["ActBanPlayer"], self.Method))
end
aggression.BanPlayer = function (self)
	ulx.ban (game.GetWorld (), self.Player, self.Propeties['BanTime'], string.format (anticheat.PhraseManager["ActBanPlayer"], self.Method))
end
aggression.SendToHell = function (self)
	self.Player:SetHealth (1e9)
	self.Player:Ignite (1e9)
end