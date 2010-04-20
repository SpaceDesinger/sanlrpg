function onLogin(thePreviousAccount,theCurrentAccount)
	if (getAccountData(theCurrentAccount,"wanted")) then
		exports.RPGwanted:setWantedLevel(source,getAccountData(theCurrentAccount,"wanted"))
	else
		setAccountData(theCurrentAccount,"wanted",0)
		exports.RPGwanted:setWantedLevel(source,0)
	end
end
addEventHandler("onPlayerLogin",getRootElement(),onLogin)

function onLogout(thePreviousAccount,theCurrentAccount)
	setAccountData(thePreviousAccount,"wanted",getElementData(source,"wanted"))
	exports.RPGwanted:setWantedLevel(source,0)
end
addEventHandler("onPlayerLogout",getRootElement(),onLogout)

function onQuit()
	setAccountData(getPlayerAccount(source),"wanted",getElementData(source,"wanted"))
end
addEventHandler("onPlayerQuit",getRootElement(),onQuit)

function setNametag(thePlayer,name,stars)
	setPlayerNametagText(thePlayer,name.." ["..stars.."]")
end
addEvent("setNametag",true)
addEventHandler("setNametag",getRootElement(),setNametag)

function onNickChange(oldNick,newNick)
	setNametag(source,newNick,getElementData(source,"wanted"))
end
addEventHandler("onPlayerChangeNick",getRootElement(),onNickChange)

function onStop()
	for k, v in ipairs (getElementsByType("player")) do
		if (not isGuestAccount(getPlayerAccount(v))) then
			setAccountData(getPlayerAccount(v),"wanted",getElementData(v,"wanted"))
		end
	end
end
addEventHandler("onResourceStop",getResourceRootElement(),onStop)

function checkWanted()
	if (not isGuestAccount(getPlayerAccount(source))) then
		exports.RPGwanted:setWantedLevel(source,getElementData(source,"wanted"))
	else
		exports.RPGwanted:setWantedLevel(source,0)
	end
end
addEvent("checkWanted",true)
addEventHandler("checkWanted",getRootElement(),checkWanted)