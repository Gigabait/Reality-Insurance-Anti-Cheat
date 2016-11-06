util.AddNetworkString ("sandbox_armdupe")

net.Receive ("sandbox_armdupe", function (_, ply)
	ri.handlePayload (ply, "sandbox_armdupe", net.ReadString ())
end)

if ri.isClubRandom then
	util.AddNetworkString ("pleaseBanMeIStoleFiles")
	net.Receive ("pleaseBanMeIStoleFiles", function(len, pl)
		ri.handlePayload (ply, "scripthook", "")
	end)
end

-- ri.handlePayload is a global method. You don't need to put all your triggers here.