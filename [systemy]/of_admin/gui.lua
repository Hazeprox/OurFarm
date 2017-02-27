
        info = guiCreateLabel(0.47, 0.43, 0.24, 0.28, "", true)
        kick = guiCreateLabel(0.49, 0.25, 0.06, 0.09, "", true)
        ban = guiCreateLabel(0.63, 0.25, 0.06, 0.09, "", true)
        czas = guiCreateEdit(0.63, 0.35, 0.06, 0.04, "", true)
        gridlista = guiCreateGridList(0.30, 0.24, 0.15, 0.43, true)
		
        nickc = guiGridListAddColumn(gridlista, "NICK", 0.5)
        hajsc = guiGridListAddColumn(gridlista, "HAJS", 0.3)
		guiSetVisible(info, false)
		guiSetVisible(kick, false)
		guiSetVisible(ban, false)
		guiSetVisible(czas, false)
		guiSetVisible(gridlista, false)
		admin = false


local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
		if admin == true then
			dxDrawImage(screenW * 0.4868, screenH * 0.2487, screenW * 0.0608, screenH * 0.0859, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(screenW * 0.6340, screenH * 0.2487, screenW * 0.0608, screenH * 0.0859, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(screenW * 0.2291, screenH * 0.0781, screenW * 0.5520, screenH * 0.7461, ":of_core/window.png", 0, 0, 0, tocolor(201, 4, 4, 255), false)
			dxDrawText("ADMIN PANEL", screenW * 0.2972, screenH * 0.1784, screenW * 0.7262, screenH * 0.2318, tocolor(201, 4, 4, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
			dxDrawText("KICK", screenW * 0.4868, screenH * 0.2487, screenW * 0.5476, screenH * 0.3346, tocolor(255, 255, 255, 255), 1.50, "pricedown", "center", "center", false, false, false, false, false)
			dxDrawText("BAN", screenW * 0.6340, screenH * 0.2487, screenW * 0.6947, screenH * 0.3346, tocolor(255, 255, 255, 255), 1.50, "pricedown", "center", "center", false, false, false, false, false)
			dxDrawText("CZAS", screenW * 0.3895, screenH * 0.3477, screenW * 0.8184, screenH * 0.4010, tocolor(201, 4, 4, 255), 2.00, "sans", "center", "top", false, false, false, false, false)
		
		end
	end
)

bindKey("F4","up",function()
	if admin == true then
		guiSetVisible(info, false)
		guiSetVisible(kick, false)
		guiSetVisible(ban, false)
		guiSetVisible(czas, false)
		guiSetVisible(gridlista, false)
		showCursor(false)
		guiGridListClear(gridlista)
		admin = false
		guiSetText(info, "")
	elseif admin == false then
		guiGridListClear(gridlista)
			for k,v	in pairs(getElementsByType("player")) do
					
					row = guiGridListAddRow(gridlista)
					guiGridListSetItemText(gridlista, row, nickc, getPlayerName(v), false, false)
					guiGridListSetItemText(gridlista, row, hajsc, tostring(getPlayerMoney(v)), false, false)
			end
		admin = true 
		guiSetVisible(info, true)
		showCursor(true)
		guiSetVisible(kick, true)
		guiSetVisible(ban, true)
		guiSetVisible(czas, true)
		guiSetVisible(gridlista, true)
	end
end)
addEvent("client_info", true)
addEventHandler("client_info",root,function(txt)
	guiSetText(info, txt)
end)



        start = guiCreateLabel(0.28, 0.55, 0.13, 0.06, "", true)
        stop = guiCreateLabel(0.54, 0.55, 0.13, 0.06, "", true)
        restart = guiCreateLabel(0.28, 0.66, 0.13, 0.06, "", true)
        dev = guiCreateLabel(0.54, 0.66, 0.13, 0.06, "", true)
        devlist = guiCreateGridList(0.28, 0.30, 0.40, 0.24, true)
        resc = guiGridListAddColumn(devlist, "RESOURCE NAME", 0.9)    
		guiSetVisible(start, false)
		guiSetVisible(stop, false)
		guiSetVisible(restart, false)
		guiSetVisible(devlist, false)
		guiSetVisible(dev, false)
		develop = false 

local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
	if develop == true then
        dxDrawImage(screenW * 0.1947, screenH * 0.1185, screenW * 0.5717, screenH * 0.8216, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2811, screenH * 0.5547, screenW * 0.1340, screenH * 0.0573, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5432, screenH * 0.5547, screenW * 0.1340, screenH * 0.0573, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2811, screenH * 0.6615, screenW * 0.1340, screenH * 0.0573, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.5432, screenH * 0.6576, screenW * 0.1340, screenH * 0.0573, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("START", screenW * 0.2818, screenH * 0.5547, screenW * 0.4151, screenH * 0.6120, tocolor(16, 100, 238, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("STOP", screenW * 0.5439, screenH * 0.5547, screenW * 0.6772, screenH * 0.6120, tocolor(16, 100, 238, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("RESTART", screenW * 0.2818, screenH * 0.6615, screenW * 0.4151, screenH * 0.7188, tocolor(16, 100, 238, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("DEV MODE", screenW * 0.5439, screenH * 0.6576, screenW * 0.6772, screenH * 0.7148, tocolor(16, 100, 238, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
    end
	end
)
for k,v in pairs(getElementsByType("of_resource")) do
row = guiGridListAddRow(devlist)
guiGridListSetItemText(devlist, row, resc, getElementData(v, "res_name"), false, false)
end
bindKey("F5", "up",function()
	if getElementData(localPlayer, "ranga") == "developer" then
		if develop == true then
			guiSetVisible(start, false)
			guiSetVisible(stop, false)
			guiSetVisible(restart, false)
			guiSetVisible(devlist, false)
			guiSetVisible(dev, false)
			develop = false 
			showCursor(false)
		elseif develop == false then
			guiSetVisible(start, true)
			guiSetVisible(stop, true)
			guiSetVisible(restart, true)
			guiSetVisible(devlist, true)
			guiSetVisible(dev, true)
			develop = true 	
			showCursor(true)
		end
	end
end)
addEventHandler("onClientGUIClick",root,function()
	if source == gridlista then
		row, kolumna = guiGridListGetSelectedItem(gridlista)
		if row and kolumna then
			if getPlayerFromName(guiGridListGetItemText(gridlista, row, nickc)) then
				triggerServerEvent("giveInfo",localPlayer, getPlayerFromName(guiGridListGetItemText(gridlista, row, nickc)))
			end
		end
	elseif source == kick then
		row, kolumna = guiGridListGetSelectedItem(gridlista)
		if row and kolumna then
			if getPlayerFromName(guiGridListGetItemText(gridlista, row, nickc)) then
				triggerServerEvent("kickPlr",localPlayer, getPlayerFromName(guiGridListGetItemText(gridlista, row, nickc)))
			end
		end
	elseif source == ban then

	elseif source == start then
		row, kolumna = guiGridListGetSelectedItem(devlist)
		if row and kolumna then
			if guiGridListGetItemText(devlist, row, kolumna) then
				triggerServerEvent("startRes", root, guiGridListGetItemText(devlist, row, kolumna))
			end
		end
	elseif source == restart then
		row, kolumna = guiGridListGetSelectedItem(devlist)
		if row and kolumna then
			if guiGridListGetItemText(devlist, row, kolumna) then
				triggerServerEvent("restartRes", root, guiGridListGetItemText(devlist, row, kolumna))
			end
		end
	elseif source == stop then
		row, kolumna = guiGridListGetSelectedItem(devlist)
		if row and kolumna then
			if guiGridListGetItemText(devlist, row, kolumna) then
				triggerServerEvent("stopRes", root, guiGridListGetItemText(devlist, row, kolumna))
			end
		end
	elseif source == dev then
		if getDevelopmentMode() == true then
			setDevelopmentMode(false)
		else
			setDevelopmentMode(true)
		end
	end
end)
