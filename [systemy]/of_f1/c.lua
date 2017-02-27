
        info = guiCreateLabel(0.26, 0.18, 0.09, 0.08, "", true)
        poradnik = guiCreateLabel(0.36, 0.17, 0.12, 0.08, "", true)
        komendy = guiCreateLabel(0.49, 0.17, 0.12, 0.08, "", true)
        aktualizacje = guiCreateLabel(0.63, 0.17, 0.14, 0.08, "", true)    
		guiSetVisible(info, false)
		guiSetVisible(poradnik, false)
		guiSetVisible(komendy, false)
		guiSetVisible(aktualizacje, false)
		local screenW, screenH = guiGetScreenSize()
		panel = false
		start = true
		text = false
		
addEventHandler("onClientRender", root,
    function()
	if panel == true then
        dxDrawRectangle(screenW * 0.2577, screenH * 0.2422, screenW * 0.5124, screenH * 0.5026, tocolor(0, 0, 0, 200), false)
        dxDrawRectangle(screenW * 0.2577, screenH * 0.1745, screenW * 0.5124, screenH * 0.0677, tocolor(128, 199, 35, 255), true)
        dxDrawRectangle(screenW * 0.3529, screenH * 0.1745, screenW * 0.0059, screenH * 0.0677, tocolor(255, 255, 255, 255), true)
        dxDrawText("INFO", screenW * 0.2482, screenH * 0.1745, screenW * 0.3704, screenH * 0.2422, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
        dxDrawText("PORADNIK", screenW * 0.3631, screenH * 0.1745, screenW * 0.4854, screenH * 0.2422, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
        dxDrawRectangle(screenW * 0.4868, screenH * 0.1745, screenW * 0.0059, screenH * 0.0677, tocolor(255, 255, 255, 255), true)
        dxDrawText("KOMENDY", screenW * 0.4941, screenH * 0.1745, screenW * 0.6164, screenH * 0.2422, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
        dxDrawRectangle(screenW * 0.6179, screenH * 0.1745, screenW * 0.0059, screenH * 0.0677, tocolor(255, 255, 255, 255), true)
        dxDrawText("AKTUALIZACJE", screenW * 0.6369, screenH * 0.1745, screenW * 0.7592, screenH * 0.2422, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
		if start == true then
			dxDrawImage(screenW * 0.2365, screenH * 0.2135, screenW * 0.5908, screenH * 0.4818, ":of_login/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
		if text ~= false then
			dxDrawText(text, screenW * 0.2657, screenH * 0.2552, screenW * 0.7606, screenH * 0.7109, tocolor(255, 255, 255, 255), 1.15, "default", "left", "top", false, false, false, false, false)
		end
	end
	end
)
bindKey("F1", "up",function()
	if panel == true then
		showCursor(false)
		panel = false
		guiSetVisible(info, false)
		guiSetVisible(poradnik, false)
		guiSetVisible(komendy, false)
		guiSetVisible(aktualizacje, false)
	else
		showCursor(true)
		panel = true
		start = true
		text = false
		guiSetVisible(info, true)
		guiSetVisible(poradnik, true)
		guiSetVisible(komendy, true)
		guiSetVisible(aktualizacje, true)
	end
end)

addEventHandler("onClientGUIClick",root,function()
	if source == info then
		start = false
		text = "Info Text"
	elseif source == poradnik then
		start = false
		text = "Poradnik Text"
	elseif source == komendy then
		start = false
		text = "Komendy Text"
	elseif source == aktualizacje then
		start = false
		text = "Aktualizacje Text"		

	end
end)