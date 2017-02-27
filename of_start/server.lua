addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
	if string.find(getResourceName(v), "of-") or string.find(getResourceName(v), "of_") then
        stopResource(v)
        outputDebugString(getResourceName(v).." stopped.")
	end
    end
outputChatBox("Skrypty zostały #ff0000wyłączone", getRootElement(), 255, 255, 255, true)
end)


addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
    if string.find(getResourceName(v), "of-") or string.find(getResourceName(v), "of") then
        startResource(v)
        outputDebugString(getResourceName(v).." started.")
        end
    end
end)