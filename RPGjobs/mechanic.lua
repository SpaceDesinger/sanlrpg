function enterFix(thePlayer,seat,jacked)
	if (getElementData(thePlayer,"class") == "Mechanic") then
		if (seat > 0) then
			if (getVehicleController(source)) then
				if (getElementHealth(source) < 1000) then
					if (getPlayerMoney(getVehicleController(source)) >= 100) then
						fixVehicle(source)
						givePlayerMoney(thePlayer,100)
						takePlayerMoney(getVehicleController(source),100)
						outputDebugString(getPlayerName(thePlayer).." has fixed the vehicle of "..getPlayerName(getVehicleController(source))..".")
					end
				end
			end
		end
	end
end
addEventHandler("onVehicleEnter",getRootElement(),enterFix)