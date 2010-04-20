function nightstickArrest(attacker,attackerweapon,bodypart,loss)
	if (attacker) then
		if (getTeamName(getPlayerTeam(attacker)) == "Police") then
			if (attackerweapon == 3) then
				if (getElementData(source,"wanted") > 0) then
					arrestPlayer(source,getElementData(source,"wanted")*30000)
					givePlayerMoney(attacker,getElementData(source,"wanted")*100)
					outputChatBox("*ARREST* "..getPlayerName(source).." has been arrested by "..getPlayerName(attacker).."",getRootElement(),255,255,0)
					outputDebugString(getPlayerName(source).." has been arrested by "..getPlayerName(attacker)..".")
				end
			end
		end
	end
end
addEventHandler("onPlayerDamage",getRootElement(),nightstickArrest)

function jackArrest(thePlayer,seat,jacker)
	if (jacker) then
		if (getTeamName(getPlayerTeam(jacker)) == "Police") then
			if (getElementData(thePlayer,"wanted") > 0) then
				arrestPlayer(thePlayer,getElementData(thePlayer,"wanted")*30000)
				givePlayerMoney(jacker,getElementData(thePlayer,"wanted")*100)
				outputChatBox("*ARREST* "..getPlayerName(thePlayer).." has been arrested by "..getPlayerName(jacker).."",getRootElement(),255,255,0)
				outputDebugString(getPlayerName(thePlayer).." has been arrested by "..getPlayerName(jacker)..".")
			end
		end
	end
end
addEventHandler("onVehicleExit",getRootElement(),jackArrest)

function arrestPlayer(thePlayer,jailTime)
	setTimer(releasePlayer,tonumber(jailTime),1,thePlayer)
	setElementInterior(thePlayer,6)
	setElementPosition(thePlayer,264.4873046875,77.5732421875,1001.0390625)
	toggleControl(thePlayer,"fire",false)
	toggleControl(thePlayer,"action",false)
	toggleControl(thePlayer,"enter_exit",false)
	triggerClientEvent(thePlayer,"startJailCounter",thePlayer,jailTime)
end

function releasePlayer(thePrisoner)
	setElementInterior(thePrisoner,0)
	setElementPosition(thePrisoner,1550.26171875,-1675.470703125,15.329447746277)
	toggleControl(thePrisoner,"fire",true)
	toggleControl(thePrisoner,"action",true)
	toggleControl(thePrisoner,"enter_exit",true)
	outputChatBox("*ARREST* "..getPlayerName(thePrisoner).." has been released from jail.",getRootElement(),255,255,0)
	exports.RPGwanted:setWantedLevel(thePrisoner,0)
	outputDebugString(getPlayerName(thePrisoner).." has been released from jail.")
end

function adminJail(source,command,victim,jailTime)
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))) then
		if (getPlayerFromName(victim)) then
			if (isPedInVehicle(getPlayerFromName(victim))) then
				removePedFromVehicle(getPlayerFromName(victim))
			end
			arrestPlayer(getPlayerFromName(victim),jailTime*1000,source)
			outputChatBox("*ADMIN ARREST* "..victim.." has been admin arrested by "..getPlayerName(source).."",getRootElement(),255,0,0)
			outputDebugString(victim.." has been admin arrested by "..getPlayerName(source)..".")
		else
			outputChatBox(victim.." does not exist.",source,255,0,0)
		end
	else
		outputChatBox("You are not an admin.",source,255,0,0)
	end
end
addCommandHandler("jail",adminJail)