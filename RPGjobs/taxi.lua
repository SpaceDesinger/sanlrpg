function taxiTimer()
	setTimer(taxiPayload,5000,0)
end
addEventHandler("onResourceStart",getResourceRootElement(),taxiTimer)

function taxiPayload()
	for k, v in ipairs (getElementsByType("player")) do
		if (isPedInVehicle(v)) then
			if (getPedOccupiedVehicleSeat(v) > 0) then
				if (getVehicleController(getPedOccupiedVehicle(v))) then
					if (getElementData(getVehicleController(getPedOccupiedVehicle(v)),"class") == "Taxi Driver") then
						if (getElementModel(getPedOccupiedVehicle(v)) == 438 or getElementModel(getPedOccupiedVehicle(v)) == 420) then
							if (getPlayerMoney(v) >= 5) then
								givePlayerMoney(getVehicleController(getPedOccupiedVehicle(v)),5)
								takePlayerMoney(v,5)
							else
								removePedFromVehicle(v)
							end
						end
					end
				end
			end
		end
	end
end