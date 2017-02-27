
local screenW, screenH = guiGetScreenSize()

function hud()
	if isPlayerHudComponentVisible("radar") == true then

		showPlayerHudComponent("ammo",false)
		showPlayerHudComponent("area_name",false)
		showPlayerHudComponent("armour",false)
		showPlayerHudComponent("breath",false)
		showPlayerHudComponent("money",false)
		showPlayerHudComponent("vehicle_name",false)
		showPlayerHudComponent("weapon",false)
		showPlayerHudComponent("wanted",false)
		showPlayerHudComponent("clock",false)
		showPlayerHudComponent("health",false)

		local realtime = getRealTime()
		local hour = realtime.hour
		local minute = realtime.minute
		local sx, sy = guiGetScreenSize( )

		dxDrawImage(screenW * 0.5586, screenH * -0.0130, screenW * 0.4466, screenH * 0.4128, "hud.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

		local playerScore = getElementData ( localPlayer, "points" ) or 0
		local playerFrakcja = getElementData (localPlayer, "frakcja") or "Brak"
		local playerName = getPlayerName ( localPlayer )
		dxDrawText("Portfel: "..getPlayerMoney(localPlayer).." PLN",screenW * 0.7950, screenH * 0.1914, screenW * 0.9605, screenH * 0.2279, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)
		dxDrawText("Farm Points: "..playerScore, screenW * 0.7950, screenH * 0.2409, screenW * 0.9605, screenH * 0.2773, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)
		dxDrawText("Duty: "..playerFrakcja,  screenW * 0.7950, screenH * 0.2904, screenW * 0.8697, screenH * 0.3255, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)
		dxDrawText(""..playerName.." ( Moderator )", screenW * 0.7994, screenH * 0.0221, screenW * 0.8397, screenH * 0.0586, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)
		dxDrawText("Czas: "..hour..":"..minute.."", screenW * 0.8397, screenH * 0.1211, screenW * 0.8777, screenH * 0.1536, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)
		dxDrawText("Życie: "..math.floor(getElementHealth(localPlayer)).. "%",  screenW * 0.8397, screenH * 0.0716, screenW * 0.9217, screenH * 0.1081, tocolor(133, 133, 133, 255), 1.50, "default", "left", "top", false, false, false, false, false)

	end
end
addEventHandler ("onClientRender", root, hud)
