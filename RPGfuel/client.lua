resX,resY = guiGetScreenSize()
function createGauge()
	bar = guiCreateProgressBar(resX/2,resY/2,resX/5,resY/5,false)
	guiProgressBarSetProgress(bar,0)
end
addEventHandler("onClientResourceStart",getResourceRootElement(),createGauge)

function updateGauge(progress)
	if (guiGetVisible(bar) == false) then
		guiSetVisible(bar,true)
	end
	guiProgressBarSetProgress(bar,progress)
end
addEvent("updateGauge",true)
addEventHandler("updateGauge",getRootElement(),updateGauge)

function hideGauge()
	guiSetVisible(bar,false)
end
addEvent("hideGauge",true)
addEventHandler("hideGauge",getRootElement(),hideGauge)