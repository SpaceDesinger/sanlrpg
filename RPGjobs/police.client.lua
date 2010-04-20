local jailMessage = {}
local resX, resY = guiGetScreenSize()
drawJailCounter = function()
  if jailMessage[2] then
	local realTime = jailMessage[1]/1000
    dxDrawText("You will be released in " .. tostring(realTime) .. " seconds.", 0, resY / 2, resX + 2, 100, tocolor(0, 0, 0, 200), 2, "default-bold", "center" )
    dxDrawText("You will be released in " .. tostring(realTime) .. " seconds.", 0, resY / 2, resX, 100, tocolor(100, 100, 200, 200), 2, "default-bold", "center" )
  end
end
--------------------------------------------------
----Backup ending for lines 5 and 6 are below.----
--"center", "bottom", true, true, false )
----Backup ending for lines 5 and 6 are above.----
--------------------------------------------------
startJailCounter = function(jailTime)
  jailMessage[2] = true
  addEventHandler("onClientRender", getRootElement(), drawJailCounter)
  iterateJailTime(jailTime)
end

iterateJailTime = function(jailTime)
  jailMessage[1] = jailTime
  if jailMessage[1] > 0 then
    setTimer(iterateJailTime, 1000, 1, jailTime - 1000)
  elseif ( jailMessage[1] == 0 ) then
    jailMessage[2] = false
	removeEventHandler ("onClientRender", getRootElement(), drawJailCounter)
  end
end
addEvent("startJailCounter", true)
addEventHandler("startJailCounter", getLocalPlayer(), startJailCounter)