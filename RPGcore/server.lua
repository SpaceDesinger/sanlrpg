function login(user,pass)
	if (getAccount(user,pass)) then
		logIn(source,getAccount(user),pass)
	else
		outputChatBox("You have entered an invalid username and/or password.",source,255,0,0)
	end
end
addEvent("loginPlayer",true)
addEventHandler("loginPlayer",getRootElement(),login)

function hideLogin()
	setElementData(source,"logged","in")
	triggerClientEvent(source,"hideLogin",source)
end
addEventHandler("onPlayerLogin",getRootElement(),hideLogin)

function onLogout()
	setElementData(source,"logged","out")
	triggerClientEvent(source,"showLogin",source)
	killPed(source)
	fadeCamera(source,false)
end
addEventHandler("onPlayerLogout",getRootElement(),onLogout)

function registerPlayer(username,password)
	if (getAccount(username) ~= true) then
		local account = addAccount(username,password)
			if (account) then
				setAccountData(account,"money",1000)
				triggerClientEvent(source,"hideReg",source)
				setAccountData(account,"wanted",0)
				outputChatBox("*ALERT* Account creation successfull.",source,255,255,0)
			end
	else
		outputChatBox("This username is already in use.",source,255,0,0)
	end
end
addEvent("registerPlayer",true)
addEventHandler("registerPlayer",getRootElement(),registerPlayer)

function logoutOnStart()
	for k, v in ipairs(getElementsByType("player")) do
		if ( not isGuestAccount(getPlayerAccount(v))) then
			logOut(v)
		end
	end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),logoutOnStart)

function teams()
	createTeam("Admins",190,190,190)
	createTeam("Police",0,0,255)
	createTeam("Emergency Services",0,255,255)
	createTeam("Criminals",255,0,0)
	createTeam("Civilians",255,255,0)
end
addEventHandler("onResourceStart",getResourceRootElement(),teams)

function lsPoliceOfficer()
	spawnPlayer(source,1576.6746826172,-1620.2409667969,13.546875,270,280,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Police Officer")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("lsPoliceOfficer",true)
addEventHandler("lsPoliceOfficer",getRootElement(),lsPoliceOfficer)

function lsTrafficCop()
	spawnPlayer(source,1576.6746826172,-1620.2409667969,13.546875,270,284,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Traffic Cop")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("lsTrafficCop",true)
addEventHandler("lsTrafficCop",getRootElement(),lsTrafficCop)

function lsSwat()
	spawnPlayer(source,1576.6746826172,-1620.2409667969,13.546875,270,285,0,0,getTeamFromName("Police"))
	setElementData(source,"class","SWAT")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,31,500)
end
addEvent("lsSwat",true)
addEventHandler("lsSwat",getRootElement(),lsSwat)

function lsFbi()
	spawnPlayer(source,1576.6746826172,-1620.2409667969,13.546875,270,286,0,0,getTeamFromName("Police"))
	setElementData(source,"class","FBI")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,29,500)
end
addEvent("lsFbi",true)
addEventHandler("lsFbi",getRootElement(),lsFbi)

function lsAdmin()
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))) then
		spawnPlayer(source,1721.837890625,-1627.4365234375,20.212705612183,0,165,0,0,getTeamFromName("Admins"))
		setElementData(source,"class","Admin")
	else
		outputChatBox("You are not an admin.",source,255,0,0) 
	end
end
addEvent("lsAdmin",true)
addEventHandler("lsAdmin",getRootElement(),lsAdmin)

