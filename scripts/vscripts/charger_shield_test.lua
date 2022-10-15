function Activate()
	thisEntity:SetThink(thinkDeleteShield,"Delete", 0)
end

function thinkDeleteShield()
	if Entities:FindByClassname(nil, "combine_attached_armor_prop") ~=nil
		then 
		Entities:FindByClassname(nil, "combine_attached_armor_prop"):Kill()
	end
	return 1
end