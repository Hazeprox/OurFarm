
        kup = guiCreateLabel(0.55, 0.38, 0.11, 0.05, "", true)
        guiLabelSetHorizontalAlign(kup, "center", false)
        guiLabelSetVerticalAlign(kup, "center")


        zobacz = guiCreateLabel(0.55, 0.46, 0.11, 0.05, "", true)
        guiLabelSetHorizontalAlign(zobacz, "center", false)
        guiLabelSetVerticalAlign(zobacz, "center")


        wyjdz = guiCreateLabel(0.55, 0.65, 0.11, 0.05, "", true)
        guiLabelSetHorizontalAlign(wyjdz, "center", false)
        guiLabelSetVerticalAlign(wyjdz, "center")


        gridlist = guiCreateGridList(0.32, 0.32, 0.18, 0.42, true)
		columns = guiGridListAddColumn(gridlist, "SAMOCHODY", 0.5)
        columnc = guiGridListAddColumn(gridlist, "KOSZT", 0.4)    

		guiSetVisible(kup, false)
		guiSetVisible(gridlist, false)
		guiSetVisible(wyjdz, false)
		guiSetVisible(zobacz, false)
		salon = false
		wybierz = false
local screenW, screenH = guiGetScreenSize()

marker = createMarker(1849.14, -1773.54, 13.56-1, "cylinder",1)
createBlip(1849.14, -1773.54, 13.56,55)

