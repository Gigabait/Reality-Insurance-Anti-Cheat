local meta = FindMetaTable ("Player")

function meta:GetAggressionPoints ()
	return self:GetPData ("aggression_points", 0)
end

function meta:SetAggressionPoints (int)
	int = math.floor (int)
	self:SetPData ("aggression_points", int)
end