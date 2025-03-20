-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = nil

local isGameDetected = false -- Flag to check if the game is detected

if game.PlaceId == 155615604 then
    Window = OrionLib:MakeWindow({Name = "Prison Life - gooner hub", HidePremium = false, SaveConfig = true, ConfigFolder = "PrisonLifeHub"})
    isGameDetected = true
    
    -- MAIN Tab for Prison Life
    local Main = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998", -- replace with appropriate icon if desired
        PremiumOnly = false
    })

    -- Give Gun Dropdown
    Main:AddDropdown({
        Name = "Give Gun",
        Options = {"M9", "Remington 870", "AK-47"},
        Callback = function(v)
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        end
    })

    -- Gun Mod Dropdown
    Main:AddDropdown({
        Name = "Gun Mod (SERVER MAY LAG)",
        Options = {"M9", "Remington 870", "AK-47"},
        Callback = function(v)
            local module = nil
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
                module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
            elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
                module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
            end
            if module then
                module["MaxAmmo"] = math.huge
                module["CurrentAmmo"] = math.huge
                module["StoredAmmo"] = math.huge
                module["FireRate"] = 0.000001
                module["Spread"] = 0
                module["Range"] = math.huge
                module["Bullets"] = 10
                module["ReloadTime"] = 0.000001
                module["AutoFire"] = true
            end
        end
    })
    
    
elseif game.PlaceId == 3956818381 then
    Window = OrionLib:MakeWindow({Name = "Ninja Legends - gooner hub", HidePremium = false, SaveConfig = true, ConfigFolder = "NinjaLegendsHub"})
    isGameDetected = true
    
    -- MAIN Tab for Ninja Legends
    local Main = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998", -- replace with appropriate icon if desired
        PremiumOnly = false
    })

-- Auto Swing Toggle
    Main:AddToggle({
        Name = "Auto Swing",
        Default = false,
        Callback = function(v)
            getgenv().autoswing = v
            while getgenv().autoswing do
                for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if tool:FindFirstChild("ninjitsuGain") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                        break
                    end
                end
                local A_1 = "swingKatana"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1)
                wait(0.1)
            end
        end
    })

    -- Auto Sell Toggle
    Main:AddToggle({
        Name = "Auto Sell",
        Default = false,
        Callback = function(v)
            getgenv().autosell = v
            while getgenv().autosell do
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait(0.1)
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0, 0, 0)
                wait(0.1)
            end
        end
    })

    -- Unlock All Islands Button
    Main:AddButton({
        Name = "Unlock All Islands",
        Callback = function()
            local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _, island in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = island.CFrame
                wait(0.1)
            end
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
        end
    })

    -- Auto Buy All Swords Toggle
    Main:AddToggle({
        Name = "Auto Buy All Swords",
        Default = false,
        Callback = function(v)
            getgenv().buyswords = v
            while getgenv().buyswords do
                local A_1 = "buyAllSwords"
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2)
                wait(0.5)
            end
        end
    })

    -- Auto Buy All Belts Toggle
    Main:AddToggle({
        Name = "Auto Buy All Belts",
        Default = false,
        Callback = function(v)
            getgenv().buybelts = v
            while getgenv().buybelts do
                local A_1 = "buyAllBelts"
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2)
                wait(0.5)
            end
        end
    })
end


