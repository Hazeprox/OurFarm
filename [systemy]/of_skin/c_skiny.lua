marker_Skin = createPickup (  1567.95, -1897.53, 13.86, 3, 1275, 0 ) 
setElementData (marker_Skin, "opis", "Skin Shop")
createBlip( 1567.95, -1897.53, 13.56,45)
local sx, sy = guiGetScreenSize( )

function skinek()
        dxDrawImage(sx*(318/1366), sy*(124/768), sx*(707/1366), sy*(446/768), ":of_core/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(sx*(732/1366), sy*(239/768), sx*(188/1366), sy*(42/768), ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(sx*(732/1366), sy*(291/768), sx*(188/1366), sy*(42/768), ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(sx*(732/1366), sy*(465/768), sx*(188/1366), sy*(42/768), ":of_core/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Zakup Skin", sx*(766/1366), sy*(243/768), sx*(895/1366), sy*(276/768), tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Pokaz Skin", sx*(765/1366), sy*(295/768), sx*(894/1366), sy*(328/768), tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Zamknij Panel", sx*(747/1366), sy*(469/768), sx*(910/1366), sy*(502/768), tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Przebieralnia", sx*(598/1366), sy*(182/768), sx*(742/1366), sy*(214/768), tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
end


lista_Skinow = guiCreateGridList(sx*(415/1366), sy*(229/768), sx*(302/1366), sy*(278/768), false)  
id = guiGridListAddColumn(lista_Skinow, "ID", 0.5)
koszt =  guiGridListAddColumn(lista_Skinow, "Koszt", 0.5)
KuP_Skina = guiCreateLabel(sx*(734/1366), sy*(240/768), sx*(181/1366), sy*(41/768), "", false)
off_Skin = guiCreateLabel(sx*(737/1366), sy*(465/768), sx*(181/1366), sy*(41/768), "", false)
pokaz_skina = guiCreateLabel(sx*(732/1366), sy*(291/768), sx*(181/1366), sy*(41/768), "", false)
guiSetVisible (lista_Skinow, false)
guiSetVisible (KuP_Skina, false)
guiSetVisible (pokaz_skina, false)
guiSetVisible (off_Skin, false)
   

addEventHandler ("onClientPickupHit", marker_Skin,
function (hitElement)
if hitElement == getLocalPlayer() then
guiSetVisible (lista_Skinow, true)
guiSetVisible (KuP_Skina, true)
guiSetVisible (pokaz_skina, true)
guiSetVisible (off_Skin, true)
addEventHandler ("onClientRender", root, skinek)
showCursor (true)
end
end
)


addEventHandler ("onClientGUIClick", off_Skin,
function ()
guiSetVisible (lista_Skinow, false)
guiSetVisible (KuP_Skina, false)
guiSetVisible (pokaz_skina, false)
guiSetVisible (off_Skin, false)
removeEventHandler ("onClientRender", root, skinek)
showCursor (false)
end, false)

skiny = {
{id = "0", koszt = "260 $"},
{id = "1", koszt = "260 $"},
{id = "2", koszt = "260 $"},
{id = "7", koszt = "260 $"},
{id = "10", koszt = "260 $"},
{id = "11", koszt = "260 $"},
{id = "12", koszt = "260 $"},
{id = "13", koszt = "260 $"},
{id = "14", koszt = "260 $"},
{id = "15", koszt = "260 $"},
{id = "18", koszt = "260 $"},
{id = "19", koszt = "260 $"},
{id = "20", koszt = "260 $"},
{id = "21", koszt = "260 $"},
{id = "22", koszt = "260 $"},
{id = "23", koszt = "260 $"},
{id = "24", koszt = "260 $"},
{id = "25", koszt = "260 $"},
{id = "26", koszt = "260 $"},
{id = "28", koszt = "260 $"},
{id = "29", koszt = "260 $"},
{id = "30", koszt = "260 $"},
{id = "31", koszt = "260 $"},
{id = "32", koszt = "260 $"},
{id = "33", koszt = "260 $"},
{id = "34", koszt = "260 $"},
{id = "35", koszt = "260 $"},
{id = "36", koszt = "260 $"},
{id = "37", koszt = "260 $"},
{id = "38", koszt = "260 $"},
{id = "39", koszt = "260 $"},
{id = "40", koszt = "260 $"},
{id = "41", koszt = "260 $"},
{id = "43", koszt = "260 $"},
{id = "44", koszt = "260 $"},
{id = "45", koszt = "260 $"},
{id = "46", koszt = "260 $"},
{id = "47", koszt = "260 $"},
{id = "48", koszt = "260 $"},
--
{id = "49", koszt = "260 $"},
{id = "51", koszt = "260 $"},
{id = "52", koszt = "260 $"},
{id = "53", koszt = "260 $"},
{id = "54", koszt = "260 $"},
{id = "55", koszt = "260 $"},
{id = "56", koszt = "260 $"},
{id = "58", koszt = "260 $"},
{id = "59", koszt = "260 $"},
{id = "60", koszt = "260 $"},
{id = "62", koszt = "260 $"},
{id = "63", koszt = "260 $"},
{id = "64", koszt = "260 $"},
{id = "65", koszt = "260 $"},
{id = "66", koszt = "260 $"},
{id = "67", koszt = "260 $"},
{id = "68", koszt = "260 $"},
{id = "69", koszt = "260 $"},
{id = "70", koszt = "260 $"},
{id = "72", koszt = "260 $"},
{id = "73", koszt = "260 $"},
{id = "74", koszt = "260 $"},
{id = "75", koszt = "260 $"},
{id = "76", koszt = "260 $"},
{id = "78", koszt = "260 $"},
{id = "79", koszt = "260 $"},
{id = "80", koszt = "260 $"},
{id = "81", koszt = "260 $"},
{id = "82", koszt = "260 $"},
{id = "83", koszt = "260 $"},
{id = "84", koszt = "260 $"},
{id = "85", koszt = "260 $"},
{id = "86", koszt = "260 $"},
{id = "87", koszt = "260 $"},
{id = "88", koszt = "260 $"},
{id = "89", koszt = "260 $"},
{id = "90", koszt = "260 $"},
{id = "91", koszt = "260 $"},
{id = "92", koszt = "260 $"},
{id = "93", koszt = "260 $"},
--
{id = "94", koszt = "260 $"},
{id = "95", koszt = "260 $"},
{id = "96", koszt = "260 $"},
{id = "97", koszt = "260 $"},
{id = "98", koszt = "260 $"},
{id = "99", koszt = "260 $"},
{id = "100", koszt = "260 $"},
{id = "101", koszt = "260 $"},
{id = "102", koszt = "260 $"},
{id = "103", koszt = "260 $"},
{id = "104", koszt = "260 $"},
{id = "105", koszt = "260 $"},
{id = "106", koszt = "260 $"},
{id = "107", koszt = "260 $"},
{id = "108", koszt = "260 $"},
{id = "109", koszt = "260 $"},
{id = "110", koszt = "260 $"},
{id = "111", koszt = "260 $"},
{id = "112", koszt = "260 $"},
{id = "113", koszt = "260 $"},
{id = "114", koszt = "260 $"},
{id = "115", koszt = "260 $"},
{id = "117", koszt = "260 $"},
{id = "118", koszt = "260 $"},
{id = "119", koszt = "260 $"},
{id = "120", koszt = "260 $"},
{id = "121", koszt = "260 $"},
{id = "122", koszt = "260 $"},
{id = "123", koszt = "260 $"},
{id = "124", koszt = "260 $"},
{id = "125", koszt = "260 $"},
{id = "126", koszt = "260 $"},
{id = "127", koszt = "260 $"},
{id = "128", koszt = "260 $"},
{id = "129", koszt = "260 $"},
{id = "130", koszt = "260 $"},
{id = "131", koszt = "260 $"},
{id = "132", koszt = "260 $"},
{id = "133", koszt = "260 $"},
{id = "134", koszt = "260 $"},
--
{id = "135", koszt = "260 $"},
{id = "136", koszt = "260 $"},
{id = "137", koszt = "260 $"},
{id = "138", koszt = "260 $"},
{id = "139", koszt = "260 $"},
{id = "140", koszt = "260 $"},
{id = "141", koszt = "260 $"},
{id = "142", koszt = "260 $"},
{id = "143", koszt = "260 $"},
{id = "144", koszt = "260 $"},
{id = "145", koszt = "260 $"},
{id = "146", koszt = "260 $"},
{id = "147", koszt = "260 $"},
{id = "148", koszt = "260 $"},
{id = "149", koszt = "260 $"},
{id = "150", koszt = "260 $"},
{id = "151", koszt = "260 $"},
{id = "152", koszt = "260 $"},
{id = "153", koszt = "260 $"},
{id = "154", koszt = "260 $"},
{id = "155", koszt = "260 $"},
{id = "156", koszt = "260 $"},
{id = "157", koszt = "260 $"},
{id = "158", koszt = "260 $"},
{id = "159", koszt = "260 $"},
{id = "160", koszt = "260 $"},
{id = "161", koszt = "260 $"},
{id = "162", koszt = "260 $"},
{id = "163", koszt = "260 $"},
{id = "164", koszt = "260 $"},
{id = "165", koszt = "260 $"},
{id = "166", koszt = "260 $"},
{id = "167", koszt = "260 $"},
{id = "168", koszt = "260 $"},
{id = "169", koszt = "260 $"},
{id = "170", koszt = "260 $"},
{id = "171", koszt = "260 $"},
{id = "172", koszt = "260 $"},
{id = "173", koszt = "260 $"},
{id = "174", koszt = "260 $"},
--
{id = "175", koszt = "260 $"},
{id = "176", koszt = "260 $"},
{id = "178", koszt = "260 $"},
{id = "179", koszt = "260 $"},
{id = "180", koszt = "260 $"},
{id = "181", koszt = "260 $"},
{id = "182", koszt = "260 $"},
{id = "183", koszt = "260 $"},
{id = "184", koszt = "260 $"},
{id = "185", koszt = "260 $"},
{id = "186", koszt = "260 $"},
{id = "187", koszt = "260 $"},
{id = "189", koszt = "260 $"},
{id = "190", koszt = "260 $"},
{id = "191", koszt = "260 $"},
{id = "192", koszt = "260 $"},
{id = "193", koszt = "260 $"},
{id = "194", koszt = "260 $"},
{id = "195", koszt = "260 $"},
{id = "196", koszt = "260 $"},
{id = "197", koszt = "260 $"},
{id = "198", koszt = "260 $"},
{id = "199", koszt = "260 $"},
{id = "200", koszt = "260 $"}
}

for k, v in ipairs(skiny) do
row = guiGridListAddRow (lista_Skinow)
guiGridListSetItemText (lista_Skinow, row, id, v.id, false, false)
guiGridListSetItemText (lista_Skinow, row, koszt, v.koszt, false, false)
end

powrot = guiCreateButton(0.34, 0.76, 0.33, 0.06, "Wroc do Sklepu", true)
guiSetProperty(powrot, "NormalTextColour", "FFAAAAAA") 
guiSetVisible (powrot, false)

addEventHandler ("onClientGUIClick", pokaz_skina,
function ()
local id = guiGridListGetItemText (lista_Skinow, guiGridListGetSelectedItem (lista_Skinow), 1) 
local gracz = getLocalPlayer()
ped = createPed (id, -211.0498046875, 1183.2451171875, 24.924438476562, 90)
setElementFrozen(ped,true)
setCameraMatrix(-216.8037109375, 1183.16796875, 26.74799156189, -211.0498046875, 1183.2451171875, 24.924438476562)
guiSetVisible (powrot, true)
guiSetVisible (lista_Skinow, false)
guiSetVisible (KuP_Skina, false)
guiSetVisible (pokaz_skina, false)
guiSetVisible (off_Skin, false)
removeEventHandler ("onClientRender", root, skinek)
end, false)


addEventHandler ("onClientGUIClick", powrot,
function ()
guiSetVisible (powrot, false)
local gracz = getLocalPlayer()
setCameraTarget(gracz)
guiSetVisible (lista_Skinow, true)
guiSetVisible (KuP_Skina, true)
guiSetVisible (pokaz_skina, true)
guiSetVisible (off_Skin, true)
addEventHandler ("onClientRender", root, skinek)
destroyElement (ped)
end, false
)

function sprzedajSkina()
	local id = guiGridListGetItemText (lista_Skinow, guiGridListGetSelectedItem (lista_Skinow), 1) 
    local gracz = getLocalPlayer()
	triggerServerEvent("dajSkina", root, gracz, tonumber(id),260)
	end

addEventHandler( "onClientGUIClick", KuP_Skina, sprzedajSkina, false )