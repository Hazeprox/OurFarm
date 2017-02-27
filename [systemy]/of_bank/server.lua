--
addEvent("createBank",true)
addEventHandler("createBank",root,function(pin)
result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
	if result[1] == nil then
		result = exports.of_core:zapytanie("INSERT INTO `bank` (`login`, `konto`, `PIN`) VALUES ('"..getElementData(client,"login").."', '0', '"..tostring(pin).."')")
	else
		exports.of_notif:createNotif(client,"ERROR","Masz juz konto w banku!",5,255,0,0)
	end
end)

addEvent("pytajBank",true)
addEventHandler("pytajBank",root,function(pin)
result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
	if result[1] ~= nil then
		for k,v in pairs(result) do
			if v.PIN == pin then
				triggerClientEvent(client,"guiTrue",client, v.konto)
			end
		end
	end
end)

addEvent("wplacBank",true)
addEventHandler("wplacBank",root,function(ile)
result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
	if result[1] ~= nil then
		for k,v in pairs(result) do
			if getPlayerMoney(client) >= tonumber(ile) then
				aktualnekonto = tonumber(v.konto)+tonumber(ile)
				takePlayerMoney(client,tonumber(ile))
				exports.of_core:update("UPDATE bank SET konto = ? WHERE login=?",aktualnekonto,getElementData(client, "login"))
				result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
				for k,va in pairs(result) do
					triggerClientEvent(client,"stan",client, va.konto)
				end
			end
		end
	end
end)
addEvent("wyplacBank",true)
addEventHandler("wyplacBank",root,function(ile)
result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
	if result[1] ~= nil then
		for k,v in pairs(result) do
			if v.konto >= tonumber(ile) then
				givePlayerMoney(client, tonumber(ile))
				aktualnekonto = tonumber(v.konto)-tonumber(ile)
				exports.of_core:update("UPDATE bank SET konto = ? WHERE login=?",aktualnekonto,getElementData(client, "login"))
				result = exports.of_core:pobierzTabeleWynikow("Select * from `bank` WHERE login = ?",getElementData(client,"login"))
				for k,va in pairs(result) do
					triggerClientEvent(client,"stan",client, va.konto)
				end
			end
		end
	end
end)