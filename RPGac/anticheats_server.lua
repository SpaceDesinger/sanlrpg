--[[Note: This has NOT been tested and may not work. please test this before putting it public]]--

function weaponSwitchBlacklist ( previousWeaponID, currentWeaponID )
	if (weapons[currentWeaponID] ) then
		if ( getPlayerWeapon (source) == previousWeaponID ) then
		local player = getLocalPlayer()
		local reason = "Anticheat: Detected a blacklist weapon"
			kickPlayer(player,reason)
			outputChatBox(player.."has been kicked by Anticheat", getRootElement(), 255, 0, 0)
		end
	end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), onPlayerWeaponSwitch)

weapons = { [38] = true, [37] = true, [36] = true, [35] = true, [17]= true, [18] = true, [45] = true, [44] = true }

function armorKick ( playerArmor )
	if ( getPlayerArmor (source)) then
		local player = getLocalPlayer(source)
		local reason = "Anticheat: Detected Armor"
		kickPlayer(player,reason)
		outputChatBox(player.."has been kicked by Anticheat", getRootElement(), 255, 0, 0)
	end
end
addEvent("armorKick", true)

function jetpackKick()
	if ( doesPlayerHaveJetpack ( source )) then
		local player = getLocalPlayer(source)
		local reaosn = "Anticheat: Detected Jetpack"
		kickPlayer(player,reason)
		outputChatBox(player.."has been kicked by Anticheat", getRootElement(), 255, 0, 0)
	end
end
addEvent("jetpackKick", true)