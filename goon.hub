-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = nil

local isGameDetected = false -- Flag to check if the game is detected

if game.PlaceId == 155615604 then
    Window = OrionLib:MakeWindow({Name = "Prison Life - gooner hub", HidePremium = false, SaveConfig = true, ConfigFolder = "PrisonLifeHub"})

    isGameDetected = true
    
    -- MAIN Tab
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

    -- MAIN Tab
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

-- Universal Part
if not isGameDetected then
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
