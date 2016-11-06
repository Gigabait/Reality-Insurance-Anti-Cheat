-- TODO: Change this

net.Receive("ri.alert", function ()
	local tblPayload = net.ReadTable ()
	surface.PlaySound("buttons/blip1.wav")
end)
