if Game.PlaceId == 6000468131 then
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/source.lua", true))()
	local EspSettings = { TagEsp = false, LimbEsp = false, ItemEsp = false }

	local Window = Library:CreateLibrary("SuperSploit", "Granny")

	-- Player Tab
	local PlayerTab = Window:CreateTab("Player")
	PlayerTab:CreateSlider("WalkSpeed", 100, function(value)
		local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		if humanoid then humanoid.WalkSpeed = value end
	end)
	PlayerTab:CreateSlider("JumpPower", 100, function(value)
		local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		if humanoid then humanoid.JumpPower = value end
	end)

	-- Visual Tab
	local VisualTab = Window:CreateTab("Visual")
	VisualTab:CreateLabel("ESP")

	-- Toggle ESP Features
	VisualTab:CreateToggle("TagEsp", function(state)
		EspSettings.TagEsp = state
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= Players.LocalPlayer and plr.Character then
				if state then AddTagEsp(plr) else RemoveTagEsp(plr) end
			end
		end
	end)

	VisualTab:CreateToggle("LimbEsp", function(state)
		EspSettings.LimbEsp = state
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= Players.LocalPlayer and plr.Character then
				if state then AddLimbEsp(plr) else RemoveLimbEsp(plr) end
			end
		end
	end)

	VisualTab:CreateToggle("ItemEsp", function(state)
		EspSettings.ItemEsp = state
		local mapLocation, charLocation
		for _, obj in pairs(workspace.Map:GetChildren()) do
			if obj.Name ~= "Players" and obj.Name ~= "Traps" then
				mapLocation = obj.Tools.Map
				charLocation = obj.Tools.Character
			end
		end
		if state then
			if mapLocation and charLocation then AddItemEsp(mapLocation, charLocation) end
		else
			RemoveItemEsp(mapLocation, charLocation)
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
		for _, item in pairs(location:GetChildren()) do
			if not item.Handle:FindFirstChild("ItemEsp") then
				local Handle = item.Handle
				
				local Esp = Instance.new("BillboardGui")
				Esp.Parent = Handle
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
				Name.Text = item.Name
				Name.TextColor3 = Color3.new(1, 1, 1)
				Name.BackgroundTransparency = 1
				Name.TextScaled = true
				
				for _, face in pairs(Enum.NormalId:GetEnumItems()) do
					local Esp = Instance.new("SurfaceGui")
					Esp.Name = "ItemEsp"
					Esp.Parent = Handle
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

		if location2 ~= nil then
			for _, item in pairs(location2:GetChildren()) do
				if not item.Handle:FindFirstChild("ItemEsp") then
					local Handle = item.Handle

					local Esp = Instance.new("BillboardGui")
					Esp.Parent = Handle
					Esp.Name = "Esp"
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
					Name.Text = item.Name
					Name.TextColor3 = Color3.new(1, 1, 1)
					Name.BackgroundTransparency = 1
					Name.TextScaled = true

					for _, face in pairs(Enum.NormalId:GetEnumItems()) do
						local Esp = Instance.new("SurfaceGui")
						Esp.Name = "ItemEsp"
						Esp.Parent = Handle
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
