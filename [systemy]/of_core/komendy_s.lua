function findPlayer(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

addCommandHandler("daj", function(plr, com, komu, ile)  
	if komu ~= "" and ile ~= "" then
	kto = findPlayer(komu)
		if kto then
			if getPlayerMoney(plr) >= tonumber(ile) then
				if tonumber(ile) > 0 then
				givePlayerMoney(kto, tonumber(ile))
				takePlayerMoney(plr, tonumber(ile))
				outputChatBox(getPlayerName(plr).." dal Ci $"..tostring(ile)..".", kto, 255, 255, 255)
				outputChatBox("Przekazales $"..ile.." "..getPlayerName(kto)..".", plr, 255, 255, 255)
				exports.of_notif:createNotif(kto, "INFO", getPlayerName(plr).." dal Ci $"..tostring(ile)..".",5,0,255,0)
				exports.of_notif:createNotif(plr, "INFO", "Przekazales $"..ile.." "..getPlayerName(kto)..".",5,0,255,0)
				else
				outputChatBox("Nie mozesz przekazac tej kwoty!", plr, 255, 255, 255)
				end
			else
			outputChatBox("Nie masz tylu pieniedzy", plr, 255, 255, 255)
			end
		else
		outputChatBox("Nie ma takiego gracza", plr, 255, 255, 255)
		end
	else
	outputChatBox("WZOR: /daj [nick/ID] [kwota]", plr, 255, 255, 255)
	end
end)





addCommandHandler("pm", function(plr, com, target, ...)
local mes = { ... }
local mes = table.concat(mes, " ")
local target = findPlayer(target)
	if target and mes then
		pmPlayer(plr, target, mes)
		setElementData(plr, "reply", getPlayerName(target))
		setElementData(target, "reply", getPlayerName(plr))
	else
		outputChatBox("/pm [gracz] [wiadomosc]", plr)
	end
end)

addCommandHandler("inv", function(plr)
	if isPlayerSupport(plr) then
		if getElementAlpha(plr) > 0 then
			setElementAlpha(plr,0)
		else
			setElementAlpha(plr,255)
		end
	end
end)

addCommandHandler("re", function(plr, com, ...)
local mes = { ... }
local mes = table.concat(mes, " ")
	if getElementData(plr, "reply") and getElementData(plr, "reply") ~= nil then
	local target = getPlayerFromName(getElementData(plr, "reply"))
	pmPlayer(plr, target, mes)
	end
end)