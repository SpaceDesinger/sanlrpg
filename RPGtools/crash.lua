local c_root = getRootElement()
local c_player = getLocalPlayer()
local c_lastspeed = 0
local c_speed = 0
local isplayernotjumpaway = true

function getActualVelocity( element, x, y, z )
	return (x^2 + y^2 + z^2) ^ 0.5
end

function updateDamage()	
	c_veh = getPlayerOccupiedVehicle( c_player )
        c_speed = getActualVelocity( c_veh, getElementVelocity( c_veh ) )
	print(c_speed)
	if c_lastspeed - c_speed >= 0.25 then
		c_lasthealth = getElementHealth(c_player)
		setElementHealth(c_player , c_lasthealth - 40*(c_lastspeed))		
	end	
	c_lastspeed = c_speed

end

function onJumpOut()
	isplayernotjumpaway = false
end

function onJumpFinished()

	isplayernotjumpaway = true
end

addEventHandler( "onClientVehicleStartExit", c_root,onJumpOut)
addEventHandler( "onClientVehicleExit", c_root,onJumpFinished)
addEventHandler( "onClientRender", c_root,function  ( )
	if isplayernotjumpaway and isPlayerInVehicle(c_player) then
		updateDamage()
	else
		c_speed = 0
		c_lastspeed = 0
	end
end
)