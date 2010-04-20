local resX,resY = guiGetScreenSize()

function createMarkers()
	for k, v in ipairs(xmlNodeGetChildren(xmlLoadFile("banks.xml"))) do
		local marker = createMarker(xmlNodeGetAttribute(v,"posX"),xmlNodeGetAttribute(v,"posY"),xmlNodeGetAttribute(v,"posZ"),"cylinder")
		setElementInterior(marker,xmlNodeGetAttribute(v,"interior"))
		setElementDimension(marker,xmlNodeGetAttribute(v,"dimension"))
		setElementData(marker,"bankMarker",true)
	end
end

function bankBlips()
	createBlip(1571.0947265625,-1336.884765625,16.484375,52)
end

function bankGUI()
	createMarkers()
	bankBlips()
	bankWindow = guiCreateWindow(0.4,0.4,0.2,0.2,"SANL Bank",true)
	guiSetVisible(bankWindow,false)
  guiWindowSetMovable(bankWindow,false)
  guiWindowSetSizable(bankWindow,false)
  bankTotal = guiCreateEdit(0.4,0.15,0.8,0.15,"No Money",true,bankWindow)
  totalLabel = guiCreateLabel(0.09,0.18,0.26,0.15,"Bank Total:",true,bankWindow)
  guiEditSetReadOnly(bankTotal,true)
  radioDeposit = guiCreateRadioButton(0.4,0.3,0.35,0.1,"Deposit",true,bankWindow)
  radioWithdrawal = guiCreateRadioButton(0.4,0.4,0.35,0.1,"Withdrawal",true,bankWindow)
  bankDelta = guiCreateEdit(0.4,0.5,0.8,0.15,"",true,bankWindow)
  amountLabel = guiCreateLabel(0.09,0.52,0.26,0.15,"Amount:",true,bankWindow)
  confirmButton = guiCreateButton(0.4,0.7,0.2,0.2,"Submit",true,bankWindow)
  closeButton = guiCreateButton(0.7,0.7,0.2,0.2,"Close",true,bankWindow)
  addEventHandler("onClientGUIClick",confirmButton,updateBalance,false)
  addEventHandler("onClientGUIClick",closeButton,closeGUI,false)
end
addEventHandler("onClientResourceStart",getResourceRootElement(),bankGUI)

function showBank(hitElement)
	if (hitElement == getLocalPlayer()) then
		if (getElementData(source,"bankMarker") == true) then
			guiSetVisible(bankWindow,true)
			showCursor(true)
			triggerServerEvent("getBalance",getLocalPlayer())
		end
	end
end
addEventHandler("onClientMarkerHit",getRootElement(),showBank)

function updateBalance()
	isMakingWithdrawal = guiRadioButtonGetSelected(radioWithdrawal)
	isMakingDeposit = guiRadioButtonGetSelected(radioDeposit)
		if (isMakingWithdrawal == true) then
			if (guiGetText(bankDelta) ~= "" and guiGetText(bankDelta) ~= "Enter Ammount") then
				if (tonumber(guiGetText(bankTotal)) >= tonumber(guiGetText(bankDelta)) and tonumber(guiGetText(bankDelta)) > 0) then
					triggerServerEvent("removeFromBalance",getLocalPlayer(),0-tonumber(guiGetText(bankDelta)))
				end
			end
		end
		if (isMakingDeposit == true) then
			if (guiGetText(bankDelta) ~= "" and guiGetText(bankDelta) ~= "Enter Ammount") then
				if (tonumber(getPlayerMoney(getLocalPlayer())) >= tonumber(guiGetText(bankDelta)) and tonumber(guiGetText(bankDelta)) > 0 ) then
					triggerServerEvent("addToBalance",getLocalPlayer(),0+tonumber(guiGetText(bankDelta)))
				end
			end
		end
end

function closeGUI()
	guiSetVisible(bankWindow,false)
	showCursor(false)
end

function recieveBalance(ammount)
	guiSetText(bankTotal,ammount)
end
addEvent("recieveBalance",true)
addEventHandler("recieveBalance",getRootElement(),recieveBalance)