resX,resY = guiGetScreenSize()
function loginScreen()
	guiSetInputEnabled(true)
	showCursor(true)
	window = guiCreateWindow(resX/2-150,resY/2-100,300,200,"Login/Register",false)
	guiWindowSetMovable(window,false)
	guiWindowSetSizable(window,false)
	usernameLabel = guiCreateLabel(0.1,0.2,0.4,0.1,"Username:",true,window)
	usernameEdit = guiCreateEdit(0.35,0.18,0.5,0.15,"",true,window)
	passwordLabel = guiCreateLabel(0.1,0.45,0.4,0.1,"Password:",true,window)
	passwordEdit = guiCreateEdit(0.35,0.43,0.5,0.15,"",true,window)
	guiEditSetMasked(passwordEdit,true)
	loginButton = guiCreateButton(0.1,0.7,0.4,0.25,"Login",true,window)
	registerButton = guiCreateButton(0.5,0.7,0.4,0.25,"Register",true,window)
	addEventHandler("onClientGUIClick",loginButton,processLogin,false)
	addEventHandler("onClientGUIClick",registerButton,showRegister,false)
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),loginScreen)

function processLogin()
	local user = guiGetText(usernameEdit)
	local pass = guiGetText(passwordEdit)
		if (user ~= "" and pass	~= "") then
			triggerServerEvent("loginPlayer",getLocalPlayer(),user,pass)
		else
			outputChatBox("You must enter a username and password.",255,0,0)
		end
end

function showRegister()
	regWin = guiCreateWindow(resX/2-200,resY/2-150,400,300,"Register",false)
	guiSetVisible(window,false)
	regUserLabel = guiCreateLabel(0.1,0.2,0.4,0.1,"Username:",true,regWin)
	regUserEdit = guiCreateEdit(0.35,0.175,0.5,0.12,"",true,regWin)
	regPassLabel = guiCreateLabel(0.1,0.35,0.4,0.1,"Password:",true,regWin)
	regPassEdit = guiCreateEdit(0.35,0.32,0.5,0.12,"",true,regWin)
	guiEditSetMasked(regPassEdit,true)
	regPassConfLabel = guiCreateLabel(0.1,0.5,0.4,0.1,"Password (confirm):",true,regWin)
	regPassConfEdit = guiCreateEdit(0.4,0.475,0.5,0.12,"",true,regWin)
	guiEditSetMasked(regPassConfEdit,true)
	regRegisterButton = guiCreateButton(0.1,0.8,0.4,0.15,"Register",true,regWin)
	regCancelButton = guiCreateButton(0.5,0.8,0.4,0.15,"Cancel",true,regWin)
	addEventHandler("onClientGUIClick",regRegisterButton,processRegister,false)
	addEventHandler("onClientGUIClick",regCancelButton,hideReg,false)
end

function processRegister()
	local username = guiGetText(regUserEdit)
	local password = guiGetText(regPassEdit)
	local passwordConfirm = guiGetText(regPassConfEdit)
		if (username ~= "" and password ~= "" and passwordConfirm ~= "") then
			if (password == passwordConfirm) then
					triggerServerEvent("registerPlayer",getLocalPlayer(),username,password,email)
			else
				outputChatBox("Your passwords don't match.",255,0,0)
			end
		else
			outputChatBox("You must fill in every field to register.",255,0,0)
		end
end

function hideReg()
	guiSetVisible(regWin,false)
	guiSetText(regUserEdit,"")
	guiSetText(regPassEdit,"")
	guiSetText(regPassConfEdit,"")
	guiSetText(regEmailEdit,"")
	guiSetVisible(window,true)
end
addEvent("hideReg",true)
addEventHandler("hideReg",getLocalPlayer(),hideReg)

function hideLogin()
	guiSetVisible(window,false)
	guiSetText(usernameEdit,"")
	guiSetText(passwordEdit,"")
	showCursor(false)
	guiSetInputEnabled(false)
	spawnMenu()
end
addEvent("hideLogin",true)
addEventHandler("hideLogin",getRootElement(),hideLogin)

function showLogin()
	guiSetVisible(window,true)
	showCursor(true)
	guiSetInputEnabled(true)
		if (guiGetVisible(spawnWindow)) then
			guiSetVisible(spawnWindow,false)
		end
