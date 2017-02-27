stacje={
	{-1523.37, 2672.91, 55.31},
	{691.91, -1160.18, 15.10},
	{-92.94, -1174.82, 2.03},
	{-88.19, -1163.62, 2.02},
}

	gui = false
	stacja = nil
	for k,v in pairs(stacje) do
		stacja = createMarker(v[1],v[2],v[3]-1, "cylinder", 2,0,255,0,255)

	end
	
	function bind(plr)
		if getPlayerMoney(plr) >= 4 then
			if getPedOccupiedVehicle(plr) then
				if getElementData(getPedOccupiedVehicle(plr), "paliwo") < 60 then
					takePlayerMoney(plr, 4)
					setElementData(getPedOccupiedVehicle(plr), "paliwo",getElementData(getPedOccupiedVehicle(plr), "paliwo")+1)
				end
			end
		end		
	end
	function stacjaf(he,md)
		if getElementType(he) == "player" then
			if getPedOccupiedVehicle(he) and getVehicleController(getPedOccupiedVehicle(he)) == he then
				gui = true
				setElementData(he, "gui", gui)
				bindKey(he,"space","up",bind,he)
			end
		end
	end
	addEventHandler("onMarkerHit",stacja,stacjaf)
	
	
	function stacjafl(he,md)
		if getElementType(he) == "player" then
			if getPedOccupiedVehicle(he) then
				gui = false
				setElementData(he, "gui", gui)
				unbindKey(he,"space","up",bind)
			end
		end
	end
	addEventHandler("onMarkerLeave",stacja,stacjafl)

	

	
