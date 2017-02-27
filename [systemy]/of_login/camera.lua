local sm = {}
sm.moov = 0
sm.object1,sm.object2 = nil,nil
 
local function removeCamHandler()
	if(sm.moov == 1)then
		sm.moov = 0
	end
end
 
local function camRender()
	if (sm.moov == 1) then
		local x1,y1,z1 = getElementPosition(sm.object1)
		local x2,y2,z2 = getElementPosition(sm.object2)
		setCameraMatrix(x1,y1,z1,x2,y2,z2)
	end
end
addEventHandler("onClientPreRender",root,camRender)
 
function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
	if(sm.moov == 1)then return false end
	sm.object1 = createObject(1337,x1,y1,z1)
	sm.object2 = createObject(1337,x1t,y1t,z1t)
	setElementAlpha(sm.object1,0)
	setElementAlpha(sm.object2,0)
	setObjectScale(sm.object1,0.01)
	setObjectScale(sm.object2,0.01)
	moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
	moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
	sm.moov = 1
	setTimer(removeCamHandler,time,1)
	setTimer(destroyElement,time,1,sm.object1)
	setTimer(destroyElement,time,1,sm.object2)
	return true
end

function moveCamera(int)
	if int == 1 then
	smoothMoveCamera(-1966.7219238281, 42.170188903809, 39.300094604492, -2010.9665527344, 131.69692993164, 34.067485809326, -2057.005859375, 253.86566162109, 45.795925140381, -2007.3551025391, 167.6322479248, 35.865818023682, 30*1000)
	timer1 = setTimer(moveCamera, 30*1000, 1, 2)
	elseif int == 2 then
	smoothMoveCamera(-1485.5178222656, 664.84558105469, 17.27965927124, -1513.1407470703, 760.54290771484, 8.3919019699097, -1546.0892333984, 1014.0120239258, 18.97730255127, -1523.2436523438, 918.37677001953, 0.75714927911758, 30*1000)
	timer2 = setTimer(moveCamera, 30*1000, 1, 3)
	elseif int == 3 then
	smoothMoveCamera(-1720.4143066406, 491.91058349609, 56.672801971436, -1652.0961914063, 563.85229492188, 44.141830444336, -1191.3510742188, 1045.0765380859, 60.324314117432, -1260.8294677734, 973.34533691406, 55.091705322266, 30*1000)
	timer3 = setTimer(moveCamera, 30*1000, 1, 1)
	elseif int == 0 then
	removeCamHandler()
	if isTimer(timer1) then killTimer(timer1) end
	if isTimer(timer2) then killTimer(timer2) end
	if isTimer(timer3) then killTimer(timer3) end
	elseif int == 4 then
	smoothMoveCamera(315.94, 1614.08, 85.45,518.23, 1355.96, 70.25,518.23, 1355.96, 70.25,67.93, 1130.85, 56.48, 15*1000)
	elseif int == 5 then
	smoothMoveCamera(-939.48, 1739.18, 69.77,-866.71, 1624.71, 48.06,-866.71, 1624.71, 48.06,-808.66, 1568.20, 51.59, 15*1000)
	elseif int == 6 then
	smoothMoveCamera(-1193.81, 2695.33, 54.07,-1270.40, 2672.26, 61.42,-1270.40, 2672.26, 61.42,-1361.64, 2644.07, 75.95, 15*1000)
	end
end