function savePlayer(plr)
if getElementData(plr, "logged") then
	if not plr then
	return false
	end
	local uid = getElementData(plr, "UID")


	if not uid then
	kickPlayer(plr, "Nie posiadasz UID")
	end
end
-- Zapisujemy wszystkie dane do MySQL
x,y,z = getElementPosition(plr)
update("UPDATE loginpanel SET hajs = ?, skin = ?, x = ?, y = ?, z = ?, ranga = ?, interior = ?, dimension = ?, punkty = ? WHERE id=?",getPlayerMoney(plr), getElementModel(plr), x, y, z, getElementData(plr, "ranga") or "gracz", getElementInterior(plr), getElementDimension(plr), getElementData(plr, "punkty") or 0, getElementData(plr, "UID"))
update("UPDATE frakcje SET frakcja = ?, ranga = ? WHERE login=?",getElementData(plr, "frakcja"),getElementData(plr, "frakcja_ranga"),getElementData(plr, "login"))
end

setTimer(function()
	for k,v in ipairs(getElementsByType("player")) do
		savePlayer(v)
	end
end, 10*1000, 0)

addEventHandler("onPlayerQuit", root, function()
-- Gdy gracz wychodzi zapisujemy jego wszystkie statystyki
savePlayer(source)
end)