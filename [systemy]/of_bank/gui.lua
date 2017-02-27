--
local tekst1 = createElement("3dtext")
setElementData(tekst1, "3dtext_xyz", {608.64, -1458.62, 14.38})
setElementData(tekst1, "3dtext_odleglosc", 10)
setElementData(tekst1, "3dtext_tresc", "BANK")
setElementData(tekst1, "3dtext_kolory", {255, 255, 255})

blip = createBlip(608.64, -1458.62, 14.38, 52)
bankm = createMarker(608.64, -1458.62, 13.38, "cylinder",1,255,255,255,50)



akceptuj = guiCreateLabel(0.42, 0.57, 0.14, 0.05, "", true)
pin = guiCreateEdit(0.45, 0.36, 0.09, 0.04, "", true)    
bank = false
guiSetVisible(akceptuj, bank)
guiSetVisible(pin, bank)
local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
	if bank then
        dxDrawImage(screenW * 0.2262, screenH * 0.1445, screenW * 0.5366, screenH * 0.7461, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("BANK", screenW * 0.2862, screenH * 0.2461, screenW * 0.6999, screenH * 0.2943, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("PIN", screenW * 0.2862, screenH * 0.3164, screenW * 0.6999, screenH * 0.3646, tocolor(255, 255, 255, 255), 1.40, "sans", "center", "center", false, false, false, false, false)
        dxDrawText("ABY STWORZYC KONTO W BANKU \"CUSTOM BANK\" NALEZY ZAPLACIC 100$ I PODAC PIN", screenW * 0.2906, screenH * 0.4505, screenW * 0.7042, screenH * 0.4987, tocolor(255, 255, 255, 255), 1.40, "sans", "center", "center", false, true, false, false, false)
        dxDrawImage(screenW * 0.4231, screenH * 0.5729, screenW * 0.1406, screenH * 0.0482, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("AKCEPTUJ", screenW * 0.4246, screenH * 0.5742, screenW * 0.5637, screenH * 0.6211, tocolor(255, 255, 255, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
    end
	end
)


        akceptujpin = guiCreateLabel(0.41, 0.60, 0.15, 0.05, "", true)
        wyjdz = guiCreateLabel(0.41, 0.68, 0.15, 0.05, "", true)
        editbox = guiCreateEdit(0.43, 0.49, 0.12, 0.04, "", true)    
		guiSetVisible(akceptujpin,false)
		guiSetVisible(wyjdz,false)
		guiSetVisible(editbox,false)
		bankomatPIN = false
addEventHandler("onClientRender", root,
    function()
		if bankomatPIN then
			dxDrawImage(screenW * 0.2526, screenH * 0.1589, screenW * 0.4788, screenH * 0.6732, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("BANKOMAT", screenW * 0.3060, screenH * 0.2487, screenW * 0.6772, screenH * 0.2982, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("WPISZ PIN", screenW * 0.3507, screenH * 0.4245, screenW * 0.6259, screenH * 0.4805, tocolor(255, 255, 255, 255), 1.50, "default", "center", "center", false, false, false, false, false)
			dxDrawImage(screenW * 0.4151, screenH * 0.6055, screenW * 0.1420, screenH * 0.0495, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(screenW * 0.4151, screenH * 0.6836, screenW * 0.1420, screenH * 0.0495, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("AKCEPTUJ", screenW * 0.4151, screenH * 0.6042, screenW * 0.5571, screenH * 0.6549, tocolor(255, 255, 255, 255), 1.60, "sans", "center", "center", false, false, false, false, false)
			dxDrawText("WYJDZ", screenW * 0.4151, screenH * 0.6836, screenW * 0.5571, screenH * 0.7344, tocolor(255, 255, 255, 255), 1.60, "sans", "center", "center", false, false, false, false, false)
		end
	end
)

bankomaty={
{-114.66, 20.10, 3.12},
}
bankomat = nil
for k,v in pairs(bankomaty) do
bankomat = createMarker(-114.66, 20.10, 3.12,"cylinder",1)
end

function MarkerHit ( hitPlayer, matchingDimension )
	if source == bankm then
		if localPlayer == hitPlayer then
			bank = true
			guiSetVisible(akceptuj, bank)
			guiSetVisible(pin, bank)
			showCursor(bank)
		end
	elseif source == bankomat then
		if localPlayer == hitPlayer then	
			bankomatPIN = true
			guiSetVisible(akceptujpin,true)
			guiSetVisible(wyjdz,true)
			guiSetVisible(editbox,true)
			showCursor(true)
		end
	end
end
addEventHandler("onClientMarkerHit",root,MarkerHit)

        wyjdzBANK = guiCreateLabel(0.43, 0.57, 0.14, 0.07, "", true)
        wyplac = guiCreateLabel(0.33, 0.67, 0.14, 0.07, "", true)
        wplac = guiCreateLabel(0.52, 0.67, 0.14, 0.07, "", true)
        plac = guiCreateEdit(0.43, 0.45, 0.13, 0.04, "", true)    
		bankomatDX = false
		guiSetVisible(wyjdzBANK,false)
		guiSetVisible(wyplac,false)
		guiSetVisible(wplac,false)
		guiSetVisible(plac,false)
		stan = "Stan Konta"
addEventHandler("onClientRender", root,
    function()
		if bankomatDX then
			dxDrawImage(screenW * 0.2526, screenH * 0.1589, screenW * 0.4788, screenH * 0.6732, ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("WYPLAC", screenW * 0.3346, screenH * 0.6719, screenW * 0.4685, screenH * 0.7435, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
			dxDrawText(stan, screenW * 0.4004, screenH * 0.2943, screenW * 0.5974, screenH * 0.3568, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, false, false, false)
			dxDrawImage(screenW * 0.3389, screenH * 0.6719, screenW * 0.1296, screenH * 0.0755, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawImage(screenW * 0.5242, screenH * 0.6719, screenW * 0.1296, screenH * 0.0716, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("WPLAC", screenW * 0.5242, screenH * 0.6719, screenW * 0.6537, screenH * 0.7435, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
			dxDrawImage(screenW * 0.4319, screenH * 0.5664, screenW * 0.1296, screenH * 0.0755, ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("WYJDZ", screenW * 0.4319, screenH * 0.5703, screenW * 0.5615, screenH * 0.6419, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
		end
	end
)

addEventHandler("onClientGUIClick",root,function()
	if source == akceptuj then
		if tonumber(guiGetText(pin)) and #guiGetText(pin) == 4 then
			triggerServerEvent("createBank", localPlayer, guiGetText(pin))
			bank = false
			guiSetVisible(akceptuj, bank)
			guiSetVisible(pin, bank)
			showCursor(bank)
		end
	elseif source == akceptujpin then
		if tonumber(guiGetText(editbox)) and #guiGetText(editbox) == 4 then
			triggerServerEvent("pytajBank", localPlayer, guiGetText(editbox))
		end
	elseif source == wyjdz then
		guiSetVisible(akceptujpin,false)
		guiSetVisible(wyjdz,false)
		guiSetVisible(editbox,false)
		bankomatPIN = false
		showCursor(false)
	elseif source == wyjdzBANK then
		guiSetVisible(wyjdzBANK,false)
		guiSetVisible(wyplac,false)
		guiSetVisible(wplac,false)
		guiSetVisible(plac,false)
		bankomatDX = false
		showCursor(false)
	elseif source == wyplac then
		if tonumber(guiGetText(plac)) then
			triggerServerEvent("wyplacBank",localPlayer, guiGetText(plac))
		end
	elseif source == wplac then
		if tonumber(guiGetText(plac)) then
			triggerServerEvent("wplacBank",localPlayer, guiGetText(plac))
		end
	end
end)

addEvent("guiTrue",true)
addEventHandler("guiTrue",root,function(konto)
		guiSetVisible(akceptujpin,false)
		guiSetVisible(wyjdz,false)
		guiSetVisible(editbox,false)
		bankomatPIN = false
		guiSetVisible(wyjdzBANK,true)
		guiSetVisible(wyplac,true)
		guiSetVisible(wplac,true)
		guiSetVisible(plac,true)
		bankomatDX = true
		stan = "Stan Konta: "..konto
end)

addEvent("stan",true)
addEventHandler("stan",root,function(konto)
		stan = "Stan Konta: "..konto
end)
