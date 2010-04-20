function carjacker(thePlayer,seat,jacked)
	if (jacked) then
		if (seat == 0) then
			if (getElementData(thePlayer,"class") == "Carjacker") then
				if (getPlayerMoney(jacked) >= 100) then
					givePlayerMoney(thePlayer,100)
					takePlayerMoney(jacked,100)
				elseif (getPlayerMoney(jacked) < 100) then
					takePlayerMoney(jacked,getPlayerMoney(jacked))
					givePlayerMoney(thePlayer,getPlayerMoney(jacked))
					outputDebugString(getPlayerName(thePlayer).." has carjacked "..getPlayerName(jacked)..".")
				end
			end
		end
	end
end
addEventHandler("onVehicleEnter",getRootElement(),carjacker)