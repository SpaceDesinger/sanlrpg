function addNew(source,command)
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))) then
		if (isPedInVehicle(source)) then
			local x,y,z = getElementPosition(getPedOccupiedVehicle(source))
			local model = getElementModel(getPedOccupiedVehicle(source))
			local rotX,rotY,rotZ = getVehicleRotation(getPedOccupiedVehicle(source))
			local file = xmlLoadFile("vehicles.map")
			local veh = xmlCreateChild(file,"veh")
			xmlNodeSetAttribute(veh,"model",model)
			xmlNodeSetAttribute(veh,"posX",x)
			xmlNodeSetAttribute(veh,"posY",y)
			xmlNodeSetAttribute(veh,"posZ",z)
			xmlNodeSetAttribute(veh,"rotation",rotZ)
			xmlSaveFile(file)
			xmlUnloadFile(file)
			outputChatBox("*INFO* The vehicle has been successfully added and will be created in 5 seconds.",source,255,255,0)
			outputDebugString(getPlayerName(source).." has mapped a "..getVehicleName(getPedOccupiedVehicle(source)).." in "..getElementZoneName(getPedOccupiedVehicle(source))..", "..getElementZoneName(getPedOccupiedVehicle(source),true)..".")
			setTimer(function() createVehicle(model,x,y,z,0,0,rotZ) end,5000,1)
		end
	end
end
addCommandHandler("addvehicle",addNew)