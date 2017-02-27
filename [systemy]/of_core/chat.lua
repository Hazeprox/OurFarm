local chatRadius = 20 


function sendMessageToNearbyPlayers(message, messageType)
    if messageType == 0 then
	cancelEvent()
        local posX, posY, posZ = getElementPosition( source )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            outputChatBox( "#666666(local)"..getPlayerName(source).."#ffffff:#666666 "..message, nearbyPlayer,255,255,255,true )
        end
    end
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )

addCommandHandler("globalchat",function(plr,cmd, ...)
	if getPlayerRank(plr) == "Admin" or getPlayerRank(plr) == "Developer" or getPlayerRank(plr) == "Rcon" or getPlayerRank(plr) == "Support" or getPlayerRank(plr) == "Premium" then
	local text = table.concat({...}, " ")
		if text then
			outputChatBox("#ff0000(#ffa500"..getPlayerRank(plr).."#ff0000)#ffffff"..getPlayerName(plr)..": "..text,root,255,255,255,true)

		end
	end
end)
