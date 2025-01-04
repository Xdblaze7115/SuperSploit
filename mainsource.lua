if Game.PlaceId == 5118969548 then
    local Player = game:GetService("Players").Localplayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/source.lua", true))()
    
    local Window = Library:CreateLibrary("SuperSploit Hub")
    
    local Tab = Window:CreateTab("Tab")
    
    local options = {"Blue Key", "Orange Key", "Green Key", "Purple Key", "Purple Key", "Silver Key", "Yellow Key", "Battery", "Crowbar", "Ladder", "Wrench", "Bug Spray", "C4"}
    local Dropdown = Window:CreateDropDown("Items", options, function(selectedOption)
        Player.Character.HumanoidRootPart.CFrame = ReplicatedStorage.assets.items[selectedOption].Hitbox.CFrame
    end)
