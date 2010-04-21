function medicFlower(attacker,weapon,bodypart,loss)
	if (weapon == 14) then
		if (getElementData(attacker,"class") == "Paramedic") then
			setElementHealth(source,getElementHealth(source)+loss)
		end
	end
end
addEventHandler("onClientPlayerDamage",getLocalPlayer(),medicFlower)