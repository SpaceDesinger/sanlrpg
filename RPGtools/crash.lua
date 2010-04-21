function crash(loss)
	if (getVehicleController(source)) then
		setElementHealth(getVehicleController(source),getElementHealth(getVehicleController(source))-math.floor(loss)/10)
	end
end
addEventHandler("onVehicleDamage",getRootElement(),crash)