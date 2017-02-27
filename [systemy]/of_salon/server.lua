--
addEvent("buyVeh",true)
addEventHandler("buyVeh",root,function(id,cena)
	if tonumber(getPlayerMoney(client)) > tonumber(cena) then
		takePlayerMoney(client, cena)
		exports.of_notif:createNotif(client, "SALON", "Brawo! Dokonales zakupu auta! Zaplaciles: "..cena,5,0,255,0)
		triggerClientEvent(client, "salonDel", client)
		car = exports.of_pojazdy:createPrivCar(id,1883.55, -1807.12, 13.22, 0.0, 360.0, 179.2,client)
		warpPedIntoVehicle(client, car)
	else
		exports.of_notif:createNotif(client, "SALON", "Nie stac cie na ten pojazd :(",5,0,255,0)
	end
end)
car = {}
addEvent("startTest",true)
addEventHandler("startTest",root,function(id)
		exports.of_notif:createNotif(client, "SALON", "Testujesz teraz auto: "..getVehicleNameFromID(id),5,0,255,0)
		car[client] = createVehicle(id,1822.30, -1814.79, 3.64, 0.0, 360.0, 256)
		setElementDimension(client,1)
		setElementDimension(car[client],1)
		setElementData(car[client], "test", true)
		warpPedIntoVehicle(client, car[client])

		addEventHandler("onVehicleStartExit",root,function(plr,_,_,_)
			if isElement(car[plr]) and source == car[plr] then
				destroyElement(source)
				setElementDimension(plr,0)
				car[plr]={}
				spawnPlayer(plr,1847.54, -1769.52, 13.56)
				triggerClientEvent(plr,"deleteTimers",plr)
			end
		end)
		addEventHandler("onPlayerQuit",root,function()
				if isElement(car[source]) and car[source] then
					destroyElement(car[source])
					car[source]={}
					triggerClientEvent(source,"deleteTimers",source)
				end
		end)
end)
addEvent("stopTest",true)
addEventHandler("stopTest", root,function()
	if car[client] and isElement(car[client]) then
		destroyElement(car[client])
		car[client]={}
		spawnPlayer(client,1847.54, -1769.52, 13.56)
		triggerClientEvent(source,"deleteTimers",source)
	end
end)
