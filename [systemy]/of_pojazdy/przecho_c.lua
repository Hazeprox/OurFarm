
        odbierz = guiCreateLabel(0.32, 0.68, 0.13, 0.08, "", true)
        wyjdz = guiCreateLabel(0.55, 0.67, 0.13, 0.08, "", true)


        gridlist = guiCreateGridList(0.31, 0.31, 0.38, 0.31, true)
        autoc = guiGridListAddColumn(gridlist, "AUTO", 0.5)
        idc = guiGridListAddColumn(gridlist, "ID", 0.5)   
		guiSetVisible(odbierz,false)
		guiSetVisible(wyjdz,false)
		guiSetVisible(gridlist,false)
		
		local marker = createMarker(1514.10, -1493.87, 13.56-1,"cylinder",1,255,255,255,50)
		local marker2 = createMarker( 1519.16, -1498.94, 13.56-1,"cylinder",3,255,255,0,50)
		local screenW, screenH = guiGetScreenSize()
		przecho = false
		
addEventHandler("onClientRender", root,
    function()
	if przecho == true then
        dxDrawImage(screenW * 0.2387, screenH * 0.1510, screenW * 0.5234, screenH * 0.6979, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.3177, screenH * 0.6784, screenW * 0.1340, screenH * 0.0677, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5490, screenH * 0.6784, screenW * 0.1340, screenH * 0.0677, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("PRZECHOWALNIA", screenW * 0.2980, screenH * 0.2435, screenW * 0.7042, screenH * 0.2956, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("ODBIERZ", screenW * 0.3177, screenH * 0.6810, screenW * 0.4488, screenH * 0.7396, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("WYJDZ", screenW * 0.5490, screenH * 0.6784, screenW * 0.6801, screenH * 0.7370, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
    end
	end
)
addEventHandler("onClientMarkerHit",marker,function(he,md)
		if he == localPlayer then
			przecho = true
			guiSetVisible(odbierz,true)
			guiSetVisible(wyjdz,true)
			guiSetVisible(gridlist,true)
			showCursor(true)
			guiGridListClear(gridlist)
			triggerServerEvent("addPrzecho", he)
			
		end
end)
addEventHandler("onClientMarkerHit",marker2,function(he,md)
	if getPedOccupiedVehicle(he) then
		setElementData(getPedOccupiedVehicle(he), "przecho", "true")
		triggerServerEvent("addVehPrzecho", localPlayer, getElementData(getPedOccupiedVehicle(he), "id"))
	end
end)
addEventHandler("onClientGUIClick", root,function()
	if source == wyjdz then
		guiSetVisible(odbierz,false)
		guiSetVisible(wyjdz,false)
		guiSetVisible(gridlist,false)		
		przecho = false
		showCursor(false)
	elseif source == odbierz then
			if guiGridListGetSelectedItem(gridlist) then
				local row, _ = guiGridListGetSelectedItem (gridlist)
				local id = guiGridListGetItemText(gridlist, row, 2)
				local pojazd = guiGridListGetItemText(gridlist, row, 1)
				if id and pojazd then
					triggerServerEvent("removePrzecho", localPlayer,id)
					guiSetVisible(odbierz,false)
					guiSetVisible(wyjdz,false)
					guiSetVisible(gridlist,false)		
					przecho = false
					showCursor(false)
				end
			end
	end
end)
addEvent("insertInfo",true)
function insertPojazd(nazwa, id)
    local row = guiGridListAddRow(gridlist)
    guiGridListSetItemText ( gridlist, row, autoc, nazwa, false, false )
	guiGridListSetItemText ( gridlist, row, idc, id, false, false )
end
addEventHandler("insertInfo",root,insertPojazd)

local tekst1 = createElement("3dtext")
setElementData(tekst1, "3dtext_xyz", {1514.02, -1493.90, 13.56})
setElementData(tekst1, "3dtext_odleglosc", 10)
setElementData(tekst1, "3dtext_tresc", "PRZECHOWALNIA")
setElementData(tekst1, "3dtext_kolory", {255, 255, 255})