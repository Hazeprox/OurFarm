function addAdmin(plr, lvl)
	if not plr then return end
	if lvl == "developer" then
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "developer", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "developer")
	elseif lvl == "rcon" then
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "rcon", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "rcon")
	elseif lvl == "admin" then
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "admin", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "admin")
	elseif lvl == "support" then
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "support", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "support")
	end
end	

function addPremium(plr, lvl)
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "premium", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "premium")
end	

addCommandHandler("rank",function(plr,cmd,nick,lvl)
	if getPlayerRank(plr) == "Developer" or getPlayerRank(plr) == "Rcon" or getPlayerName(plr) == "haze" then
		local target = findPlayer(nick)
		addAdmin(target, lvl)
		setElementData(target, "ranga", lvl)
	end
end)

function addPlayerPoints(plr, points)
	if plr and points then
	zapytanie("UPDATE loginpanel SET punkty=? WHERE id=?", getElementData(plr, "punkty")+points, getElementData(plr, "UID"))
	setElementData(plr, "punkty", getElementData(plr, "punkty")+points)
	return true
	else
	return false
	end
end

function setPlayerPoints(plr, points)

	if plr and points then
	zapytanie("UPDATE loginpanel SET punkty=? WHERE id=?", points, getElementData(plr, "UID"))
	setElementData(plr, "punkty", points)
	return true
	else
	return false
	end
end


function removeAdmin(plr)

	if not plr then return end
		
	zapytanie("UPDATE loginpanel SET ranga = ? WHERE id = ?", "gracz", getElementData(plr, "UID"))
	setElementData(plr, "ranga", "gracz")
end	


addEventHandler("onPlayerWasted", root, function()
	setTimer(spawnPlayer,2000,1,source,0,0,5)


end)


function getPlayerRank(plr)

	if not plr then return end
	
	local que = pobierzWyniki("SELECT ranga FROM loginpanel WHERE id=?", getElementData(plr, "UID"))
	
	if que["ranga"] == "admin" then
	return "Admin"
	elseif que["ranga"] == "developer" then
	return "Developer"
	elseif que["ranga"] == "rcon" then
	return "Rcon"
	elseif que["ranga"] == "support" then
	return "Support"
	elseif que["ranga"] == "premium" then
	return "Premium"
	end
end

function pmPlayer(plr, target, mes)
	if getElementType(plr) == "player" and getElementType(target) == "player" then
	outputChatBox("#8CFF00(( #ffffff"..getPlayerName(target).." ("..tostring(getElementData(target, "ID"))..") #8CFF00: "..mes.." ))", plr, 255, 255, 255, true)
	outputChatBox("#fa5000(( #ffffff"..getPlayerName(plr).." ("..tostring(getElementData(plr, "ID"))..") #fa5000: "..mes.." ))", target, 255, 255, 255, true)
	end
end