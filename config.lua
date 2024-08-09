Config = {}

Config.InteractionPoints = {
    Cleaning = {
        label = 'Clean the Area',
        coords = {
            vec3(1964.91,3747.73,32.34),
            vec3(1708.01,4929.44,42.06),
            vec3(1736.60,6412.06,35.04),
            vec3(-3244.03,1009.40,12.83),
            vec3(167.16,6640.98,31.70)
        },
        canInteract = function(entity, coords, args)
            return true
        end,
        action = function(entity, coords, args)
            -- Play cleaning animation and show progress bar
            local playerPed = PlayerPedId()
            local animDict = "amb@world_human_maid_clean@"
            local animName = "base"
            local duration = args.duration * 1000 -- Convert to milliseconds

            -- Load animation dictionary
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(100)
            end

            -- Show progress bar and play animation
            exports['mythic_progbar']:Progress({
                name = "cleaning",
                duration = duration,
                label = "Cleaning...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = animDict,
                    anim = animName,
                    flags = 49,
                },
                prop = {
                    model = nil,
                },
                propTwo = {
                    model = nil,
                },
            }, function(status)
                if not status then
                    print("Cleaning completed", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('server:CleaningEvent', playerPed, coords, args)
                    TriggerEvent('client:CleaningEvent', playerPed, coords, args)
                else
                    print("Cleaning canceled", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                end
            end)

            -- Play animation
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
        end,
        serverEvent = "server:CleaningEvent",
        event = "client:CleaningEvent",
        args = {
            tool = 'broom',
            duration = 5
        }
    },
    CountingMoney = {
        label = 'Count Money',
        coords = {
            vec3(1958.87,3741.99,32.34),
            vec3(1696.60,4923.97,42.06),
            vec3(1727.78,6415.23,35.04),
            vec3(-3242.29,999.92,12.83),
            vector3(587.6, 143.2, 109.8),
            vector3(487.6, 43.2, 109.8),
            vec3(160.18,6641.34,31.70)
        },
        canInteract = function(entity, coords, args)
            return true
        end,
        action = function(entity, coords, args)
            -- Play counting money animation and show progress bar
            local playerPed = PlayerPedId()
            local animDict = "amb@prop_human_atm@male@idle_a"
            local animName = "idle_c"
            local duration = args.duration * 1000 -- Convert to milliseconds

            -- Load animation dictionary
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(100)
            end

            -- Show progress bar and play animation
            exports['mythic_progbar']:Progress({
                name = "counting_money",
                duration = duration,
                label = "Counting Money...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = animDict,
                    anim = animName,
                    flags = 49,
                },
                prop = {
                    model = nil,
                },
                propTwo = {
                    model = nil,
                },
            }, function(status)
                if not status then
                    print("Money counting completed", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('server:MoneyCountingEvent', playerPed, coords, args)
                    TriggerEvent('client:MoneyCountingEvent', playerPed, coords, args)
                else
                    print("Money counting canceled", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                end
            end)

            -- Play animation
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
        end,
        serverEvent = "server:MoneyCountingEvent",
        event = "client:MoneyCountingEvent",
        args = {
            amount = 1000,
            currency = 'USD',
            duration = 5
        }
    },
    StockingShelves = {
        label = 'Stock Shelves',
        coords = {
            vec3(1965.43,3745.20,32.34),
            vec3(1703.80,4927.79,42.06),
            vec3(1729.21,6413.47,35.04),
            vec3(-3241.91,1006.61,12.83),
            vec3(165.57,6639.11,31.70)
        },
        canInteract = function(entity, coords, args)
            return true
        end,
        action = function(entity, coords, args)
            -- Play stocking shelves animation and show progress bar
            local playerPed = PlayerPedId()
            local animDict = "anim@mp_snowball"
            local animName = "pickup_snowball"
            local duration = args.duration * 1000 -- Convert to milliseconds

            -- Load animation dictionary
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(100)
            end

            -- Show progress bar and play animation
            exports['mythic_progbar']:Progress({
                name = "stocking_shelves",
                duration = duration,
                label = "Stocking Shelves...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = animDict,
                    anim = animName,
                    flags = 49,
                },
                prop = {
                    model = nil,
                },
                propTwo = {
                    model = nil,
                },
            }, function(status)
                if not status then
                    print("Stocking shelves completed", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('server:StockingShelvesEvent', playerPed, coords, args)
                    TriggerEvent('client:StockingShelvesEvent', playerPed, coords, args)
                else
                    print("Stocking shelves canceled", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                end
            end)

            -- Play animation
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
        end,
        serverEvent = "server:StockingShelvesEvent",
        event = "client:StockingShelvesEvent",
        args = {
            duration = 5
        }
    },
    PouringDrinks = {
        label = 'Pour Drinks',
        coords = {
            vec3(1959.75,3744.75,32.34),
            vec3(1703.99,4924.72,42.06),
            vec3(1732.38,6417.80,35.04),
            vec3(-3246.29,1002.87,12.83),
            vec3(169.58,6638.72,31.70)
        },
        canInteract = function(entity, coords, args)
            return true
        end,
        action = function(entity, coords, args)
            -- Play pouring drinks animation and show progress bar
            local playerPed = PlayerPedId()
            local animDict = "anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal"
            local animName = "pour_one"
            local duration = args.duration * 1000 -- Convert to milliseconds

            -- Load animation dictionary
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(100)
            end

            -- Show progress bar and play animation
            exports['mythic_progbar']:Progress({
                name = "pouring_drinks",
                duration = duration,
                label = "Pouring Drinks...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = animDict,
                    anim = animName,
                    flags = 49,
                },
                prop = {
                    model = nil,
                },
                propTwo = {
                    model = nil,
                },
            }, function(status)
                if not status then
                    print("Pouring drinks completed", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('server:PouringDrinksEvent', playerPed, coords, args)
                    TriggerEvent('client:PouringDrinksEvent', playerPed, coords, args)
                else
                    print("Pouring drinks canceled", entity, coords, json.encode(args))
                    ClearPedTasksImmediately(playerPed)
                end
            end)

            -- Play animation
            TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
        end,
        serverEvent = "server:PouringDrinksEvent",
        event = "client:PouringDrinksEvent",
        args = {
            duration = 5
        }
    }
    -- Add more interaction types as needed
}
