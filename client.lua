-- Load the config file
Config = {}
local configFile = LoadResourceFile(GetCurrentResourceName(), "config.lua")
assert(load(configFile))()

local function isPlayerNearCoords(coords, radius)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - coords)
    return distance <= radius
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Run every frame

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for interactionType, point in pairs(Config.InteractionPoints) do
            for _, coords in ipairs(point.coords) do
                if isPlayerNearCoords(coords, 0.6) then -- Change the 5.0 to the desired interaction radius
                    if point.canInteract(playerPed, playerCoords, point.args) then
                        DisplayHelpTextThisFrame("Press ~q~E ~w~to " .. point.label)
                        
                        if IsControlJustReleased(0, 38) then -- E key
                            point.action(playerPed, playerCoords, point.args)
                        end
                    end
                end
            end
        end
    end
end)

function DisplayHelpTextThisFrame(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

-- Define store coordinates
local storeCoords = {
    vec3(-3244.43,1003.17,12.83),  -- Example coordinates for 24/7 stores
    vec3(1961.87,3742.90,32.34),
    vec3(1731.29,6415.70,35.04),
    vec3(-710.40,-911.93,19.22),
    vec3(27.46,-1345.81,29.50),
    vector3(2560.0, 371.0, 108.6),
    vec3(1161.49,-322.55,69.21),
    vec3(1700.60,4924.82,42.06),
    vec3(163.97,6640.72,31.70),
    -- Add more store coordinates as needed
}

-- Function to create blips for 24/7 stores
local function createStoreBlips()
    for _, coords in ipairs(storeCoords) do
        local blip = AddBlipForCoord(coords)
        SetBlipSprite(blip, 52) -- 52 is the sprite ID for the convenience store icon
        SetBlipScale(blip, 1.0) -- Adjust the scale of the blip
        SetBlipColour(blip, 2) -- Set the color of the blip (2 is green, you can change this)
        BeginTextCommandSetBlipName("STRING")
        SetBlipAsShortRange(blip, true)
        AddTextComponentSubstringPlayerName("24/7 Store")
        EndTextCommandSetBlipName(blip)
    end
end

-- Call the function to create blips when the resource starts
Citizen.CreateThread(function()
    createStoreBlips()
end)

