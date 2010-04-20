function getBalance()
	triggerClientEvent(source,"recieveBalance",source,getAccountData(getPlayerAccount(source),"money"))
end
addEvent("getBalance",true)
addEventHandler("getBalance",getRootElement(),getBalance)

function removeFromBalance(ammount)
	setAccountData(getPlayerAccount(source),"money",getAccountData(getPlayerAccount(source),"money")+tonumber(ammount))
	givePlayerMoney(source,0-ammount)
	getBalance()
end
addEvent("removeFromBalance",true)
addEventHandler("removeFromBalance",getRootElement(),removeFromBalance)

function addToBalance(ammount)
	setAccountData(getPlayerAccount(source),"money",getAccountData(getPlayerAccount(source),"money")+tonumber(ammount))
	takePlayerMoney(source,0+ammount)
	getBalance()
end
addEvent("addToBalance",true)
addEventHandler("addToBalance",getRootElement(),addToBalance)

function getPlayerBalance(thePlayer)
	return getAccountData(getPlayerAccount(thePlayer),"money")
end