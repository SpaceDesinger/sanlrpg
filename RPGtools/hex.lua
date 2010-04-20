function removeHEX(oldNick,newNick)
	local name = getPlayerName(source)
	if newNick then
		name = newNick
	end
	if (string.find(name,"#%x%x%x%x%x%x")) then
		local name = string.gsub(name,"#%x%x%x%x%x%x","")
		setPlayerName(source,name)
			if (newNick) then
				cancelEvent()
			end
	end	
end
addEventHandler("onPlayerJoin",getRootElement(),removeHEX)
addEventHandler("onPlayerChangeNick",getRootElement(),removeHEX)

function startup()
	for k, v in ipairs (getElementsByType("player")) do
		local name = getPlayerName(v)
			if (string.find(name,"#%x%x%x%x%x%x")) then
				local name = string.gsub(name,"#%x%x%x%x%x%x","")
				setPlayerName(v,name)
				cancelEvent()
			end
	end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),startup)