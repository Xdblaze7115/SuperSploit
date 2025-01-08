if Game.PlaceId == 6000468131 then
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	_G.TagEsp = false
	_G.LimbEsp = false
	_G.ItemEsp = false

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/source.lua", true))()

	local Window = Library:CreateLibrary("SuperSploit", "Granny")

	local Tab = Window:CreateTab("Player")

	local Slider = Window:CreateSlider("WalkSpeed", 100, function(value)
		if Players.LocalPlayer.Character then
			Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = value
		end
	end)

	local Slider = Window:CreateSlider("JumpPower", 100, function(value)
		if Players.LocalPlayer.Character then
			Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = value
		end
	end)

	local Tab = Window:CreateTab("Visual")

	local Label = Window:CreateLabel("ESP")

	local Toggle = Window:CreateToggle("TagEsp", function(state)
		if state then
			_G.TagEsp = true
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					AddTagEsp(plr)
				end
			end
			Players.PlayerAdded:Connect(function(plr)
				if _G.TagEsp then
					plr.CharacterAdded:Connect(function()
						wait(1)
						if plr ~= Players.LocalPlayer then
							AddTagEsp(plr)
						end
					end)
				end
			end)
		else
			_G.TagEsp = false
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					RemoveTagEsp(plr)
				end
			end
		end
	end)

	local Toggle = Window:CreateToggle("LimbEsp", function(state)
		if state then
			_G.LimbEsp = true
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					AddLimbEsp(plr)
				end
			end
			Players.PlayerAdded:Connect(function(plr)
				if _G.LimbEsp then
					plr.CharacterAdded:Connect(function()
						wait(1)
						if plr ~= Players.LocalPlayer then
							AddLimbEsp(plr)
						end
					end)
				end
			end)
		else
			_G.LimbEsp = false
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					RemoveLimbEsp(plr)
				end
			end
		end
	end)

	local Toggle = Window:CreateToggle("ItemEsp", function(state)
		local MapLocation, CharacterLocation

		for _, v in pairs(workspace.Map:GetChildren()) do
			if v:FindFirstChild("Tools") then
				MapLocation = v.Tools:FindFirstChild("Map")
				CharacterLocation = v.Tools:FindFirstChild("Character")
			end
		end

		if state then
			_G.ItemEsp = true

			if MapLocation or CharacterLocation then
				AddItemEsp(MapLocation, CharacterLocation)
			else
				warn("Item locations not found!")
			end

			ReplicatedStorage.Game.Start.Changed:Connect(function(value)
				if value and _G.ItemEsp then
					for _, v in pairs(workspace.Map:GetChildren()) do
						if v:FindFirstChild("Tools") then
							MapLocation = v.Tools:FindFirstChild("Map")
							CharacterLocation = v.Tools:FindFirstChild("Character")
						end
					end

					if MapLocation or CharacterLocation then
						AddItemEsp(MapLocation, CharacterLocation)
					else
						warn("Item locations not found on game start!")
					end
				end
			end)
		else
			_G.ItemEsp = false
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
					if v.Name == "ItemNameEsp" or v.Name == "ItemEsp" then
						v:Destroy()
					end
				end
			end
		end
	end)

	function AddTagEsp(plr)
		if plr.Character then
			local char = plr.Character

			local Esp = Instance.new("BillboardGui")
			Esp.Parent = char:WaitForChild("Head")
			Esp.Name = "NameEsp"
			Esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			Esp.AlwaysOnTop = true
			Esp.Size = UDim2.new(2, 0, 2, 0)
			Esp.StudsOffset = Vector3.new(0, 2, 0)

			local Frame = Instance.new("Frame")
			Frame.Parent = Esp
			Frame.BackgroundTransparency = 1
			Frame.Size = UDim2.new(1, 0, 1, 0)

			local Name = Instance.new("TextLabel")
			Name.Parent = Frame
			Name.Size = UDim2.new(1, 0, 1, 0)
			Name.Position = UDim2.new(0, 0, 0, 0)
			Name.Font = Enum.Font.FredokaOne
			Name.Text = plr.Name
			Name.TextColor3 = Color3.new(1, 1, 1)
			Name.BackgroundTransparency = 1
			Name.TextScaled = true
		end
	end

	function RemoveTagEsp(plr)
		if plr.Character and plr.Character:FindFirstChild("Head") then
			local head = plr.Character.Head
			if head:FindFirstChild("NameEsp") then
				head.Esp:Destroy()
			end
		end
	end

	function AddLimbEsp(plr)
		if plr.Character then
			local char = plr.Character
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("BasePart") and not part:FindFirstChild("LimbEsp") then
					for _, face in pairs(Enum.NormalId:GetEnumItems()) do
						local Esp = Instance.new("SurfaceGui")
						Esp.Name = "LimbEsp"
						Esp.Parent = part
						Esp.Face = face
						Esp.AlwaysOnTop = true
						Esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

						local Box = Instance.new("Frame")
						Box.Parent = Esp
						Box.Size = UDim2.new(1, 0, 1, 0)
						Box.BackgroundColor3 = Color3.new(1, 1, 1)
						Box.BackgroundTransparency = 0.5
						Box.BorderSizePixel = 0
					end
				end
			end
		end
	end

	function RemoveLimbEsp(plr)
		if plr.Character then
			for _, part in pairs(plr.Character:GetChildren()) do
				if part:IsA("BasePart") then
					for _, child in pairs(part:GetChildren()) do
						if child:IsA("SurfaceGui") and child.Name == "LimbEsp" then
							child:Destroy()
						end
					end
				end
			end
		end
	end

	function AddItemEsp(location, location2)
		local function CreateEspForItem(item)
			if not item:FindFirstChild("Handle") then
				warn("Item missing Handle: ", item.Name)
				return
			end

			local Handle = item.Handle

			local Billboard = Instance.new("BillboardGui")
			Billboard.Parent = Handle
			Billboard.Name = "ItemNameEsp"
			Billboard.AlwaysOnTop = true
			Billboard.Size = UDim2.new(2, 0, 2, 0)
			Billboard.StudsOffset = Vector3.new(0, 2, 0)

			local Label = Instance.new("TextLabel")
			Label.Parent = Billboard
			Label.Size = UDim2.new(1, 0, 1, 0)
			Label.Font = Enum.Font.FredokaOne
			Label.Text = item.Name
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.BackgroundTransparency = 1
			Label.TextScaled = true

			for _, face in pairs(Enum.NormalId:GetEnumItems()) do
				local Surface = Instance.new("SurfaceGui")
				Surface.Name = "ItemEsp"
				Surface.Parent = Handle
				Surface.Face = face
				Surface.AlwaysOnTop = true

				local Frame = Instance.new("Frame")
				Frame.Parent = Surface
				Frame.Size = UDim2.new(1, 0, 1, 0)
				Frame.BackgroundColor3 = Color3.new(1, 1, 1)
				Frame.BackgroundTransparency = 0.5
			end
		end

		if location then
			for _, item in pairs(location:GetChildren()) do
				CreateEspForItem(item)
			end
		end

		if location2 then
			for _, item in pairs(location2:GetChildren()) do
				CreateEspForItem(item)
			end
		end
	end

	function RemoveItemEsp(location, location2)
		for _, item in pairs(location:GetChildren()) do
			if item:IsA("BasePart") then
				for _, child in pairs(item:GetChildren()) do
					if child.Name == "LimbEsp" or child.Name == "NameEsp" then
						child:Destroy()
					end
				end
			end
		end
		if location2 ~= nil then
			for _, item in pairs(location2:GetChildren()) do
				if item:IsA("BasePart") then
					for _, child in pairs(item:GetChildren()) do
						if child.Name == "LimbEsp" or child.Name == "NameEsp" then
							child:Destroy()
						end
					end
				end
			end
		end
	end
end
