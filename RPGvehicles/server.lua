function spawnVehs()
	for k, v in ipairs (getElementsByType("veh")) do
		createVehicle(getElementData(v,"model"),getElementData(v,"posX"),getElementData(v,"posY"),getElementData(v,"posZ"),0,0,getElementData(v,"rotation"))
	end
	for k, v in ipairs (getElementsByType("vehicle")) do
		toggleVehicleRespawn(v,true)
		setVehicleIdleRespawnDelay(v,120000)
	end
end
addEventHandler("onResourceStart",getResourceRootElement(),spawnVehs)

function respawnVeh()
	setTimer(respawnVehicle,5000,1,source)
end
addEventHandler("onVehicleExplode",getRootElement(),respawnVeh)