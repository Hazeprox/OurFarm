addEventHandler("onClientRender",root,
	function()
	local px, py, pz, tx, ty, tz, dist
	px, py, pz = getCameraMatrix()
		for _, v in ipairs( getElementsByType 'player') do
		tx, ty, tz = getElementPosition(v)
		dist = math.sqrt((px - tx) ^ 2 + (py - ty) ^ 2 + (pz - tz) ^ 2)
			if dist < 30.0 then
				if isLineOfSightClear(px, py, pz, tx, ty, tz, true, false, false, true, false, false, false, localPlayer) then
				local sx, sy, sz = getPedBonePosition(v, 5)
				local x,y = getScreenFromWorldPosition(sx, sy, sz + 0.3)
				local id = getElementData(v, "ID")
					if x then -- getScreenFromWorldPosition returns false if the point isn't on screen
						if v ~= localPlayer then
							if getElementData(v, "ranga") == "developer" then
							dxDrawText(getPlayerName(v).." #00ff99(Developer)#ffffff ("..id..")", x, y, x, y, tocolor(255, 255, 255), 1.2 + (15 - dist) * 0.02, "default", "center", "center", false, false, false, true)
							elseif getElementData(v, "ranga") == "rcon" and v ~= localPlayer then
							dxDrawText(getPlayerName(v).." #ff0000(RCON)#ffffff ("..id..")", x, y, x, y, tocolor(255, 255, 255), 1.2 + (15 - dist) * 0.02, "default", "center", "center", false, false, false, true)
							elseif getElementData(v, "ranga") == "admin" and v ~= localPlayer then
							dxDrawText(getPlayerName(v).." #ff0000(Admin)#ffffff ("..id..")", x, y, x, y, tocolor(255, 255, 255), 1.2 + (15 - dist) * 	0.02, "default", "center", "center", false, false, false, true)
							elseif getElementData(v, "ranga") == "support" and v ~= localPlayer then
							dxDrawText(getPlayerName(v).." #0088ff(Support)#ffffff ("..id..")", x, y, x, y, tocolor(255, 255, 255), 1.2 + (15 - dist) * 0.02, "default", "center", "center", false, false, false, true)
							else
							dxDrawText(""..getPlayerName(v).. " (" ..id.. ")", x, y, x, y, tocolor(255, 255, 255), 1.2 + (15 - dist) * 0.02, "default", "center", "center")
							end
						end
					end
				end
			end
		end
	end
)


addEventHandler("onClientResourceStart", resourceRoot, function()
	for _,v in ipairs(getElementsByType("player")) do
		setPlayerNametagShowing(v, false) 
	end
end)

addEventHandler("onClientPlayerSpawn", root,  function()
	setPlayerNametagShowing(source, false)
end)

