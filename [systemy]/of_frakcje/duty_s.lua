addEvent("sprawdzPrace", true)
addEventHandler("sprawdzPrace", root, function(login, frakcja)
    if login == getElementData(client,"login") then
    pobierz = exports.of_core:pobierzTabeleWynikow("SELECT * FROM frakcje")
        for k,v in pairs(pobierz) do
            if v.login == login and v.frakcja == frakcja then
            outputChatBox("Wszedłeś na duty.", client)
            return
            else
            outputChatBox("Nie jesteś tu zatrudniony.", client)
            return
            end
        end
    end
end)