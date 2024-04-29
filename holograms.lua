local inside = false
local hologram1 = lib.points.new({
    coords = vec3(-1611.3025, 173.2842, 59.7554),
    distance = 20,
    onEnter = function ()
        inside = true
    end,
    onExit = function ()
        inside = false
    end
})

--[[local hologram2 = lib.points.new({
    coords = vec3(-1611.3025, 173.2842, 59.7554),
    distance = 20,
    onEnter = function ()
        inside = true
    end,
    onExit = function ()
        inside = false
    end
})--]] --you can make more locations easily like this :)

local function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, true)    
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov   
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(true)
    SetTextColour(250, 250, 250, 255)     -- You can change the text color here
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        if inside then
            Citizen.Wait(0) -- you can add bit more wait but it starts to flash this is perfect
            -- https://docs.fivem.net/docs/game-references/text-formatting/ there you can read more text formating options
            Draw3DText(-1611.3025, 173.2842, 58.6554, "Hello!", 4, 0.1, 0.1)      
            Draw3DText(-1611.3025, 173.2842, 58.8554, "you can make it have many rows ~n~ like this!", 4, 0.1, 0.1)    
            Draw3DText(-1611.3025, 173.2842, 59.1554, "~g~ text 6", 4, 0.1, 0.1)
            Draw3DText(-1611.3025, 173.2842, 59.3554, "~r~ text 7", 4, 0.1, 0.1)
        else
            Citizen.Wait(500)
        end
    end
end)