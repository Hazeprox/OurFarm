
klik = guiCreateLabel(0.41, 0.36, 0.21, 0.08, "", true)    
guiSetVisible(klik,false)
local screenW, screenH = guiGetScreenSize()
prawko = false
marker = createMarker(1134.42, -2037.93, 69.01,"cylinder",1)
addEventHandler("onClientRender", root,
    function()
		if prawko == true then
			dxDrawImage(screenW * 0.2760, screenH * 0.0326, screenW * 0.4788, screenH * 0.8711, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("PRAWO JAZDY KAT B", screenW * 0.3280, screenH * 0.1484, screenW * 0.7028, screenH * 0.2122, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("ABY ZDAC PRAWO JAZDY KLIKNIJ \/", screenW * 0.3324, screenH * 0.2813, screenW * 0.7072, screenH * 0.3451, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawImage(screenW * 0.4078, screenH * 0.3581, screenW * 0.2116, screenH * 0.0807, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
)
local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
			if getPedOccupiedVehicle(localPlayer) then
				dxDrawText("PRZEBIEG:"..getElementData(getPedOccupiedVehicle(localPlayer), "przebieg").. "PALIWO: "..(getElementData(getPedOccupiedVehicle(localPlayer), "paliwo")), screenW * 0.2811, screenH * 0.0208, screenW * 0.6881, screenH * 0.0534, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, false, false, false)
			end
	end
)
addEventHandler("onClientMarkerHit",marker,function(he)
	if he == localPlayer then
		if getElementData(localPlayer, "prawko") ~= true and prawko == false then
			guiSetVisible(klik,true)
			prawko = true
			showCursor(true,false)
		end
	end
end)
addEventHandler("onClientMarkerLeave",marker,function(he)
	if he == localPlayer then
		if getElementData(localPlayer, "prawko") ~= true and prawko == true then
			guiSetVisible(klik,false)
			prawko = false
			showCursor(false,false)
		end
	end
end)
addEventHandler("onClientGUIClick",klik,function()
	guiSetVisible(klik,false)
	prawko = false
	showCursor(false,false)
	triggerServerEvent("startPrawko", localPlayer)
end)
addEvent("delet",true)
addEventHandler("delet", root,function()
triggerServerEvent("endPrawko", localPlayer)
end)