elseif game.PlaceId == 7606602544 or game.PlaceId == 7606564092 or game.PlaceId == 130207304381701 then
    Window = OrionLib:MakeWindow({Name = "Shrimp Game - gooner hub", HidePremium = false, SaveConfig = true, ConfigFolder = "ShrimpGameHub"})
    isGameDetected = true

    -- MAIN Tab for Shrimp Game
    local ShrimpMain = Window:MakeTab({
        Name = "Shrimp Game",
        Icon = "rbxassetid://4483345998", -- replace with appropriate icon if desired
        PremiumOnly = false
    })

    -- Notify function
    local function notify(title, message)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message
        })
    end

    local hide_cutscenes_state = true
    local auto_room_state = false
    local notifications_state = true
    local teleport_to_another = true
    local cookie_shape_state = false
    local cookie_shape_value = 2
    local skip_dalgona = false
    local six_legged_pentathlon = false
    local pentathlon_skip = false

    -- Setting up toggles
    ShrimpMain:AddToggle({
        Name = "Hide Cutscenes",
        Default = true,
        Callback = function(state)
            hide_cutscenes_state = state
        end
    })

    ShrimpMain:AddToggle({
        Name = "Auto Room",
        Default = false,
        Callback = function(state)
            auto_room_state = state
        end
    })

    ShrimpMain:AddToggle({
        Name = "Skip Dalgona",
        Default = false,
        Callback = function(state)
            skip_dalgona = state
        end
    })

    ShrimpMain:AddToggle({
        Name = "Cookie Shape",
        Default = false,
        Callback = function(state)
            cookie_shape_state = state
        end
    })

    -- Cookie Shape Dropdown
    local cookie_shapes = {"Circle", "Triangle", "Star", "Umbrella", "Mona Lisa"}
    ShrimpMain:AddDropdown({
        Name = "Cookie Shape",
        Options = cookie_shapes,
        Callback = function(selectedShape)
            cookie_shape_value = (selectedShape == "Circle" and 1) or 
                                (selectedShape == "Triangle" and 2) or 
                                (selectedShape == "Star" and 3) or 
                                (selectedShape == "Umbrella" and 4) or 
                                (selectedShape == "Mona Lisa" and 5)
        end
    })

    -- Red Light Green Light Button
    ShrimpMain:AddButton({
        Name = "Win Red Light Green Light",
        Callback = function()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.LightGameBlocker, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.LightGameBlocker, 1)
        end
    })

    -- Remove unsafe steps button for Stepping Stones
    ShrimpMain:AddButton({
        Name = "Remove Unsafe Steps",
        Callback = function()
            for _, v in pairs(workspace.SteppingStones.Tiles:GetChildren()) do
                for i = 1, 5 do
                    spawn(function()
                        pcall(function()
                            local step = v:GetChildren()[1]
                            local req = game:GetService("ReplicatedStorage").Remotes.Functions.GlassTester:InvokeServer(step)
                            if req == "safe" then
                                local ostep = v:GetChildren()[2]
                                ostep:Destroy()
                            elseif req == "unsafe" then
                                step:Destroy()
                            end
                        end)
                    end)
                end
            end
        end
    })

    -- Win Steps Button
    ShrimpMain:AddButton({
        Name = "Win Steps (use after remove)",
        Callback = function()
            for _, v in pairs(workspace.SteppingStones.Tiles:GetChildren()) do
                if #v:GetChildren() == 1 then
                    local step = v:GetChildren()[1]
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, step, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, step, 1)
                end
                wait(0.1)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Maps["Stepping Stones"].End.Build.SteppingStonesGate.Barrier.CFrame + Vector3.new(-10, -6, 0)
        end
    })

    -- Setting up the MiniGames' Execution Loop
    getrenv().pentathlon_s = function(args)
        if args[2] == "Start Game" then
            six_legged_pentathlon = true
            spawn(function()
                while task.wait() and six_legged_pentathlon do
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Start Minigame", 1)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Minigame Complete", "Ddakji")
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Throw Envelope", 60)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Start Minigame", 2)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Throw Stone", 60)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Minigame Complete", "Biseokchigi")
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Start Minigame", 3)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Minigame Complete", "Gonggi")
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Start Minigame", 4)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Throw Spinning Top", 60)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Start Minigame", 5)
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Minigame Complete", "Jegi")
                    game:GetService("ReplicatedStorage").Remotes.Events.EffectsEvent:FireServer("Pentathlon Complete")
                end
            end)
        elseif args[2] == "Stop Game" then
            six_legged_pentathlon = false
            -- Logic to stop game...
        end
    end

    -- Teleport Dropdown for Shrimp Game
    local convert_teleport_table = {
        Lobby = CFrame.new(-138, 7, -59),
        ["Red Light Green Light"] = CFrame.new(142, 4, 164),
        Honeycombs = CFrame.new(-428, 4, 88),
        Mingle = CFrame.new(1160, 8, -81),
        ["Tug of War"] = CFrame.new(-1772, -52, -64),
        ["Stepping Stones"] = CFrame.new(775, 52, -1852),
        ["Squid Game"] = CFrame.new(336, 4, 255),
        Marbles = CFrame.new(-1596, -70, 773),
        ["Six Legged Pentathlon"] = CFrame.new(-167, 8, -565),
        ["Piggy Bank"] = CFrame.new(-77, 20, -58)
    }
    
    ShrimpMain:AddDropdown({
        Name = "Teleport",
        Options = {"Lobby", "Red Light Green Light", "Honeycombs", "Mingle", "Tug of War", "Stepping Stones", "Squid Game", "Marbles", "Six Legged Pentathlon", "Piggy Bank"},
        Callback = function(teleportLocation)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = convert_teleport_table[teleportLocation]
        end
    })

