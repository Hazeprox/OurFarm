addEvent("addPrzecho",true)
addEventHandler("addPrzecho", root,function()
	result = exports.of_core:pobierzTabeleWynikow("SELECT * FROM `pojazdy` WHERE owner = ?", getPlayerName(client))
	for k,v in pairs(result) do
		if v.przecho == "true" then
			triggerClientEvent(client,"insertInfo",client,getVehicleNameFromID(v.veh), v.id)
		end
	end

end)
createBlip(1513.35, -1493.81, 13.56,16)
addEvent("removePrzecho",true)
addEventHandler("removePrzecho", root,function(id)
if tonumber(id) then
	result = exports.of_core:pobierzTabeleWynikow("SELECT * FROM `pojazdy` WHERE id = ?", tonumber(id))
	for k,que in pairs(result) do
		if que.przecho == "true" then
			local vehs = createVehicle(que.veh,1519.57, -1488.50, 13.18, 359.5, 0.1, 91.1)
			setElementData(vehs, "owner", que.owner)
			setElementRotation(vehs, 0, 0, 90)
			setVehicleColor(vehs,que.r,que.g,que.b)
			setElementData(vehs, "id", que.id)
			setElementData(vehs, "przebieg", que.przebieg)
			setElementData(vehs, "paliwo", que.paliwo)
			setElementData(vehs, "ts", que.ts)
			setElementData(vehs, "zh", que.zh)
			setElementData(vehs, "przecho", "false")
			for k,tune in pairs(fromJSON(que.tuning)) do
				if tune ~= 0 then
					addVehicleUpgrade(vehs, tune)
				end
			end
			exports.of_core:zapytanie("UPDATE pojazdy SET przecho = ? WHERE id = ?", "false" ,que.id)
			warpPedIntoVehicle(client,vehs)
		end
	end
end
end)

addEvent("addVehPrzecho",true)
addEventHandler("addVehPrzecho", root,function(id)
	if tonumber(id) then
		result = exports.of_core:pobierzTabeleWynikow("SELECT * FROM `pojazdy` WHERE id = ?", tonumber(id))
		if result then
			destroyElement(findVeh(id))
			exports.of_core:zapytanie("UPDATE pojazdy SET przecho = ? WHERE id = ?", "true" ,tonumber(id))
		end
	end
end)