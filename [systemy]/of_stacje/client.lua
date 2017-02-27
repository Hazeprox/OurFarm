

local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
	if getElementData(localPlayer,"gui") == true then
        dxDrawImage(screenW * 0.1896, screenH * 0.0938, screenW * 0.6186, screenH * 0.7357, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("STACJA BENZYNOWA", screenW * 0.2628, screenH * 0.1914, screenW * 0.7438, screenH * 0.2422, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "bottom", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.2848, screenH * 0.2799, screenW * 0.4305*getElementData(getPedOccupiedVehicle(localPlayer), "paliwo")/60, screenH * 0.0443, tocolor(50, 250, 4, 255), false)
        dxDrawText(math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "paliwo")).."l", screenW * 0.2840, screenH * 0.2799, screenW * 0.7152, screenH * 0.3242, tocolor(255, 255, 255, 255), 1.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("CENA ZA LITR 4$", screenW * 0.2848, screenH * 0.3242, screenW * 0.7255, screenH * 0.3919, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.4129, screenH * 0.5247, screenW * 0.1669, screenH * 0.0625, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("SPACJA", screenW * 0.4136, screenH * 0.5234, screenW * 0.5798, screenH * 0.5872, tocolor(255, 255, 255, 255), 1.70, "bankgothic", "center", "center", false, false, false, false, false)
    end
	end
)
