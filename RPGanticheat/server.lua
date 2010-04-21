function vehCheck()
	if (math.floor(getElementHealth(source)) > 1000) then
		kickPlayer(getVehicleController(source),"Anti-Cheat: Vehicle Health Cheat")
	end
end
addEventHandler("onVehicleDamage",getRootElement(),vehCheck)