addEventHandler("onClientRender", root,
    function()
	if salon == true then
        dxDrawImage(screenW * 0.2526, screenH * 0.1823, screenW * 0.4956, screenH * 0.6367, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5512, screenH * 0.3789, screenW * 0.1120, screenH * 0.0521, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5512, screenH * 0.4596, screenW * 0.1120, screenH * 0.0521, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5512, screenH * 0.6497, screenW * 0.1120, screenH * 0.0521, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("KUP", screenW * 0.5520, screenH * 0.3802, screenW * 0.6633, screenH * 0.4310, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ZOBACZ", screenW * 0.5512, screenH * 0.4609, screenW * 0.6625, screenH * 0.5117, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("WYJDZ", screenW * 0.5505, screenH * 0.6510, screenW * 0.6618, screenH * 0.7018, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("SALON SAMOCHODOWY", screenW * 0.3067, screenH * 0.2721, screenW * 0.6947, screenH * 0.3151, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
	end
    end
)


local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
		if wybierz == true then
			dxDrawText("KLIKNIJ ENTER ZEBY WYJSC ALBO SPACJE ABY PRZETESTOWAC POJAZD", (screenW * 0.1896) - 1, (screenH * 0.1745) - 1, (screenW * 0.9195) - 1, (screenH * 0.3047) - 1, tocolor(0, 0, 0, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("KLIKNIJ ENTER ZEBY WYJSC ALBO SPACJE ABY PRZETESTOWAC POJAZD", (screenW * 0.1896) + 1, (screenH * 0.1745) - 1, (screenW * 0.9195) + 1, (screenH * 0.3047) - 1, tocolor(0, 0, 0, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("KLIKNIJ ENTER ZEBY WYJSC ALBO SPACJE ABY PRZETESTOWAC POJAZD", (screenW * 0.1896) - 1, (screenH * 0.1745) + 1, (screenW * 0.9195) - 1, (screenH * 0.3047) + 1, tocolor(0, 0, 0, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("KLIKNIJ ENTER ZEBY WYJSC ALBO SPACJE ABY PRZETESTOWAC POJAZD", (screenW * 0.1896) + 1, (screenH * 0.1745) + 1, (screenW * 0.9195) + 1, (screenH * 0.3047) + 1, tocolor(0, 0, 0, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("KLIKNIJ ENTER ZEBY WYJSC ALBO SPACJE ABY PRZETESTOWAC POJAZD", screenW * 0.1896, screenH * 0.1745, screenW * 0.9195, screenH * 0.3047, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
		end
	end
)


addEventHandler("onClientMarkerHit",root,function(plr,md)
	if plr == localPlayer then
		if source == marker then
			guiSetVisible(kup, true)
			guiSetVisible(gridlist, true)
			guiSetVisible(wyjdz, true)
			guiSetVisible(zobacz, true)
			salon = true
			showCursor(true)
		end
	end
end)


local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
	if czas then
        dxDrawText("CZAS:"..(czas).."S", screenW * 0.1406, screenH * -0.0378, screenW * 0.8704, screenH * 0.0924, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("CZAS:"..(czas).."S", screenW * 0.1406, screenH * -0.0365, screenW * 0.8704, screenH * 0.0938, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
    end
	end
)
addEvent("insertCzas", true)
addEventHandler("insertCzas", root,function(int)
czas = int
end)

pojazdy={
     {478, 550}, 
     {466, 700},
     {543, 700},
     {410, 630},
     {479, 1600},
     {467, 1400},
     {546, 1900},
     {516, 2900},
     {458, 3500},
     {549, 3550},
     {547, 4000},
     {426, 8000},
     {492, 9900},
     {518, 12000},
     {542, 14200},
    }
	for k,v in pairs(pojazdy) do
	    local row = guiGridListAddRow ( gridlist )
        guiGridListSetItemText ( gridlist, row, columns, getVehicleNameFromID(v[1]), false, false )
		guiGridListSetItemText ( gridlist, row, columnc, v[2], false, false )
	end
addEventHandler("onClientGUIClick",root,function()
		if source == wyjdz then
			guiSetVisible(kup, false)
			guiSetVisible(gridlist, false)
			guiSetVisible(wyjdz, false)
			guiSetVisible(zobacz, false)
			salon = false
			showCursor(false)
		elseif source == kup then
			if guiGridListGetSelectedItem (gridlist) then
				local row, _ = guiGridListGetSelectedItem (gridlist)
				local cena = guiGridListGetItemText(gridlist, row, 2)
				local pojazd = guiGridListGetItemText(gridlist, row, 1)
				if cena and pojazd then
				
					triggerServerEvent("buyVeh",localPlayer,getVehicleIDFromName(pojazd),cena)
				
				end
			end
		elseif source == zobacz then
			if guiGridListGetSelectedItem (gridlist) then
			local row, _ = guiGridListGetSelectedItem (gridlist)
			local asd = guiGridListGetItemText(gridlist, row, 1)
				tym = createVehicle(getVehicleIDFromName(asd), 1839.96, -1795.79, 13.56, 0.1, 360.0, 40.7)
				if tym then
					setCameraMatrix(1847.56, -1796.18, 13.56, 1839.96, -1795.79, 13.56)
					guiSetVisible(kup, false)
					guiSetVisible(gridlist, false)
					guiSetVisible(wyjdz, false)
					guiSetVisible(zobacz, false)
					salon = false
					showCursor(false)
					wybierz = true
					function anuluj()
						unbindKey("space","up",space)
						unbindKey("enter","up",anuluj)
						setCameraTarget(localPlayer)
						guiSetVisible(kup, true)
						guiSetVisible(gridlist, true)
						guiSetVisible(wyjdz, true)
						guiSetVisible(zobacz, true)
						salon = true
						showCursor(true)
						destroyElement(tym)
						wybierz = false
					end
					bindKey("enter","up",anuluj)
					function space()
						unbindKey("space","up",space)
						unbindKey("enter","up",anuluj)
						setCameraTarget(localPlayer)
						salon = false
						wybierz = false
						showCursor(false)
						triggerServerEvent("startTest",localPlayer,getVehicleID(tym))
						destroyElement(tym)
						wybierz = false
						czas = 300
						timer = setTimer(function()
						if czas == 1 then 
							czas = false
							triggerServerEvent("stopTest",localPlayer)
						else
						czas = czas - 1
						end
						end,1000,0)
						addEvent("deleteTimers",true)
						addEventHandler("deleteTimers",root,function()
							killTimer(timer)
							czas = false
						end)
					end
					bindKey("space","up",space)
				end
			end
		end
end)
addEvent("salonDel",true)
addEventHandler("salonDel",root,function()
	guiSetVisible(kup, false)
	guiSetVisible(gridlist, false)
	guiSetVisible(wyjdz, false)
	guiSetVisible(zobacz, false)
	salon = false
	showCursor(false)

end)

local czas = getTickCount()

isBike = {
    [509]=true, --Bike
    [481]=true, --BMX
    [510]=true, --Mountain bike
}

local lu=getTickCount()

local function naliczPrzebieg(veh)
    local przebieg=getElementData(veh,"przebieg") or 0
    if (getTickCount()-lu>250) then
    lu=getTickCount()
    local vx,vy,vz=getElementVelocity(veh)
    local spd=((vx^2 + vy^2 + vz^2)^(0.5)/10)
    if (spd>0) then
        przebieg=przebieg+(spd)/3
        setElementData(veh, "przebieg", przebieg)
    end
    end
end

function updatePrzebieg()
    local v=getPedOccupiedVehicle(localPlayer)
    if (not v) then return end
    if (not getVehicleEngineState(v)) then return end
    if (getVehicleController(v)~=localPlayer) then return end
    naliczPrzebieg(v)
end

addEventHandler("onClientRender", root, updatePrzebieg)   



local czas = getTickCount()

isBike = {
    [509]=true, --Bike
    [481]=true, --BMX
    [510]=true, --Mountain bike
}

function odejmijPaliwo(pojazd)
    if getTickCount() - czas > 150 then
        czas = getTickCount()
        local paliwo = getElementData(pojazd, "paliwo") or 0
        local vx,vy,vz = getElementVelocity(pojazd)
        local spd = ((vx^2+vy^2+vz^2)^(0.5)/50)
        if spd > 0 then
            paliwo = paliwo-spd
            setElementData(pojazd, "paliwo", paliwo)
        end
    end
end

addEventHandler("onClientRender", root, function()
    local pojazd = getPedOccupiedVehicle(localPlayer)
    if not pojazd then return end
    if isBike[getElementModel(pojazd)] then return end
    if not getVehicleEngineState(pojazd) then return end
    if getVehicleController(pojazd) ~= localPlayer then return end
    odejmijPaliwo(pojazd)
end)

addCommandHandler("asdd",function()
setElementData(getPedOccupiedVehicle(localPlayer),"paliwo",60)

end)