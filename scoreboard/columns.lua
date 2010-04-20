function addColumns()
	exports.scoreboard:addScoreboardColumn("wanted")
	exports.scoreboard:addScoreboardColumn("money")
	setTimer(data,1000,0)
end
addEventHandler("onResourceStart",getResourceRootElement(),addColumns)

function data()
	for k, v in ipairs (getElementsByType("player")) do
		setElementData(v,"money","$"..getPlayerMoney(v))
	end
end