
		edit = {}
		label = {}
        label.login = guiCreateLabel(0.35, 0.58, 0.10, 0.06, "", true)
        label.rejestruj = guiCreateLabel(0.55, 0.58, 0.10, 0.06, "", true)
        edit.login = guiCreateEdit(0.46, 0.45, 0.11, 0.04, "", true)
        edit.haslo = guiCreateEdit(0.46, 0.50, 0.11, 0.04, "", true)   
		login = true
		local screenW, screenH = guiGetScreenSize()
		start = getTickCount()	
		setTimer(function()
			moveCamera(1)
		end, 1000,1)
			showPlayerHudComponent ("radar", false)
			showChat(false)
			showCursor(true)	
			fadeCamera(true)

addEventHandler("onClientRender", root,
    function()
	if login == true then
		local now = getTickCount()
		local endTime = start + 4000
		local elapsedTime = now - start
		local duration = endTime - start
		local progress = elapsedTime / duration
		local a,_,_ = interpolateBetween( 0, 0, 0, 255, 0, 0, progress, "Linear")
		local a2,_,_ = interpolateBetween( 0, 0, 0, 150, 0, 0, progress, "Linear")
        dxDrawRectangle(screenW * 0.3097, screenH * 0.2448, screenW * 0.3873, screenH * 0.4128, tocolor(0, 0, 0, a2), false)
        dxDrawImage(screenW * 0.3097, screenH * 0.2448, screenW * 0.3807, screenH * 0.2018, "logo.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
        dxDrawImage(screenW * 0.3097, screenH * 0.4701, screenW * 0.1925, screenH * 0.2760, "logb.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
        dxDrawText("Login", (screenW * 0.3206) - 1, (screenH * 0.4466) - 1, (screenW * 0.4649) - 1, (screenH * 0.5026) - 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Login", (screenW * 0.3206) + 1, (screenH * 0.4466) - 1, (screenW * 0.4649) + 1, (screenH * 0.5026) - 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Login", (screenW * 0.3206) - 1, (screenH * 0.4466) + 1, (screenW * 0.4649) - 1, (screenH * 0.5026) + 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Login", (screenW * 0.3206) + 1, (screenH * 0.4466) + 1, (screenW * 0.4649) + 1, (screenH * 0.5026) + 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Login", screenW * 0.3206, screenH * 0.4466, screenW * 0.4649, screenH * 0.5026, tocolor(15, 130, 6, a2), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Haslo", (screenW * 0.3206) - 1, (screenH * 0.5026) - 1, (screenW * 0.4649) - 1, (screenH * 0.5586) - 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Haslo", (screenW * 0.3206) + 1, (screenH * 0.5026) - 1, (screenW * 0.4649) + 1, (screenH * 0.5586) - 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Haslo", (screenW * 0.3206) - 1, (screenH * 0.5026) + 1, (screenW * 0.4649) - 1, (screenH * 0.5586) + 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Haslo", (screenW * 0.3206) + 1, (screenH * 0.5026) + 1, (screenW * 0.4649) + 1, (screenH * 0.5586) + 1, tocolor(6, 53, 2, a), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawText("Haslo", screenW * 0.3206, screenH * 0.5026, screenW * 0.4649, screenH * 0.5586, tocolor(15, 130, 6, a2), 2.00, "sans", "center", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.5007, screenH * 0.4701, screenW * 0.1962, screenH * 0.2760, "zarb.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
	elseif login == "spawn" then
	    dxDrawImage(screenW * 0.0073, screenH * 0.4362, screenW * 0.1142, screenH * 0.1576, "lewo.png", 0, 0, 0, tocolor(143, 175, 73, 255), false)
        dxDrawImage(screenW * 0.8807, screenH * 0.4401, screenW * 0.1120, screenH * 0.1576, "prawo.png", 0, 0, 0, tocolor(143, 175, 73, 255), false)
        dxDrawImage(screenW * 0.8463, screenH * 0.6706, screenW * 0.1464, screenH * 0.2305, "enter.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(spawn, (screenW * 0.2408) - 1, (screenH * 0.0078) - 1, (screenW * 0.7606) - 1, (screenH * 0.1732) - 1, tocolor(255, 255, 255, 255), 2.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(spawn, (screenW * 0.2408) + 1, (screenH * 0.0078) - 1, (screenW * 0.7606) + 1, (screenH * 0.1732) - 1, tocolor(255, 255, 255, 255), 2.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(spawn, (screenW * 0.2408) - 1, (screenH * 0.0078) + 1, (screenW * 0.7606) - 1, (screenH * 0.1732) + 1, tocolor(255, 255, 255, 255), 2.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(spawn, (screenW * 0.2408) + 1, (screenH * 0.0078) + 1, (screenW * 0.7606) + 1, (screenH * 0.1732) + 1, tocolor(255, 255, 255, 255), 2.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText(spawn, screenW * 0.2408, screenH * 0.0078, screenW * 0.7606, screenH * 0.1732, tocolor(143, 175, 73, 255), 2.50, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("< WYBÓR SPAWNU >", (screenW * 0.2408) - 1, (screenH * -0.0534) - 1, (screenW * 0.7606) - 1, (screenH * 0.1120) - 1, tocolor(0, 0, 0, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("< WYBÓR SPAWNU >", (screenW * 0.2408) + 1, (screenH * -0.0534) - 1, (screenW * 0.7606) + 1, (screenH * 0.1120) - 1, tocolor(0, 0, 0, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("< WYBÓR SPAWNU >", (screenW * 0.2408) - 1, (screenH * -0.0534) + 1, (screenW * 0.7606) - 1, (screenH * 0.1120) + 1, tocolor(0, 0, 0, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("< WYBÓR SPAWNU >", (screenW * 0.2408) + 1, (screenH * -0.0534) + 1, (screenW * 0.7606) + 1, (screenH * 0.1120) + 1, tocolor(0, 0, 0, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("< WYBÓR SPAWNU >", screenW * 0.2408, screenH * -0.0547, screenW * 0.7606, screenH * 0.1107, tocolor(143, 175, 73, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY ZATWIERDZIC SPAWN KLIKNIJ ENTER", (screenW * 0.2753) - 1, (screenH * 0.7357) - 1, (screenW * 0.7950) - 1, (screenH * 0.9010) - 1, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY ZATWIERDZIC SPAWN KLIKNIJ ENTER", (screenW * 0.2753) + 1, (screenH * 0.7357) - 1, (screenW * 0.7950) + 1, (screenH * 0.9010) - 1, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY ZATWIERDZIC SPAWN KLIKNIJ ENTER", (screenW * 0.2753) - 1, (screenH * 0.7357) + 1, (screenW * 0.7950) - 1, (screenH * 0.9010) + 1, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY ZATWIERDZIC SPAWN KLIKNIJ ENTER", (screenW * 0.2753) + 1, (screenH * 0.7357) + 1, (screenW * 0.7950) + 1, (screenH * 0.9010) + 1, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY ZATWIERDZIC SPAWN KLIKNIJ ENTER", screenW * 0.2753, screenH * 0.7357, screenW * 0.7950, screenH * 0.9010, tocolor(143, 175, 73, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
	end
	end
)


timer = false
addEventHandler("onClientGUIClick",root,function()
	if source == label.login and timer == false then
		if #guiGetText(edit.login) > 3 and #guiGetText(edit.login) > 3 then
			triggerServerEvent("loguj",localPlayer,guiGetText(edit.login),guiGetText(edit.haslo))
			timer = true
				setTimer(function()
					timer = false
				end,1000,1)
		else
			triggerServerEvent("error",localPlayer,"Haslo i login musza miec powyzej 3znakow!")
		end
	elseif source == label.rejestruj and timer == false then
		if #guiGetText(edit.haslo) > 3 and #guiGetText(edit.haslo) > 3 then
			triggerServerEvent("rejestruj",localPlayer,guiGetText(edit.login),guiGetText(edit.haslo))
			timer = true
				setTimer(function()
					timer = false
				end,1000,1)
		else
			triggerServerEvent("error",localPlayer,"Haslo i login musza miec powyzej 3znakow!")
		end

	end
end)

addEvent("cancelLogin", true)
	addEventHandler("cancelLogin",root,function()
		guiSetVisible(label.login,false)
		guiSetVisible(label.rejestruj,false)
		guiSetVisible(edit.login,false)
		guiSetVisible(edit.haslo,false)
		showCursor(false)
		login = false
		moveCamera(0)
		setCameraTarget(localPlayer)
end)




addEvent("startSpawn", true)
	addEventHandler("startSpawn",root,function()
		guiSetVisible(label.login,false)
		guiSetVisible(label.rejestruj,false)
		guiSetVisible(edit.login,false)
		guiSetVisible(edit.haslo,false)
		moveCamera(0)
		showCursor(false)
		login = false
		triggerServerEvent("spawn",localPlayer, 1239.62, -2037.11, 59.92)
		showChat(true)
		showPlayerHudComponent ("radar", true)

end)