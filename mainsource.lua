if Game.PlaceId == 6000468131 then
    local Players = game:GetService("Players")

_G.TagEsp = false
_G.LimbEsp = false

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/source.lua", true))()

local Window = Library:CreateLibrary("SuperSploit", "Granny")

local Tab = Window:CreateTab("Visual")

local Label = Window:CreateLabel("ESP")

local Toggle1 = Window:CreateToggle("TagEsp", function(state)
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

local Toggle2 = Window:CreateToggle("LimbEsp", function(state)
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

function AddTagEsp(plr)
	if plr.Character then
		local char = plr.Character

		local Esp = Instance.new("BillboardGui")
		Esp.Parent = char:WaitForChild("Head")
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
		Name.Text = plr.Name
		Name.TextColor3 = Color3.new(1, 1, 1)
		Name.BackgroundTransparency = 1
		Name.TextScaled = true
	end
end

function RemoveTagEsp(plr)
	if plr.Character and plr.Character:FindFirstChild("Head") then
		local head = plr.Character.Head
		if head:FindFirstChild("Esp") then
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
end
