function guest()
	local name = getPlayerName(source)
	if (string.lower(name) == "player" or string.find(name,"Emma_") or string.find(name,"Jacob_") or string.find(name,"Michael_")) then
		setPlayerName(source,"SANL_Guest_"..math.random(0,999))
	end
end
addEventHandler("onPlayerJoin",getRootElement(),guest)

function blockPlayer(oldNick,newNick)
	if (string.lower(newNick) == "player") then
		outputChatBox("This nick is not allowed.",source,255,0,0)
		cancelEvent()
	end
end
addEventHandler("onPlayerChangeNick",getRootElement(),blockPlayer)