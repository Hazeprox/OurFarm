--[[
Skrypt Dla fSantos.pl
Wykonawca: Haze
Kontakt: zmuda20011@gmail.com, Skype: zmuda20011

]]
addEvent("addNotif",true)
local screenW, screenH = guiGetScreenSize()

tytul = ""
opis = ""
start = nil
addNotif = false

r,g,b = 255,255,255 	

	function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
		if 
			type( sEventName ) == 'string' and 
			isElement( pElementAttachedTo ) and 
			type( func ) == 'function' 
		then
			local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
			if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
				for i, v in ipairs( aAttachedFunctions ) do
					if v == func then
						return true
					end
				end
			end
		end

		return false
	end

    function dxDraw()
	    if addNotif == true then
			local now = getTickCount()
			local endTime = start + 2000
			local elapsedTime = now - start
			local duration = endTime - start
			local progress = elapsedTime / duration
			local x1,_,_ = interpolateBetween( screenW, 0, 0, screenW * 0.7116, 0, 0, progress, "OutQuad")
			dxDrawRectangle(x1, screenH * 0.7799, screenW * 0.2606, screenH * 0.1393, tocolor(3, 2, 2, 150), false)
			dxDrawRectangle(x1, screenH * 0.7500, screenW * 0.2606, screenH * 0.0299, tocolor(r, g, b, 255), false)
			dxDrawText(tostring(tytul), x1, screenH * 0.7500, screenW * 0.9722, screenH * 0.7799, tocolor(255, 255, 255, 255), 1.10, "default", "center", "center", false, false, false, false, false)
			dxDrawText(tostring(opis), x1+5, screenH * 0.7878, screenW * 0.9693, screenH * 0.9141, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, true, false, false, false)
		elseif addNotif == ending then
			local now = getTickCount()
			local endTime = start + 2000
			local elapsedTime = now - start
			local duration = endTime - start
			local progress = elapsedTime / duration
			local x1,_,_ = interpolateBetween( screenW * 0.7116, 0, 0, screenW*1.1, 0, 0, progress, "OutQuad")
			dxDrawRectangle(x1, screenH * 0.7799, screenW * 0.2606, screenH * 0.1393, tocolor(3, 2, 2, 150), false)
			dxDrawRectangle(x1, screenH * 0.7500, screenW * 0.2606, screenH * 0.0299, tocolor(r, g, b, 255), false)
			dxDrawText(tostring(tytul), x1, screenH * 0.7500, screenW * 0.9722, screenH * 0.7799, tocolor(255, 255, 255, 255), 1.10, "default", "center", "center", false, false, false, false, false)
			dxDrawText(tostring(opis), x1, screenH * 0.7878, screenW * 0.9693, screenH * 0.9141, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, true, false, false, false)
		
		end
	end
	
	function addNotiff(tytult,opist,czas,r2,g2,b2)
		if tytult and opist and tonumber(czas) and not isEventHandlerAdded("onClientRender", root,dxDraw) then
			opis = opist
			tytul = tytult
			start = getTickCount()
			r,g,b = r2,g2,b2
			addNotif = true
			addEventHandler("onClientRender", root,dxDraw)
			createTrayNotification( "Hello World", "warning" )
				setTimer(function()
					removeEventHandler("onClientRender", root,dxDraw)
					start = getTickCount()
					addNotif = ending
					addEventHandler("onClientRender", root,dxDraw)
					setTimer(function()
						removeEventHandler("onClientRender", root,dxDraw)
						addNotif = false
					end,4000,1)
				end,1000*czas,1)
		end
	end
addEventHandler("addNotif",root,addNotiff)



