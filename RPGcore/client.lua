local resX,resY = guiGetScreenSize()
function login()
	local window = guiCreateWindow(resX/2-150,resY/2-100,300,200,"SANL:RPG Login",false)
end
addEventHandler("onClientResourceStart",getResourceRootElement(),login)