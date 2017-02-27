--
function createPrivCar(id,x,y,z,r,g,b,owner)
	local veh = createVehicle(id,x,y,z)
	if veh then
		setVehicleColor(veh,r,g,b)
		setElementData(veh, "owner", getPlayerName(owner))
		local rx,ry,rz = getElementRotation(veh)
		tuning={}
		for i=1,16 do
			table.insert(tuning, 0)
		end
		result, last_id = exports.of_core:zapytanieID("INSERT INTO `pojazdy` (`veh`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `r`, `g`, `b`, `owner`, `tuning`, `paliwo`, `przebieg`, `ts`,  `zh`, `przecho`) VALUES ('"..id.."', '"..x.."', '"..y.."', '"..z.."', '"..rx.."', '"..ry.."', '"..rz.."', '"..r.."', '"..g.."', '"..b.."', '"..getPlayerName(owner).."', '"..toJSON(tuning).."', '50', '0', 'brak', 'brak', 'false')")
		setElementData(veh, "id", last_id)
		setElementData(veh, "przebieg", 0)
		setElementData(veh, "paliwo", 50)
		setElementData(veh, "ts", "brak")
		setElementData(veh, "zh", "brak")
		setElementData(veh, "przecho", "false")
		return veh
	end
	return false
end

addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),function()
result = exports.of_core:pobierzTabeleWynikow("Select * from `pojazdy` WHERE przecho=false")
	for k,que in pairs(result) do
	if que.przecho == "false" then
		local veh = createVehicle(que.veh, que.x, que.y, que.z)
		setElementData(veh, "owner", que.owner)
		setElementRotation(veh, que.rx, que.ry, que.rz)
		setVehicleColor(veh,que.r,que.g,que.b)
		setElementData(veh, "id", que.id)
		setElementData(veh, "przebieg", que.przebieg)
		setElementData(veh, "paliwo", que.paliwo)
		setElementData(veh, "ts", que.ts)
		setElementData(veh, "zh", que.zh)
		setElementData(veh, "przecho", que.przecho)
		for k,tune in pairs(fromJSON(que.tuning)) do
			if tune ~= 0 then
				addVehicleUpgrade(veh, tune)
			end
		end
	end
	end
end)


function findVeh(id)
	for k,v in pairs(getElementsByType("vehicle")) do
		if getElementData(v, "id") then
			if getElementData(v, "id") == id then
				return v
			end
		end
	end
	return false
end

function zapiszVeh(id)
	if tonumber(id) then
		result = exports.of_core:pobierzTabeleWynikow("SELECT * FROM `pojazdy` WHERE id = ?", id)
		if result then
			local veh = findVeh(id)
			local x,y,z = getElementPosition(veh)
			local rx,ry,rz = getElementRotation(veh)
			local r,g,b = getVehicleColor(veh,true)
			tuningUpdate={}
            for i=1, 16 do
				local upgrade = getVehicleUpgradeOnSlot(veh, i)
				local upgrade = upgrade or 0
				table.insert(tuningUpdate, upgrade)
            end
			exports.of_core:zapytanie("UPDATE pojazdy SET x = ?, y = ?, z = ?, rx = ?, ry = ?, rz = ?, r = ?, g = ?, b = ?, tuning = ?, paliwo = ?, przebieg = ?, ts = ?, zh = ?, przecho = ? WHERE id = ?", x,y,z,rx,ry,rz,r,g,b, toJSON(tuningUpdate),getElementData(veh, "paliwo"),getElementData(veh, "przebieg"),getElementData(veh, "ts"),getElementData(veh, "zh"),getElementData(veh, "przecho"),getElementData(veh, "id"))
		
		end
	end
end

addEventHandler("onResourceStop",root,function()
	for k,v in pairs(getElementsByType("vehicle")) do
		if getElementData(v, "id") and getElementData(source, "id") ~= false then
			zapiszVeh(getElementData(v, "id"))
		end
	end
end)

addEventHandler("onVehicleStartExit",root,function()
	if getElementData(source, "id") and getElementData(source, "id") ~= false then
		zapiszVeh(getElementData(source, "id"))
	end
end)
addEventHandler("onVehicleStartEnter", root, function(plr,seat,jack,door)
	if seat == 0 then
		if getElementData(source, "id") then
			if getElementData(source, "owner") == getPlayerName(plr) then
			else
				exports.of_notif:createNotif(plr, "AUTO", "To nie jest twoje auto! Nalezy do "..getElementData(source, "owner"),5,255,0,0)
				cancelEvent()
			end
		else
			cancelEvent()
		end
	end
end)

