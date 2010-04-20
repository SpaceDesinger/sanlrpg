function giveCommand ( source, command, playerToGive, moneyToGive )
if ( playerToGive ) then
   if ( moneyToGive ) then
      local givingPlayer = getPlayerName ( source )
      local thePlayer = getPlayerFromName ( playerToGive )
      if ( thePlayer ~= false ) then
         local moneyToGive = tonumber ( moneyToGive )
         local playersMoney = getPlayerMoney ( source )
         if ( playersMoney >= moneyToGive and moneyToGive > 0 ) then
            takePlayerMoney ( source, moneyToGive )
            givePlayerMoney ( thePlayer, moneyToGive )
            outputChatBox ( givingPlayer .. " has given you $" .. moneyToGive .. ".", thePlayer, 255, 255, 0 )
            outputChatBox ( "You have given " .. playerToGive .. " $" .. moneyToGive .. ".", source, 255, 255, 0 )
			outputDebugString(givingPlayer.." has given "..playerToGive.." $"..moneyToGive..".")
         else
         outputChatBox ( "You do not have enough money.", source, 255, 255, 0 )
         end
      else
      outputChatBox ( thePlayer .. " does not exist.", source, 255, 255, 0 )
      end
   else
   outputChatBox ( "Please specify an amount to give the player!", source, 255, 255, 0 )
   end
else
outputChatBox ( "Please specify which player to give the money to!", source, 255, 255, 0 )
end
end
addCommandHandler ( "give", giveCommand )

function callPolice(source,command)
	outputChatBox("* Your message has been sent.",source,255,255,0)
	for k, v in ipairs (getPlayersInTeam(getTeamFromName("Police"))) do
		if (v ~= source) then
			outputChatBox("* "..getPlayerName(source).." requires police assistance at "..getElementZoneName(source)..", "..getElementZoneName(source,true)..".",v,255,255,0)
		end
	end
end
addCommandHandler("police",callPolice)

function callMedic(source,command)
	outputChatBox("* Your message has been sent.",source,255,255,0)
	for k, v in ipairs (getElementsByType("player")) do
		if (getElementData(v,"class") == "Paramedic" and v ~= source) then
			outputChatBox("* "..getPlayerName(source).." requires a medic at "..getElementZoneName(source)..", "..getElementZoneName(source,true)..".",v,255,255,0)
		end
	end
end
addCommandHandler("medic",callMedic)

function callCoastguard(source,command)
	outputChatBox("* Your message has been sent.",source,255,255,0)
	for k, v in ipairs (getElementsByType("player")) do
		if (getElementData(v,"class") == "Paramedic" and v ~= source) then
			outputChatBox("* "..getPlayerName(source).." requires the coastguard at "..getElementZoneName(source)..", "..getElementZoneName(source,true)..".",v,255,255,0)
		end
	end
end
addCommandHandler("coastguard",callCoastguard)

function vehHealth(source,command)
	if (isPedInVehicle(source)) then
		local health = math.floor(getElementHealth(getPedOccupiedVehicle(source))/10)
		outputChatBox("You vehicle has "..health.."% health.",source,255,255,0)
	else
		outputChatBox("You are not in a vehicle.",source,255,0,0)
	end
end
addCommandHandler("vh",vehHealth)