else
    Window = OrionLib:MakeWindow({Name = "Universal - gooner hub", HidePremium = false, SaveConfig = true, ConfigFolder = "UniversalHub"})
end

-- Universal Modifiers Tab
local UniversalModifiersTab = Window:MakeTab({
    Name = "Universal Modifiers",
    Icon = "rbxassetid://4483345998", -- replace with appropriate icon if desired
    PremiumOnly = false
})

-- Walkspeed Slider
UniversalModifiersTab:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 250,
    Default = 16,
    Increment = 1,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

-- Jumppower Slider
UniversalModifiersTab:AddSlider({
    Name = "Jumppower",
    Min = 50,
    Max = 250,
    Default = 50,
    Increment = 1,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end
})

-- Universal Scripts Tab
local UniversalScriptsTab = Window:MakeTab({
    Name = "Universal Scripts/Hubs",
    Icon = "rbxassetid://4483345998", -- replace with appropriate icon if desired
    PremiumOnly = false
})

local UniversalScriptsSection = UniversalScriptsTab:AddSection({
    Name = "Main"
})

-- Skibidi Hub
UniversalScriptsSection:AddButton({
    Name = "Skibidi Hub",
    Callback = function()
        loadstring(game:HttpGet('https://gitlab.com/skibidi7575006/skibidiidi/-/raw/main/SKIBIDIIHUBB'))()
    end
})

-- Boombox Hubs
UniversalScriptsSection:AddButton({
    Name = "Boombox Hubs",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/cGh1HHUv'))()
    end
})

-- Piano Auto Play
UniversalScriptsSection:AddButton({
    Name = "Piano Auto Play",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Madness676/3.2Lol/main/AutoPiano3-2.lua", true))()
    end
})

-- IY
UniversalScriptsSection:AddButton({
    Name = "IY (Infinite Yield Admin)",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

-- CMD X
UniversalScriptsSection:AddButton({
    Name = "CMD X (FE Admin)",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end
})

-- jerk off
UniversalScriptsSection:AddButton({
    Name = "Jerk Off (R15 ONLY)",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/Jqhjtjpt/raw"))()
end
})

-- freaky fling gui
UniversalScriptsSection:AddButton({
    Name = "Kawaii Freaky Fling GUI",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua", true))()
end
})

-- freaky fling gui
UniversalScriptsSection:AddButton({
    Name = "Kawaii Chat Bypass",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()end
})

-- Forge Hub
UniversalScriptsSection:AddButton({
    Name = "Forge Hub",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
end
})

-- starry hub
UniversalScriptsSection:AddButton({
    Name = "Starry Hub",
    Callback = function()
loadstring(game:HttpGet("https://luau.tech/build"))()
end
})

-- remote spy
UniversalScriptsSection:AddButton({
    Name = "Remote Spy",
    Callback = function()
loadstring(game:HttpGet("https://paste.ee/r/hK1Q4D65"))()
end
})

-- fates admin
UniversalScriptsSection:AddButton({
    Name = "Fates Admin",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
end
})

-- E
UniversalScriptsSection:AddButton({
    Name = "Aimbot V3",
    Callback = function()
local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
Aimbot.Load()
end
})

-- E
UniversalScriptsSection:AddButton({
    Name = "Universal ESP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AgungHari/Universal-ESP-For-Roblox/main/ver1.lua"))()
end
})

-- E
UniversalScriptsSection:AddButton({
    Name = "Remote Spy",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/X0fiTdSG/raw"))()
end
})


-- Finish the script
OrionLib:Init()  -- Make sure to initialize the Orion library
