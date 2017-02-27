local marker = createMarker(2193.57, -1973.62, 12.56, "cylinder", 1, 255, 255, 255, 55)

        window = guiCreateWindow(0.31, 0.31, 0.38, 0.39, "Praca", true)
        guiWindowSetMovable(window, false)
        guiWindowSetSizable(window, false)
        rozpocznij = guiCreateButton(0.58, 0.79, 0.40, 0.18, "Rozpocznij", true, window)
        zamknij = guiCreateButton(0.02, 0.79, 0.40, 0.18, "Zamknij", true, window)
        opis = guiCreateLabel(0.02, 0.09, 0.96, 0.66, "blablabla praca blablabla pieniadze", true, window)
        guiLabelSetHorizontalAlign(opis, "center", false)    
        guiSetVisible(window, false)
        
addEventHandler("onClientMarkerHit", marker, function(el, md)
    if el == localPlayer and md then
    guiSetVisible(window, true)
    showCursor(true)
    end
end)

addEventHandler("onClientMarkerLeave", marker, function(el, md)
    if el == localPlayer and md then
    guiSetVisible(window, false)
    showCursor(false)
    end
end)

timer = false
addEventHandler("onClientGUIClick",root,function()
    if source == zamknij then
    guiSetVisible(window, false)
    showCursor(false)
    elseif source == rozpocznij and not timer then
    triggerServerEvent("sprawdzPrace", localPlayer, getElementData(localPlayer,"login"), 1)
    timer = true
        setTimer(function()
        timer = false
        end,1000,1)
    end
end)