local sw,sh = guiGetScreenSize()
start = getTickCount()
setTimer(function()
start = getTickCount()
    if start2 == true then
    start2 = false
    else
    start2 = true
    end
end, 1000, 0)

addEventHandler("onClientRender",getRootElement(), function()
px, py, pz = getCameraMatrix()
    for i, v in ipairs( getElementsByType "3dtext") do
    px, py, pz = getElementPosition( localPlayer )
    tx, ty, tz = unpack(getElementData(v, "3dtext_xyz"))
    local now = getTickCount()
    local endTime = start + 1000
    local elapsedTime = now - start
    local duration = endTime - start
    local progress = elapsedTime / duration
    if start2 == true then
    poz,_,_ = interpolateBetween( tz, 0, 0, tz - 0.1, 0, 0, progress, "InOutQuad")
    else
    poz,_,_ = interpolateBetween( tz - 0.1, 0, 0, tz, 0, 0, progress, "InOutQuad")
    end
    dist = getDistanceBetweenPoints3D( px, py, pz, tx, ty, poz )
    if dist < getElementData(v, "3dtext_odleglosc") then
            if isLineOfSightClear(px, py, pz, tx, ty, poz, true, false, false, true, false, false, false, localPlayer) then
            local x,y = getScreenFromWorldPosition(tx, ty, poz + 0.3)
            local id = getElementData(v, "ID")
                if x then -- getScreenFromWorldPosition returns false if the point isn't on screen
                    if v ~= localPlayer then
                    dxDrawText(getElementData(v, "3dtext_tresc"), x, y, x, y, tocolor(unpack(getElementData(v, "3dtext_kolory"))), 1.2 + (15 - dist) * 0.02, "default", "center", "center")
                    end
                end
            end
        end
    end
end)

local tekst1 = createElement("3dtext")
setElementData(tekst1, "3dtext_xyz", {220522.42, -192272.87, 13.55})
setElementData(tekst1, "3dtext_odleglosc", 10)
setElementData(tekst1, "3dtext_tresc", "LOL")
setElementData(tekst1, "3dtext_kolory", {255, 0, 0})