end
addEvent("showLogin",true)
addEventHandler("showLogin",getRootElement(),showLogin)

function spawnMenu()
	showCursor(true)
	spawnWindow = guiCreateWindow(20,resY-430,400,410,"SANL:RPG Spawn Window",false)
	cityGrid = guiCreateGridList(2.5,22.5,190,150,false,spawnWindow)
	classGrid = guiCreateGridList(2.5,175,190,150,false,spawnWindow)
	spawnGrid = guiCreateGridList(200,22.5,190,301.5,false,spawnWindow)
	spawnButton = guiCreateButton(10,410-80,900,75,"Spawn",false,spawnWindow)
	cityColumn = guiGridListAddColumn(cityGrid,"City",0.8)
	classColumn = guiGridListAddColumn(classGrid,"Class",0.8)
	spawnColumn = guiGridListAddColumn(spawnGrid,"Spawn",0.8)
	addEventHandler("onClientGUIClick",cityGrid,onCityClick,false)
	addEventHandler("onClientGUIClick",classGrid,onClassClick,false)
	addEventHandler("onClientGUIClick",spawnGrid,onSpawnClick,false)
	addEventHandler("onClientGUIClick",spawnButton,onButtonClick,false)
	fadeCamera(true,5)
	setCameraMatrix(1468.8785400391,-919.25317382813,100.153465271,1468.388671875,-918.42474365234,99.881813049316)
		for k, v in ipairs (getElementsByType("city")) do
			local row = guiGridListAddRow(cityGrid)
			guiGridListSetItemText(cityGrid,row,1,getElementID(v),false,false)
		end
end

function onCityClick()
	guiGridListClear(classGrid)
	guiGridListClear(spawnGrid)
	city = guiGridListGetItemText(cityGrid,guiGridListGetSelectedItem(cityGrid),1)
		if city ~= "" then
			playSoundFrontEnd(2)
			local availableClasses = getElementsByType("class", getElementByID(city))
			for k, v in ipairs(availableClasses) do
				local row = guiGridListAddRow(classGrid)
				guiGridListSetItemText(classGrid,row,1,getElementID(v),false,false)
			end
		end
end

function onClassClick()
	guiGridListClear(spawnGrid)
	class = guiGridListGetItemText(classGrid,guiGridListGetSelectedItem(classGrid),1)
		if city ~= "" and class ~= "" then
			playSoundFrontEnd(2)
			local availableSpawns = getElementsByType("spawn", getElementByID(city))
			for k, v in ipairs (availableSpawns) do
      if getElementID(getElementParent(v)) == class then
        local row = guiGridListAddRow(spawnGrid)
        guiGridListSetItemText(spawnGrid,row,1,getElementID(v),false,false)
			end
	  end
		end
end


function onSpawnClick()
	spawn = guiGridListGetItemText(spawnGrid,guiGridListGetSelectedItem(spawnGrid),1)
		if city ~= "" and class ~= "" and spawn ~= "" then
			playSoundFrontEnd(2)
			local avalibleSpawns = getElementsByType("spawn",getElementByID(city))
				for k, v in ipairs (avalibleSpawns) do
					if getElementID(getElementParent(v)) == class then
						if getElementID(getElementParent(getElementParent(v))) == city then
							if getElementID(v) == spawn then
								spawnEvent = getElementData(v,"spawnEvent")
							end
						end
					end
				end
		end
end

function onButtonClick()
	if city ~= "" and class ~= "" and spawn ~= "" then
		triggerServerEvent(spawnEvent,getLocalPlayer())
		playSoundFrontEnd(2)
	end
end

function onSpawn()
	guiSetVisible(spawnWindow,false)
	showCursor(false)
	spawnEvent = nil
	guiGridListClear(classGrid)
	guiGridListClear(spawnGrid)
	end
addEventHandler("onClientPlayerSpawn",getRootElement(),onSpawn)

function onDead()
	if (getElementData(getLocalPlayer(),"logged") == "in") then
		guiSetVisible(spawnWindow,true)
		setCameraMatrix(1468.8785400391,-919.25317382813,100.153465271,1468.388671875,-918.42474365234,99.881813049316)
		fadeCamera(true)
	end
	showCursor(true)
end
addEventHandler("onClientPlayerWasted",getLocalPlayer(),onDead)