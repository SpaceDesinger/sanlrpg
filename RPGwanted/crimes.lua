function assault(attacker,attackerweapon,bodypart,loss)
	if (attacker) then
		if (getElementType(attacker) == "player") then
			if (getTeamName(getPlayerTeam(attacker)) == "Police") then
				if (getElementData(source,"wanted") == 0) then
					if (getElementData(attacker,"wanted") == 0) then
						exports.RPGwanted:setWantedLevel(attacker,1)
					end
				end
			elseif (getElementData(attacker,"class") == "Paramedic") then
				if (attackerweapon ~= 14) then
					if (getElementData(attacker,"wanted") == 0) then
						exports.RPGwanted:setWantedLevel(attacker,1)
					end
				end
			elseif (getTeamName(getPlayerTeam(attacker)) == "Admins") then
				return
			else
				if (getElementData(attacker,"wanted") == 0) then
					exports.RPGwanted:setWantedLevel(attacker,1)
				end
			end
		end
	end
end
addEventHandler("onPlayerDamage",getRootElement(),assault)

function murder(totalammo,killer,killerweapon,bodypart)
	if (killer) then
		if (getElementType(killer) == "player") then
			if (getTeamName(getPlayerTeam(killer)) == "Police") then
				if (getElementData(source,"wanted") == 0) then
					exports.RPGwanted:setWantedLevel(killer,getElementData(killer,"wanted")+1)
				end
			elseif (getTeamName(getPlayerTeam(killer)) == "Admins") then
				return
			else
				exports.RPGwanted:setWantedLevel(killer,getElementData(killer,"wanted")+1)
			end
		end
	end
end
addEventHandler("onPlayerWasted",getRootElement(),murder)

function grandTheftAuto(thePlayer,seat,jacked)
	if (jacked) then
		if (getTeamName(getPlayerTeam(thePlayer)) == "Police") then
			if (getElementData(jacked,"wanted") == 0) then
				if (getElementData(thePlayer,"wanted") == 0) then
					exports.RPGwanted:setWantedLevel(thePlayer,1)
				end
			end
		elseif (getTeamName(getPlayerTeam(thePlayer)) == "Admins") then
			return
		else
			if (getElementData(thePlayer,"wanted") == 0) then
				exports.RPGwanted:setWantedLevel(thePlayer,1)
			end
		end
	end
end
addEventHandler("onVehicleEnter",getRootElement(),grandTheftAuto)

function copCars(thePlayer,seat,jacked)
local policeVehicles = {[427]=true,[490]=true,[528]=true,[523]=true,[598]=true,[596]=true,[597]=true,[599]=true,[601]=true}
	if (not jacked) then
		if (getTeamName(getPlayerTeam(thePlayer)) ~= "Police" and getTeamName(getPlayerTeam(thePlayer)) ~= "Admins") then
			if (policeVehicles[getElementModel(thePlayer)]) then
				if (seat == 0) then
					if (getElementData(thePlayer,"wanted") == 0) then
						exports.RPGwanted:setWantedLevel(thePlayer,1)
					end
				end
			end
		end
	end
end
addEventHandler("onVehicleEnter",getRootElement(),copCars)