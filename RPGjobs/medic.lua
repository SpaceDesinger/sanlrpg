function healFlowers(attacker,attackerweapon,bodypart,loss)
	if (attacker) then
		if (getElementType(attacker) == "player") then
			if (getElementData(attacker,"class") == "Paramedic") then
				if (attackerweapon == 14) and (getElementHealth(source) < 80) then
					if (getPlayerMoney(source) >= 100) then
						setElementHealth(source,100)
						givePlayerMoney(attacker,100)
						takePlayerMoney(source,100)
						outputDebugString(getPlayerName(attacker).." has healed "..getPlayerName(source)..".")
					end
				end
			end
		end
	end
end
addEventHandler("onPlayerDamage",getRootElement(),healFlowers)

function ambulanceEnter(enteredPlayer)
	if ( getElementModel(source) == 416 ) then
		if (getVehicleController(source)) then
			if (getElementData(getVehicleController(source),"class") == "Paramedic") then
				if (getPedOccupiedVehicleSeat(enteredPlayer) > 0) then
					if (getElementHealth(enteredPlayer) < 90) then
						if (getPlayerMoney(enteredPlayer) >= 100) then
							setElementHealth(enteredPlayer,100)
							givePlayerMoney(getVehicleController(source),100)
							takePlayerMoney(enteredPlayer,100)
							outputDebugString(getPlayerName(getVehicleController(source)).." has healed "..getPlayerName(enteredPlayer)..".")
						end
					end
				end
			end
		end
	end
end
addEventHandler("onVehicleEnter",getRootElement(),ambulanceEnter)