--
addEvent("giveInfo",true)
addEventHandler("giveInfo",root, function(plr)
result = exports.of_core:pobierzTabeleWynikow("Select * from `loginpanel` WHERE login=?",getElementData(plr, "login"))
	if result then
		for k,v in pairs(result) do
			login = v.login
			skin = v.skin
			ranga = v.ranga
			punkty = v.punkty
			triggerClientEvent(client,"client_info",client, "Login: "..login.."\nSkin: "..skin.." \nRanga: "..ranga.."\nPunkty: "..punkty)
		end
	end
end)

addEvent("kickPlr",true)
addEventHandler("kickPlr",root, function(plr)
kickPlayer(plr,"Dostales kicka od gracza "..getPlayerName(client)..". Jesli nie znasz powodu spytaj sie danego adminstratora!")
end)

addEvent("startRes",true)
addEventHandler("startRes",root, function(res)
startResource(getResourceFromName(res))
end)
addEvent("stopRes",true)
addEventHandler("stopRes",root, function(res)
stopResource(getResourceFromName(res))
end)
addEvent("restartRes",true)
addEventHandler("restartRes",root, function(res)
restartResource(getResourceFromName(res))
end)
     for k, v in ipairs(getResources()) do
		if string.find(getResourceName(v), "of_") then
			local res = createElement("of_resource")
			setElementData(res, "res_name", getResourceName(v))
			setElementData(res, "res", v)
		end
     end