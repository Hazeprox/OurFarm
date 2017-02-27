            
addEvent("rejestruj",true)
addEventHandler("rejestruj",root,function(login,haslo)
    pobierz = exports.of_core:pobierzTabeleWynikow("SELECT * FROM loginpanel WHERE login = ?", login)
    if pobierz[1] == nil then
        result = exports.of_core:zapytanie("INSERT INTO `loginpanel` (`login`, `haslo`, `skin`, `hajs`, `x`, `y`, `z`, `ranga`, `interior`, `dimension`, `punkty`) VALUES ('"..login.."', '"..haslo.."', '0', '0', '0', '0', '0', 'gracz', '0', '0', '0')")
        result2 = exports.of_core:zapytanie("INSERT INTO `frakcje` (`login`, `frakcja`, `ranga`) VALUES ('"..login.."', 'Brak', 'Brak')")
        if result and result2 then
            setElementData(client, "frakcja", "Brak")
            setElementData(client, "frakcja_ranga", "Brak")
            triggerClientEvent(client,"startSpawn",client)
            setElementData(client, "logged", true)
            pobierz = exports.of_core:pobierzTabeleWynikow("SELECT * FROM loginpanel")
            for k,v in pairs(pobierz) do
                setPlayerMoney(client, 0)
                setElementData(client,"login", login)
                setPlayerName(client, login)
                setElementModel(client, 0)
                setElementData(client,"ranga", "gracz")
                setElementData(client, "punkty", 0)
                setElementData(client, "UID", v.id)
                triggerClientEvent(client,"startSpawn",client)
                setElementData(client, "logged", true)
                exports.of_notif:createNotif(client, "INFO", "Dziekujemy za wybranie naszego serwera "..getPlayerName(client).." !",5,0,255,0)
            end
        end 
    end
end)
function nickChangeHandler()
cancelEvent()
end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)

addEvent("loguj",true)
addEventHandler("loguj",root,function(login,haslo)
    pobierz = exports.of_core:pobierzTabeleWynikow("SELECT * FROM loginpanel")
    for k,v in pairs(pobierz) do
        if v.login == login and v.haslo == haslo then
            setElementData(client,"login", login)
            setPlayerMoney(client, v.hajs)
            setElementModel(client, v.skin)
            setElementData(client,"ranga", v.ranga)
            setPlayerName(client, login)
            setElementData(client, "punkty", v.punkty)
            setElementData(client, "UID", v.id)
            triggerClientEvent(client,"startSpawn",client)
            setElementData(client, "logged", true)
            exports.of_notif:createNotif(client, "INFO", "Zostales zalogowany! Witamy spowrotem "..getPlayerName(client).." !",5,0,255,0)
			pobierz2 = exports.of_core:pobierzTabeleWynikow("SELECT * FROM frakcje WHERE login = ?", login)
			pobierz3 = exports.of_core:pobierzTabeleWynikow("SELECT * FROM prawko WHERE login = ?", login)
			for _,a in pairs(pobierz2) do
				setElementData(client, "ranga",v.ranga)
				setElementData(client, "frakcja",v.frakcja)
			end
			for _,b in pairs(pobierz3) do
				setElementData(client, "kata",v.kata)
				setElementData(client, "katb",v.katb)
				setElementData(client, "katc",v.katc)
			end
        end
    end
end)
addEvent("spawn",true)
addEventHandler("spawn",root,function(x,y,z)
spawnPlayer(client,x,y,z)
setCameraTarget(client)
end)
addEvent("error",true)
addEventHandler("error",root,function(tresc)
exports.of_notif:createNotif(client, "ERROR", tresc,5,255,0,0)
end)
