switch = {
	["models/characters/combine_grunt/combine_grunt.vmdl"] = function()
	EmitSound("vo.combine.grunt.die_0")
	end,

	["models/characters/combine_soldier_captain/combine_captain.vmdl"] = function()
	EmitSound("vo.combine.officer.die_0")
	end,

	["models/characters/combine_soldier_heavy/combine_soldier_heavy.vmdl"] = function()
	EmitSound("vo.combine.charger.die_0")
	--Deletes the shield if opened
	local shield = Entities:FindByClassname(nil, "combine_attached_armor_prop")
	if shield ~=nil
		then 
			shield:Kill()
	end
	StopSoundEvent("Combine.ChargerShieldLp", thisEntity)
	EmitSoundOn("Combine.ChargerShieldDown",thisEntity)	
	end,

	["models/characters/combine_suppressor/combine_suppressor.vmdl"] = function()
	EmitSound("vo.combine.suppressor.die_0")
	--Stops the looped minigun sound when the suppressor dies
	StopSoundEvent("CombineMG.FireLp", thisEntity)
	end,

}

function EmitSound(soundeventName)
	local fullSoundeventName = soundeventName .. RandomInt(1,9)
	print("Playing: ", fullSoundeventName)
	EmitSoundOn(fullSoundeventName, thisEntity)
end

function Activate()
	hp = thisEntity:GetHealth()
	thisEntity:SetHealth(hp*1.5)
end

function soldierDeath()
	if thisEntity:GetClassname() == "npc_combine_s"
		then
		switch[thisEntity:GetModelName()]()
	end
	isDeath = true 
end

function stopDamage()
	if isDeath == true 
		then 
			thisEntity:SetHealth(hp*0.5)
	end
end 