function lsPilot()
	spawnPlayer(source,1649.2353515625,-2416.25390625,13.5546875,180,61,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Pilot")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("lsPilot",true)
addEventHandler("lsPilot",getRootElement(),lsPilot)

function lsMechanic()
	spawnPlayer(source,1632.609375,-1844.5830078125,13.539519309998,0,50,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Mechanic")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("lsMechanic",true)
addEventHandler("lsMechanic",getRootElement(),lsMechanic)

function lsParamedic()
	spawnPlayer(source,2036.5732421875,-1410.6572265625,17.1640625,0,274,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Paramedic")
	giveWeapon(source,14)
	giveWeapon(source,22,500)
end
addEvent("lsParamedic",true)
addEventHandler("lsParamedic",getRootElement(),lsParamedic)

function lsCriminal()
	spawnPlayer(source,2505.677734375,-1683.1611328125,13.546875,0,29,0,0,getTeamFromName("Criminals"))
	setElementData(source,"class","General Criminal")
	giveWeapon(source,1)
	giveWeapon(source,5)
	giveWeapon(source,22,500)
	giveWeapon(source,28,500)
end
addEvent("lsCriminal",true)
addEventHandler("lsCriminal",getRootElement(),lsCriminal)

function lsCarjacker()
	spawnPlayer(source,1697.0498046875,-1098.1044921875,24.078125,0,101,0,0,getTeamFromName("Criminals"))
	setElementData(source,"class","Carjacker")
	giveWeapon(source,1)
	giveWeapon(source,5)
	giveWeapon(source,22,500)
	giveWeapon(source,28,500)
end
addEvent("lsCarjacker",true)
addEventHandler("lsCarjacker",getRootElement(),lsCarjacker)

function sfPoliceOfficer()
	spawnPlayer(source,-1616.583984375,672.767578125,7.1875,0,281,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Police Officer")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("sfPoliceOfficer",true)
addEventHandler("sfPoliceOfficer",getRootElement(),sfPoliceOfficer)

function sfTrafficCop()
	spawnPlayer(source,-1616.583984375,672.767578125,7.1875,0,284,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Traffic Cop")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("sfTrafficCop",true)
addEventHandler("sfTrafficCop",getRootElement(),sfTrafficCop)

function sfSwat()
	spawnPlayer(source,-1616.583984375,672.767578125,7.1875,0,285,0,0,getTeamFromName("Police"))
	setElementData(source,"class","SWAT")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,31,500)
end
addEvent("sfSwat",true)
addEventHandler("sfSwat",getRootElement(),sfSwat)

function sfFbi()
	spawnPlayer(source,-1616.583984375,672.767578125,7.1875,0,286,0,0,getTeamFromName("Police"))
	setElementData(source,"class","FBI")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,29,500)
end
addEvent("sfFbi",true)
addEventHandler("sfFbi",getRootElement(),sfFbi)

function sfFirefighter()
	spawnPlayer(source,-2024.337890625,66.38671875,28.445196151733,0,279,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Firefighter")
	giveWeapon(source,9)
	giveWeapon(source,22,500)
	giveWeapon(source,42,500)
end
addEvent("sfFirefighter",true)
addEventHandler("sfFirefighter",getRootElement(),sfFirefighter)

function sfParamedic()
	spawnPlayer(source,-2656.306640625,600.337890625,14.453125,0,274,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Paramedic")
	giveWeapon(source,14)
	giveWeapon(source,22,500)
end
addEvent("sfParamedic",true)
addEventHandler("sfParamedic",getRootElement(),sfParamedic)

function sfMechanic()
	spawnPlayer(source,-2032.5361328125,156.3916015625,29.046106338501,0,50,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Mechanic")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("sfMechanic",true)
addEventHandler("sfMechanic",getRootElement(),sfMechanic)

function sfTaxiDriver()
	spawnPlayer(source,-1755.880859375,943.1337890625,24.890625,0,182,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Taxi Driver")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("sfTaxiDriver",true)
addEventHandler("sfTaxiDriver",getRootElement(),sfTaxiDriver)

function sfPilot()
	spawnPlayer(source,-1366.7021484375,-262.0615234375,14.1484375,0,61,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Pilot")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("sfPilot",true)
addEventHandler("sfPilot",getRootElement(),sfPilot)

function bcBiker()
	spawnPlayer(source,-84.4375,1367.2763671875,10.2734375,0,100,0,0,getTeamFromName("Criminals"))
	setElementData(source,"class","Biker")
	giveWeapon(source,1)
	giveWeapon(source,5)
	giveWeapon(source,22,500)
	giveWeapon(source,28,500)
end
addEvent("bcBiker",true)
addEventHandler("bcBiker",getRootElement(),bcBiker)

function bcSheriff()
	spawnPlayer(source,-216.79296875,979.5146484375,19.499000549316,0,283,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Sheriff")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("bcSheriff",true)
addEventHandler("bcSheriff",getRootElement(),bcSheriff)

function bcDeputy()
	spawnPlayer(source,-216.79296875,979.5146484375,19.499000549316,0,288,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Deputy")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("bcDeputy",true)
addEventHandler("bcDeputy",getRootElement(),bcDeputy)

function trCoastguard()
	spawnPlayer(source,-2246.3291015625,2308.8984375,4.9713096618652,0,276,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Coastguard")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("trCoastguard",true)
addEventHandler("trCoastguard",getRootElement(),trCoastguard)

function trPriest()
	spawnPlayer(source,-2482.8798828125,2405.6513671875,16.758289337158,0,68,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Preist")
	giveWeapon(source,6)
	giveWeapon(source,22,500)
end
addEvent("trPriest",true)
addEventHandler("trPriest",getRootElement(),trPriest)

function bcParamedic()
	spawnPlayer(source,-325.8203125,1055.662109375,20.144407272339,0,274,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Paramedic")
	giveWeapon(source,14)
	giveWeapon(source,22,500)
end
addEvent("bcParamedic",true)
addEventHandler("bcParamedic",getRootElement(),bcParamedic)

function lvPoliceOfficer()
	spawnPlayer(source,2292.81640625,2450.05078125,10.8203125,0,282,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Police Officer")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("lvPoliceOfficer",true)
addEventHandler("lvPoliceOfficer",getRootElement(),lvPoliceOfficer)

function lvTrafficCop()
	spawnPlayer(source,2292.81640625,2450.05078125,10.8203125,0,284,0,0,getTeamFromName("Police"))
	setElementData(source,"class","Traffic Cop")
	giveWeapon(source,3)
	giveWeapon(source,22,500)
	giveWeapon(source,25,250)
end
addEvent("lvTrafficCop",true)
addEventHandler("lvTrafficCop",getRootElement(),lvTrafficCop)

function lvSwat()
	spawnPlayer(source,2292.81640625,2450.05078125,10.8203125,0,285,0,0,getTeamFromName("Police"))
	setElementData(source,"class","SWAT")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,31,500)
end
addEvent("lvSwat",true)
addEventHandler("lvSwat",getRootElement(),lvSwat)

function lvFbi()
	spawnPlayer(source,2292.81640625,2450.05078125,10.8203125,0,286,0,0,getTeamFromName("Police"))
	setElementData(source,"class","FBI")
	giveWeapon(source,3)
	giveWeapon(source,24,500)
	giveWeapon(source,25,250)
	giveWeapon(source,29,500)
end
addEvent("lvFbi",true)
addEventHandler("lvFbi",getRootElement(),lvFbi)

function lvPilot()
	spawnPlayer(source,1318.953125,1255.251953125,10.8203125,0,61,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Pilot")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("lvPilot",true)
addEventHandler("lvPilot",getRootElement(),lvPilot)

function lvPriest()
	spawnPlayer(source,2489.6533203125,917.7568359375,11.0234375,0,68,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Preist")
	giveWeapon(source,6)
	giveWeapon(source,22,500)
end
addEvent("lvPriest",true)
addEventHandler("lvPriest",getRootElement(),lvPriest)

function lvParamedic()
	spawnPlayer(source,1607.28125,1818.572265625,10.8203125,0,274,0,0,getTeamFromName("Emergency Services"))
	setElementData(source,"class","Paramedic")
	giveWeapon(source,14)
	giveWeapon(source,22,500)
end
addEvent("lvParamedic",true)
addEventHandler("lvParamedic",getRootElement(),lvParamedic)

function fcTrucker()
	spawnPlayer(source,-65.8515625,-1126.79296875,1.078125,0,202,0,0,getTeamFromName("Civilians"))
	setElementData(source,"class","Trucker")
	giveWeapon(source,5)
	giveWeapon(source,22,500)
end
addEvent("fcTrucker",true)
addEventHandler("fcTrucker",getRootElement(),fcTrucker)

function onSpawn()
	r,g,b = getTeamColor(getPlayerTeam(source))
	createBlipAttachedTo(source,0,2,r,g,b)
	fadeCamera(source,true)
	setCameraTarget(source,source)
		if (getPlayerMoney(source) == 0) then
			setPlayerMoney(source,100)
		end
end
addEventHandler("onPlayerSpawn",getRootElement(),onSpawn)

function onDeath()
	setElementData(source,"class",nil)
	setPlayerTeam(source,nil)
	for k, v in ipairs (getAttachedElements(source)) do
		if (isElement(v) and getElementType(v) == "blip") then
			destroyElement(v)
		end
	end
end
addEventHandler("onPlayerWasted",getRootElement(),onDeath)

function onQuit()
	for k, v in ipairs (getAttachedElements(source)) do
		if (isElement(v) and getElementType(v) == "blip") then
			destroyElement(v)
		end
	end
end
addEventHandler("onPlayerQuit",getRootElement(),onQuit)