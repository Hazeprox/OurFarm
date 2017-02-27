--[[
Skrypt Dla fSantos.pl
Wykonawca: Haze
Kontakt: zmuda20011@gmail.com, Skype: zmuda20011

]]
function createNotif(gracz,tytul,opis,czas,r,g,b)
	if gracz and tytul and opis and tonumber(czas) then
		triggerClientEvent(gracz, "addNotif",gracz,tytul,opis,czas,r,g,b)
	end
end

addEvent("createNotif", true)
	function createNotifTR(tytul,opis,czas,r,g,b)
		if gracz and tytul and opis and tonumber(czas) then
			triggerClientEvent(client,"addNotif",client,tytul,opis,czas,r,g,b)
		end
	end
addEventHandler("createNotif",root,createNotifTR)

