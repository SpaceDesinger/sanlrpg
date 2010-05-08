function onClientRender()
		if (not isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))) then
		if not ( last ) then
			last = 0
			thePlayer = getLocalPlayer()
		end
			if ( getTickCount() - last > 250 ) then
			if (getPlayerArmor ( thePlayer ) > 0 ) then
				triggerServerEvent("armorKick", thePlayer, 0 )
			end
		end
		if ( doesPlayerHaveJetpack ( thePlayer )) then
			if not ( getElementData ( thePlayer, "jetpackFuel")) then
				triggerServerEvent ( "jetpackKick", thePlayer, false )
			end
		end
		last = getTickCount()
	end
end
addEventHandler ( "onClientRender", getRootElement(), onClientRender )