local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local Mouse = Players.LocalPlayer:GetMouse()

local SuperSploit = {}

local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

function SuperSploit:DraggingEnabled(frame)
	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			frame.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end

function SuperSploit:Tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function SuperSploit:CreateLibrary(title, gametxt)
	local SuperSploitGUI = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Navigation = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local CornerFix = Instance.new("Frame")
	local NavigationFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local Top = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local CornerFix_2 = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local Minimise = Instance.new("TextButton")
	local GameTxt = Instance.new("TextLabel")
	local ContentFrame = Instance.new("Frame")
	local NotificationFrame = Instance.new("Frame")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local UIPadding_3 = Instance.new("UIPadding")

	SuperSploitGUI.Name = "SuperSploit"
	SuperSploitGUI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	SuperSploitGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SuperSploitGUI.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = SuperSploitGUI
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 350)

	UICorner.Parent = Main

	Navigation.Name = "Navigation"
	Navigation.Parent = Main
	Navigation.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Navigation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navigation.BorderSizePixel = 0
	Navigation.Size = UDim2.new(0, 125, 0, 350)

	UICorner_2.Parent = Navigation

	CornerFix.Name = "CornerFix"
	CornerFix.Parent = Navigation
	CornerFix.AnchorPoint = Vector2.new(1, 1)
	CornerFix.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	CornerFix.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerFix.BorderSizePixel = 0
	CornerFix.Position = UDim2.new(1, 0, 1, 0)
	CornerFix.Size = UDim2.new(0, 100, 0, 15)
	CornerFix.ZIndex = 0

	NavigationFrame.Name = "NavigationFrame"
	NavigationFrame.Parent = Navigation
	NavigationFrame.AnchorPoint = Vector2.new(0, 1)
	NavigationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationFrame.BackgroundTransparency = 1.000
	NavigationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NavigationFrame.BorderSizePixel = 0
	NavigationFrame.Position = UDim2.new(0, 0, 1, 0)
	NavigationFrame.Size = UDim2.new(0, 125, 0, 325)

	UIListLayout.Parent = NavigationFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 8)

	UIPadding.Parent = NavigationFrame
	UIPadding.PaddingTop = UDim.new(0, 8)

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(0, 500, 0, 25)

	UICorner_3.Parent = Top

	CornerFix_2.Name = "CornerFix"
	CornerFix_2.Parent = Top
	CornerFix_2.AnchorPoint = Vector2.new(0, 1)
	CornerFix_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	CornerFix_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerFix_2.BorderSizePixel = 0
	CornerFix_2.Position = UDim2.new(0, 0, 1, 0)
	CornerFix_2.Size = UDim2.new(0, 500, 0, 15)
	CornerFix_2.ZIndex = 0

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 100, 0, 25)
	Title.Font = Enum.Font.FredokaOne
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextWrapped = true

	Close.Name = "Close"
	Close.Parent = Top
	Close.AnchorPoint = Vector2.new(1, 1)
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(1, 0, 1, 0)
	Close.Size = UDim2.new(0, 25, 0, 25)
	Close.Font = Enum.Font.FredokaOne
	Close.Text = "x"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextSize = 14.000

	Minimise.Name = "Minimise"
	Minimise.Parent = Top
	Minimise.AnchorPoint = Vector2.new(1, 1)
	Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimise.BackgroundTransparency = 1.000
	Minimise.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimise.BorderSizePixel = 0
	Minimise.Position = UDim2.new(0.954999983, 0, 1, 0)
	Minimise.Size = UDim2.new(0, 25, 0, 25)
	Minimise.Font = Enum.Font.FredokaOne
	Minimise.Text = "-"
	Minimise.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimise.TextSize = 14.000

	GameTxt.Name = "GameTxt"
	GameTxt.Parent = Top
	GameTxt.AnchorPoint = Vector2.new(1, 0)
	GameTxt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameTxt.BackgroundTransparency = 1.000
	GameTxt.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GameTxt.BorderSizePixel = 0
	GameTxt.Position = UDim2.new(0.44933337, 0, 0, 0)
	GameTxt.Size = UDim2.new(0, 100, 0, 25)
	GameTxt.Font = Enum.Font.FredokaOne
	GameTxt.Text = gametxt
	GameTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
	GameTxt.TextSize = 10.000
	GameTxt.TextWrapped = true
	GameTxt.TextXAlignment = Enum.TextXAlignment.Left

	ContentFrame.Name = "ContentFrame"
	ContentFrame.Parent = Main
	ContentFrame.AnchorPoint = Vector2.new(1, 1)
	ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContentFrame.BackgroundTransparency = 1.000
	ContentFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContentFrame.BorderSizePixel = 0
	ContentFrame.Position = UDim2.new(1, 0, 1, 0)
	ContentFrame.Size = UDim2.new(0, 375, 0, 325)

	NotificationFrame.Name = "NotificationFrame"
	NotificationFrame.Parent = SuperSploitGUI
	NotificationFrame.AnchorPoint = Vector2.new(1, 1)
	NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationFrame.BackgroundTransparency = 1.000
	NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotificationFrame.BorderSizePixel = 0
	NotificationFrame.Position = UDim2.new(1, 0, 1, 0)
	NotificationFrame.Size = UDim2.new(0, 225, 1, 0)
	
	Close.MouseButton1Click:Connect(function()
		SuperSploitGUI:Destroy()
	end)
	
	local minimise = false

	Minimise.MouseButton1Click:Connect(function()
		local Tween = TweenService:Create(Main, tweenInfo, {Size = UDim2.new(0, 500, 0, 25)})
		local Tween2 = TweenService:Create(Main, tweenInfo, {Size = UDim2.new(0, 500, 0, 350)})

		if not minimise then
			minimise = true
			for _, v in pairs(Main:GetChildren()) do
				if v:IsA("Frame") and v.Name ~= "Top" then
					v.Visible = false
				elseif v.Name == "Top" or  v.Name == "Navigation" then
					v:WaitForChild("CornerFix").Visible = false
				end
			end
			Tween:Play()
		else
			minimise = false
			Tween2:Play()
			Tween2.Completed:Connect(function()
				for _, v in pairs(Main:GetChildren()) do
					if v:IsA("Frame") and v.Name ~= "Top" then
						v.Visible = true
					elseif v.Name == "Top" or v.Name == "Navigation" then
						v:WaitForChild("CornerFix").Visible = true
					end
				end
			end)
		end
	end)

	SuperSploit:DraggingEnabled(Main)
	
	function SuperSploit:CreateNotification(titletxt, descriptiontxt, duration)
		local Notification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local CountDownFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local CountDown = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local Description = Instance.new("TextLabel")
		local UICorner_4 = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")
		
		Notification.Name = "Notification"
		Notification.Parent = NotificationFrame
		Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Notification.BorderSizePixel = 0
		Notification.Size = UDim2.new(0.888888896, 0, 0.158102766, 0)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Notification

		Title.Name = "Title"
		Title.Parent = Notification
		Title.AnchorPoint = Vector2.new(1, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(1.00000036, 0, 0, 0)
		Title.Size = UDim2.new(1.00000036, 0, 0.328742206, 0)
		Title.Font = Enum.Font.FredokaOne
		Title.Text = titletxt
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000

		CountDownFrame.Name = "CountDownFrame"
		CountDownFrame.Parent = Notification
		CountDownFrame.AnchorPoint = Vector2.new(0.5, 1)
		CountDownFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		CountDownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CountDownFrame.BorderSizePixel = 0
		CountDownFrame.Position = UDim2.new(0.5, 0, 1, 0)
		CountDownFrame.Size = UDim2.new(1, 0, 0.0625, 0)

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = CountDownFrame

		CountDown.Name = "CountDown"
		CountDown.Parent = CountDownFrame
		CountDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CountDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CountDown.BorderSizePixel = 0
		CountDown.Size = UDim2.new(1, 0, 1, 0)

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = CountDown

		Description.Name = "Description"
		Description.Parent = Notification
		Description.AnchorPoint = Vector2.new(1, 0.5)
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description.BorderSizePixel = 0
		Description.Position = UDim2.new(1, 0, 0.621874988, 0)
		Description.Size = UDim2.new(1, 0, 0.625, 0)
		Description.Font = Enum.Font.FredokaOne
		Description.Text = descriptiontxt
		Description.TextColor3 = Color3.fromRGB(255, 255, 255)
		Description.TextSize = 14.000
		Description.TextWrapped = true

		UICorner_4.Parent = Description

		UIListLayout.Parent = NotificationFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Padding = UDim.new(0, 8)

		UIPadding.Parent = NotificationFrame
		UIPadding.PaddingBottom = UDim.new(0, 25)
		UIPadding.PaddingRight = UDim.new(0, 25)
		
		spawn(function()
			local TweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			local Goal = {Size = UDim2.new(0, 0, 1, 0)}

			local CountDownTween = TweenService:Create(CountDown, TweenInfo, Goal)
			CountDownTween:Play()

			wait(duration)
			Notification:Destroy()
		end)
	end
	
	local GUI = {}

	local Tabids = 0
	
	function GUI:CreateTab(name)
		local CurrentTabid = Tabids + 1
		Tabids = Tabids + 1

		local Tab = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local Tab_2 = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")
		
		Tab.Name = "Tab"
		Tab.Parent = NavigationFrame
		Tab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 100, 0, 25)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.FredokaOne
		Tab.Text = name
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 14.000

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Tab
		
		Tab_2.Name = tostring(CurrentTabid)
		Tab_2.Parent = ContentFrame
		Tab_2.Active = true
		Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab_2.BackgroundTransparency = 1.000
		Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab_2.BorderSizePixel = 0
		Tab_2.Size = UDim2.new(0, 375, 0, 325)
		Tab_2.ScrollBarThickness = 6
		Tab_2.AutomaticCanvasSize = Enum.AutomaticSize.Y

		UIListLayout_2.Parent = Tab_2
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 8)

		UIPadding_2.Parent = Tab_2
		UIPadding_2.PaddingTop = UDim.new(0, 8)
		
		if CurrentTabid == 1 then
			SuperSploit:Tween(Tab, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
		else
			for _, v in pairs(ContentFrame:GetChildren()) do
				if tonumber(v.Name) == 1 then
					v.Visible = true
				else
					v.Visible = false
				end
			end
		end

		Tab.MouseButton1Click:Connect(function()
			for _, v in pairs(ContentFrame:GetChildren()) do
				if tonumber(v.Name) == CurrentTabid then
					v.Visible = true
				else
					v.Visible = false
				end
			end
			for _, v in pairs(NavigationFrame:GetChildren()) do
				if v:IsA("TextButton") then
					SuperSploit:Tween(v, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
				end
			end
			SuperSploit:Tween(Tab, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
		end)
		
		function GUI:CreateLabel(txt)
			local Label = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			
			Label.Name = "Label"
			Label.Parent = Tab_2
			Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = Label
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 300, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Label
		end

		function GUI:CreateButton(txt, callback)
			local Button = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local TextButton = Instance.new("TextButton")
			
			Button.Name = "Button"
			Button.Parent = Tab_2
			Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = Button
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 300, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Button

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 300, 0, 25)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.FredokaOne
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			
			TextButton.MouseEnter:Connect(function()
				SuperSploit:Tween(Button, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
			end)

			TextButton.MouseLeave:Connect(function()
				SuperSploit:Tween(Button, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
			end)

			TextButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		function GUI:CreateToggle(txt, callback)
			local Toggle = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local ToggleFrame = Instance.new("Frame")
			local TextButton = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = Tab_2
			Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = Toggle
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 280, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Toggle

			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Toggle
			ToggleFrame.AnchorPoint = Vector2.new(0, 0.5)
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.Position = UDim2.new(0.0199999996, 0, 0.5, 0)
			ToggleFrame.Size = UDim2.new(0, 15, 0, 15)

			TextButton.Parent = Toggle
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 300, 0, 25)
			TextButton.Font = Enum.Font.Ubuntu
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.Transparency = 1

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = ToggleFrame
			
			local toggled = false

			TextButton.MouseEnter:Connect(function()
				if not toggled then
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})
				end
			end)

			TextButton.MouseLeave:Connect(function()
				if not toggled then
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
				end
			end)

			TextButton.MouseButton1Click:Connect(function()
				toggled = not toggled
				pcall(callback, toggled)
				if toggled then
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(85, 255, 127)})
				else
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
				end
			end)
		end
		
		function GUI:CreateSlider(txt, maxvalue, callback)
			local Slider = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local SliderFrame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local SliderFill = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local SliderButton = Instance.new("TextButton")
			local Value = Instance.new("TextLabel")
			
			Slider.Name = "Slider"
			Slider.Parent = Tab_2
			Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 300, 0, 35)

			TextLabel.Parent = Slider
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 300, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 6)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Slider

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.AnchorPoint = Vector2.new(0.5, 1)
			SliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderFrame.BorderSizePixel = 0
			SliderFrame.Position = UDim2.new(0.5, 0, 0.920000017, 0)
			SliderFrame.Size = UDim2.new(0, 290, 0, 10)

			UICorner_2.CornerRadius = UDim.new(0, 18)
			UICorner_2.Parent = SliderFrame

			SliderFill.Name = "SliderFill"
			SliderFill.Parent = SliderFrame
			SliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderFill.BorderSizePixel = 0
			SliderFill.Size = UDim2.new(0, 10, 0, 10)

			UICorner_3.CornerRadius = UDim.new(0, 18)
			UICorner_3.Parent = SliderFill

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.BackgroundTransparency = 1.000
			SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.BorderSizePixel = 0
			SliderButton.Size = UDim2.new(0, 300, 0, 35)
			SliderButton.AutoButtonColor = false
			SliderButton.Font = Enum.Font.FredokaOne
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000

			Value.Name = "Value"
			Value.Parent = Slider
			Value.AnchorPoint = Vector2.new(1, 0)
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Value.BorderSizePixel = 0
			Value.Position = UDim2.new(0.980000019, 0, 0, 0)
			Value.Size = UDim2.new(0, 50, 0, 25)
			Value.Font = Enum.Font.FredokaOne
			Value.Text = "0"
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000
			Value.TextXAlignment = Enum.TextXAlignment.Right
			
			local SliderActive = false
			local value = 0

			SliderButton.MouseButton1Down:Connect(function()
				SliderActive = true
				while SliderActive == true do
					local Output = math.clamp((Mouse.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
					local Percentage = (math.round(Output * 100))
					local Rounded = math.floor((maxvalue / 100) * Percentage)

					if Rounded == 0 then
						value = Rounded
						Value.Text = tostring(Rounded)
						SuperSploit:Tween(SliderFill, {Size = UDim2.new(0, 0, 0, 10)})
					elseif Rounded == maxvalue then
						value = Rounded
						Value.Text = tostring(Rounded)
						SuperSploit:Tween(SliderFill, {Size = UDim2.new(0, SliderFrame.AbsoluteSize.X, 0, 10)})
					else
						value = Rounded
						Value.Text = tostring(Rounded)
						SuperSploit:Tween(SliderFill, {Size = UDim2.new(Output, 0, 0, 10)})
					end
					task.wait()
				end
				pcall(callback, value)
			end)

			SliderButton.MouseButton1Up:Connect(function()
				SliderActive = false
			end)
			
			SliderButton.MouseLeave:Connect(function()
				SliderActive = false
			end)
		end
		
		function GUI:CreateDropDown(txt, options, callback)
			local DropDown = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local TextButton = Instance.new("TextButton")
			local ImageLabel = Instance.new("ImageLabel")
			local ItemFrame = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			
			DropDown.Name = "DropDown"
			DropDown.Parent = Tab_2
			DropDown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			DropDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropDown.BorderSizePixel = 0
			DropDown.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = DropDown
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 270, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = DropDown
			
			TextButton.Parent = DropDown
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 300, 0, 25)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.FredokaOne
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000

			ImageLabel.Parent = DropDown
			ImageLabel.AnchorPoint = Vector2.new(1, 0)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(1, 0, 0, 0)
			ImageLabel.Size = UDim2.new(0, 25, 0, 25)
			ImageLabel.Image = "http://www.roblox.com/asset/?id=18158472410"

			ItemFrame.Name = "ItemFrame"
			ItemFrame.Parent = DropDown
			ItemFrame.AnchorPoint = Vector2.new(0, 1)
			ItemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ItemFrame.BackgroundTransparency = 1.000
			ItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ItemFrame.BorderSizePixel = 0
			ItemFrame.Position = UDim2.new(0, 0, 1, 0)
			ItemFrame.Size = UDim2.new(0, 300, 0, 0)
			ItemFrame.Visible = false
			ItemFrame.ClipsDescendants = true

			UIListLayout.Parent = ItemFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)
			
			local function selectItem(option)

				local success, errorMsg = pcall(function()
					if callback then
						callback(option)
					end
				end)

				if not success then
					warn("Error executing callback for option " .. option .. ": " .. errorMsg)
				end
			end

			for _, option in ipairs(options) do
				local TextButton = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")

				TextButton.Parent = ItemFrame
				TextButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0, 0, 0.433333337, 0)
				TextButton.Size = UDim2.new(0, 280, 0, 25)
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.FredokaOne
				TextButton.Text = option
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 14.000

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = TextButton

				TextButton.MouseButton1Click:Connect(function()
					selectItem(option)
				end)
			end

			local state = false

			TextButton.MouseButton1Click:Connect(function()
				if state then
					state = false
					local newSize = UDim2.new(0, 300, 0, 25)
					local newSize2 = UDim2.new(0, 300, 0, 0)
					SuperSploit:Tween(DropDown, {Size = newSize})
					SuperSploit:Tween(ImageLabel, {Rotation = 0})
					SuperSploit:Tween(ItemFrame, {Size = newSize2})
					wait(tweenInfo.Time)
					ItemFrame.Visible = false
				else
					state = true
					ItemFrame.Visible = true
					local newSize = UDim2.new(0, 300, 0, (#options * 32) + 25)
					local newSize2 = UDim2.new(0, 300, 0, #options * 32)
					SuperSploit:Tween(DropDown, {Size = newSize})
					SuperSploit:Tween(ImageLabel, {Rotation = 180})
					SuperSploit:Tween(ItemFrame, {Size = newSize2})
				end
			end)
		end
		
		function GUI:CreateInfo(txt)
			local Info = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local ImageLabel = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			
			Info.Name = "Info"
			Info.Parent = Tab_2
			Info.BackgroundColor3 = Color3.fromRGB(0, 67, 100)
			Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Info.BorderSizePixel = 0
			Info.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = Info
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 270, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			ImageLabel.Parent = Info
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Image = "http://www.roblox.com/asset/?id=18144243830"
			ImageLabel.ScaleType = Enum.ScaleType.Fit

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Info
		end
		
		function GUI:CreateStatusBad()
			local StatusBad = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local UICorner = Instance.new("UICorner")
			local ImageLabel = Instance.new("ImageLabel")
			
			StatusBad.Name = "StatusBad"
			StatusBad.Parent = Tab_2
			StatusBad.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
			StatusBad.BorderColor3 = Color3.fromRGB(0, 0, 0)
			StatusBad.BorderSizePixel = 0
			StatusBad.Size = UDim2.new(0, 300, 0, 50)

			TextLabel.Parent = StatusBad
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 270, 0, 50)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = "This script is Broken Please Submit a ticket to our discord channel!"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = StatusBad

			ImageLabel.Parent = StatusBad
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Image = "http://www.roblox.com/asset/?id=18144008577"
			ImageLabel.ScaleType = Enum.ScaleType.Fit
		end
		
		function GUI:CreateStatusOkay()
			local StatusOkay = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ImageLabel = Instance.new("ImageLabel")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")

			StatusOkay.Name = "StatusOkay"
			StatusOkay.Parent = Tab_2
			StatusOkay.BackgroundColor3 = Color3.fromRGB(120, 120, 0)
			StatusOkay.BorderColor3 = Color3.fromRGB(0, 0, 0)
			StatusOkay.BorderSizePixel = 0
			StatusOkay.Size = UDim2.new(0, 300, 0, 50)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = StatusOkay

			ImageLabel.Parent = StatusOkay
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Image = "http://www.roblox.com/asset/?id=18144008577"
			ImageLabel.ScaleType = Enum.ScaleType.Fit

			TextLabel.Parent = StatusOkay
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 270, 0, 50)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = "This script is slightly Broken you may experience bugs while using it!"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)
		end
		
		function GUI:CreateStatusGreat()
			local StatusGreat = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding = Instance.new("UIPadding")
			local ImageLabel = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			
			StatusGreat.Name = "StatusGreat"
			StatusGreat.Parent = Tab_2
			StatusGreat.BackgroundColor3 = Color3.fromRGB(33, 100, 0)
			StatusGreat.BorderColor3 = Color3.fromRGB(0, 0, 0)
			StatusGreat.BorderSizePixel = 0
			StatusGreat.Size = UDim2.new(0, 300, 0, 25)

			TextLabel.Parent = StatusGreat
			TextLabel.AnchorPoint = Vector2.new(1, 0)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(1, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 270, 0, 25)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = "This script is fully operational!"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			ImageLabel.Parent = StatusGreat
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel.Size = UDim2.new(0, 20, 0, 20)
			ImageLabel.Image = "http://www.roblox.com/asset/?id=18144045750"
			ImageLabel.ScaleType = Enum.ScaleType.Fit

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = StatusGreat
		end
	end
	return GUI
end
return SuperSploit
