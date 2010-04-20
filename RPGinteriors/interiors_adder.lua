function addInterior(source,command,id,x,y,z,dimension,interior)
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))) then
		if (interior) then
			posX,posY,posZ = getElementPosition(source)
			local node = xmlLoadFile("interiors.map")
			local newNode = xmlCreateChild(node,"interiorEntry")
			xmlNodeSetAttribute (newNode,"id", id)
			xmlNodeSetAttribute (newNode,"posX",x)
			xmlNodeSetAttribute (newNode,"posY",y)
			xmlNodeSetAttribute (newNode,"posZ",z)
			xmlNodeSetAttribute (newNode,"rotation",0)
			xmlNodeSetAttribute (newNode,"dimension",dimension)
			xmlNodeSetAttribute (newNode,"interior",interior)
			local returnNode = xmlCreateChild(node,"interiorReturn")
			xmlNodeSetAttribute(returnNode,"refid",id)
			xmlNodeSetAttribute(returnNode,"posX",posX)
			xmlNodeSetAttribute(returnNode,"posY",posY)
			xmlNodeSetAttribute(returnNode,"posZ",posZ)
			xmlNodeSetAttribute(returnNode,"rotation",0)
			xmlNodeSetAttribute(returnNode,"dimension",getElementDimension(source))
			xmlNodeSetAttribute(returnNode,"interior",getElementInterior(source))
			local save = xmlSaveFile(node)
			local unload = xmlUnloadFile(node)
				if (save and unload) then
					outputChatBox("Interior successfully added.",source,255,255,0)
					outputDebugString(getPlayerName(source).." has added an interior in "..getZoneName(posX,posY,posZ)..", "..getZoneName(posX,posY,posZ,true)..".")
				end
		else
			outputChatBox("Please enter all of the args.",source,255,0,0)
		end
	else
		outputChatBox("You are not an admin.",source,255,0,0)
	end
end
addCommandHandler("interior",addInterior)