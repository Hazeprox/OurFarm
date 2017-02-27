--
veh = {}
addEvent("startPrawko",true)
addEventHandler("startPrawko",root,function()
	veh[client] = createVehicle(445, 1149.01, -2035.42, 69.01)
	setElementDimension(client,2)
	setElementDimension(veh[client],2)
	warpPedIntoVehicle(client,veh[client])
	setElementData(veh[client], "przebieg", 0)
	setElementData(veh[client], "paliwo", 50)
		addEventHandler("onVehicleStartExit",root,function(plr,_,_,_)
			if isElement(veh[plr]) and source == veh[plr] then
				if getElementData(veh[plr], "przebieg") > 10 then
					pobierz = exports.of_core:pobierzTabeleWynikow("SELECT * FROM prawko WHERE login = ?", getPlayerName(plr))
					if pobierz[1] == nil then
						result = exports.of_core:zapytanie("INSERT INTO `prawko` (`login`, `katb`) VALUES ('"..getPlayerName(plr).."', '1')")
						destroyElement(veh[plr])
						veh[plr]={}
						setElementData(plr, "katb", true)
						setElementDimension(plr,0)
						spawnPlayer(plr, 1139.79, -2043.31, 69.00)
					else
						for k,v in pairs(pobierz) do
							exports.of_core:update("UPDATE prawko SET katb = ? WHERE login=?",1,getElementData(plr, "login"))
							setElementData(plr, "katb", true)
							destroyElement(veh[plr])
							setElementDimension(plr,0)
							spawnPlayer(plr, 1139.79, -2043.31, 69.00)
							veh[plr]={}
						end
					end
				else
					cancelEvent()
				end
			end
		end)
		addEventHandler("onPlayerQuit",root,function()
				if isElement(veh[source]) and veh[source] then
					destroyElement(veh[source])
					veh[source]={}
				end
		end)

end)

