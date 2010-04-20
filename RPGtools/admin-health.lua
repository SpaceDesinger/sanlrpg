function infHealth()
	if (getElementData(source,"class") == "Admin") then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerDamage",getRootElement(),infHealth)