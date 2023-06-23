local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
    local window = library:Window("Main")
    local window2 = library:Window("Misc")
    window:Toggle("Farm Bounty", false, function(bool)
        if game.Players.LocalPlayer.Stats.Rep.Value >= 100000 then
            _G.FarmBou = bool
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Rank Z Only!!!";
                Duration = 1;
                Text = "By.GZE#6591";
            })
            wait(0.1)
        end
    end)
    window:Toggle("Farm Hostage", false, function(bool)
        _G.FarmHos = bool
    end)
    window2:Button("Reset Character", function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)
    window2:Toggle("Instant Kill(Mini Lag)", false, function(bool)
        _G.INSTANT = bool
    end)
    window2:Toggle("Saft Mode", false, function(bool)
        _G.Saft = bool
    end)
    window2:Slider("Min Health",0,9999,0, function(value)
        _G.Min = value
    end)
    window2:Slider("Max Health",0,9999,0, function(value)
        _G.Max = value
    end)
    window2:Button("HopServer", function()
        local Player = game.Players.LocalPlayer    
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local _place,_id = game.PlaceId, game.JobId
        local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
        function ListServers(cursor)
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
        return Http:JSONDecode(Raw)
        end
        local Next; repeat
        local Servers = ListServers(Next)
        for i,v in next, Servers.data do
            if v.playing < v.maxPlayers and v.id ~= _id then
                local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
                if s then break end
            end
        end
        Next = Servers.nextPageCursor
        until not Next
    end)
    window:Label("Credits to GZE450#6591", Color3.fromRGB(127, 143, 166))
    window2:Label("Credits to GZE450#6591", Color3.fromRGB(127, 143, 166))
    library:Keybind("P")
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Saft then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= _G.Min then
                        local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -200, 0)
                        wait(.15)
                        local Seat = Instance.new('Seat', game.Workspace)
                        Seat.Anchored = false
                        Seat.CanCollide = false
                        Seat.Name = 'invischair'
                        Seat.Transparency = 1
                        Seat.Position = Vector3.new(0, -200, 0)
                        local Weld = Instance.new("Weld", Seat)
                        Weld.Part0 = Seat
                        Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
                        wait()
                        Seat.CFrame = savedpos
                        return false
                    elseif game:GetService("Players").LocalPlayer.Character.Humanoid.Health >= _G.Max then
                        workspace:FindFirstChild('invischair'):Remove()
                        return false
                    else
                        wait(0.1)
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            wait()
            if _G.FarmBou == true then
                for i,v in pairs(game:GetService("Workspace").Game.Characters:GetDescendants()) do
                    if v.Name == "Villain" and v:FindFirstChild("AI") and v.Humanoid.Health < 7500 then
                        v.Humanoid.Health = 0
                    end
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            wait()
            pcall(function()
                if _G.FarmBou == true then
                    if game:GetService("Workspace").Game.Characters:FindFirstChild("Villain") then
                        for i,v in pairs(game:GetService("Workspace").Game.Characters:GetDescendants()) do
                            if v.Name == "Villain" and v:FindFirstChild("AI") and v.Humanoid.Health > 0 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,2.5)
                            end
                        end
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Map.InteractableNPCS["Hero Association Recruiter"].HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                        wait(0.1)
                        fireproximityprompt(game:GetService("Workspace").Game.Map.InteractableNPCS["Hero Association Recruiter"].HumanoidRootPart.ProximityPrompt)
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            wait()
            pcall(function()
                if _G.FarmBou == true then
                    if game:GetService("Workspace").Game.Characters:FindFirstChild("Villain") then
                        local ohString1 = "Punch"
                        game:GetService("Players").LocalPlayer.Backpack.Client.re:FireServer(ohString1)
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            wait()
            if _G.FarmHos == true then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Quests.Quests.QuestTemplate.Visible == true and game:GetService("Players").LocalPlayer.PlayerGui.Quests.Quests.QuestTemplate.Main.Title.Text == "Hostage Incident" then
                        for i,v in pairs(game:GetService("Workspace").Game.Characters.hostages:GetDescendants()) do
                            if string.find(v.Name,"Hostage") and v:FindFirstChild("AI") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,2.5)
                                wait(0.1)
                                fireproximityprompt(v.HumanoidRootPart.unhostage)
                            end
                        end
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Map.InteractableNPCS["Domen Eiko"].HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
                        wait(0.1)
                        fireproximityprompt(game:GetService("Workspace").Game.Map.InteractableNPCS["Domen Eiko"].HumanoidRootPart.ProximityPrompt)
                    end
                end)
            end
        end
    end)
    -----------------------------------------------------------------------------------------------------
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Villain" and v:FindFirstChild("AI") and v.Humanoid.Health <= 7500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Bald Tanktop" and v:FindFirstChild("AI") and v.Humanoid.Health < 2500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Bandit" and v:FindFirstChild("AI") and v.Humanoid.Health < 100 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Bike Rider" and v:FindFirstChild("AI") and v.Humanoid.Health < 500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Demon Cyborg" and v:FindFirstChild("AI") and v.Humanoid.Health < 850 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Hammer Head" and v:FindFirstChild("AI") and v.Humanoid.Health < 500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Jeff The Stealer" and v:FindFirstChild("AI") and v.Humanoid.Health < 100 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Ocean Lord" and v:FindFirstChild("AI") and v.Humanoid.Health < 850 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Police Officer" and v:FindFirstChild("AI") and v.Humanoid.Health < 220 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Strong Bandit" and v:FindFirstChild("AI") and v.Humanoid.Health < 250 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Vaccine Man" and v:FindFirstChild("AI") and v.Humanoid.Health < 2500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Weak Hero" and v:FindFirstChild("AI") and v.Humanoid.Health < 450 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Weak Monster" and v:FindFirstChild("AI") and v.Humanoid.Health < 450 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Kabuto" and v:FindFirstChild("AI") and v.Humanoid.Health < 9999 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "MK-Exterminator Model 130" and v:FindFirstChild("AI") and v.Humanoid.Health < 19999 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.INSTANT == true then
                for i,v in pairs(game.Workspace.Game.Characters:GetDescendants()) do
                    if v.Name == "Hero" and v:FindFirstChild("AI") and v.Humanoid.Health <= 7500 then
                        v.Humanoid.Health = 0
                    end 
                end
            end
        end
    end)
    -----------------------------------------------------------------------------------------------------

    spawn(function()
        while wait() do
            setting = settings().Network
            local Effect = Instance.new("ColorCorrectionEffect")
            Effect.Parent = game.Lighting
            Effect.Saturation = -1
            Effect.Brightness = 0
            Effect.Contrast = 0
            toggle = false
            Effect.Enabled = false
            function onKeyPress(inputObject, gameProcessedEvent)
            if inputObject.KeyCode == Enum.KeyCode.P then
            if toggle == false then
            setting.IncomingReplicationLag = 1000
            Effect.Enabled = true
            toggle = true
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed * 3
            else
            setting.IncomingReplicationLag = 0
            Effect.Enabled = false
            toggle = false
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
            end
            end
            game:GetService("UserInputService").InputBegan:connect(onKeyPress)
        end
    end)
