addEvent("dajSkina",true)
addEventHandler("dajSkina",root,function(gracz,id,cena)
if gracz and id and cena then
if cena <= getPlayerMoney(gracz) then
setElementModel(gracz,id)
takePlayerMoney(gracz,cena)
else
exports.of_notif:createNotif(gracz,"SKINSHOP","Nie stac Cie",5,255,0,0)
end
end
end)