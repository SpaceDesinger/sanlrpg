function assignFuel()
	for k, v in ipairs (getElementsByType("vehicle")) do
		setElementData(v,"fuel",100)
	end
	setTimer(dropFuel,30000,0)
end
addEventHandler("onResourceStart",getResourceRootElement(),assignFuel)

function enterFix(thePlayer)
	if (getElementData(source,"fuel") == nil) then
		setElementData(source,"fuel",100)
	end
	triggerClientEvent(thePlayer,"updateGauge",thePlayer)
end
addEventHandler("onVehicleEnter",getRootElement(),enterFix)

function dropFuel()
	for k, v in ipairs (getElementsByType("vehicle")) do
		if (getVehicleOccupant(v)) then
			local fuel = getElementData(v,"fuel")
				if (fuel) then
					if (fuel == 1) then
						outputChatBox("You've ran out of fuel. You need to call a mechanic.",getVehicleOccupant(v),255,0,0)
						setVehicleEngineState(v,false)
					end
					if (fuel > 0) then
						setElementData(v,"fuel",fuel-1)
						triggerClientEvent(getVehicleOccupant(v),"updateGauge",getVehicleOccupant(v))
					end
				else
					setElementData(v,"fuel",100)
				end
		end
	end
end

function hideGauge(thePlayer,seat,jacker)
	triggerClientEvent(thePlayer,"hideGauge",thePlayer)
end
addEventHandler("onVehicleExit",getRootElement(),hideGauge)