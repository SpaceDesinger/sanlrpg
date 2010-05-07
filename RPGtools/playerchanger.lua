function playerChanger()
	if (string.lower(getPlayerName(source)) == string.lower("Player")) then
		local name = "SANL_G"..math.random(1,50)
			while getPlayerFromName(name) do
				name = "SANL_G"..math.random(1,50)
			end
		setPlayerName(source,name)
	end
end
addEventHandler("onPlayerJoin", getRootElement(), playerChanger)