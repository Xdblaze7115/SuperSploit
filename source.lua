-- Services
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

function SuperSploit:CreateLibrary(title)
	local SuperSploitLibrary = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local NotificationFrame = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding_3 = Instance.new("UIPadding")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local CornerFix = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Close = Instance.new("TextButton")
	local Minimise = Instance.new("TextButton")
	local Navigation = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local CornerFix_2 = Instance.new("Frame")
	local CornerFix_3 = Instance.new("Frame")
	local NavigationFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding_2 = Instance.new("UIPadding")
	local ContentFrame = Instance.new("Frame")
	
	SuperSploitLibrary.Name = "SuperSploitLibrary"
	SuperSploitLibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	SuperSploitLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = SuperSploitLibrary
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 450, 0, 400)

	NotificationFrame.Name = "NotificationFrame"
	NotificationFrame.Parent = SuperSploitLibrary
	NotificationFrame.AnchorPoint = Vector2.new(1, 1)
	NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationFrame.BackgroundTransparency = 1.000
	NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotificationFrame.BorderSizePixel = 0
	NotificationFrame.Position = UDim2.new(1, 0, 1, 0)
	NotificationFrame.Size = UDim2.new(0, 225, 1, 0)

	NavigationFrame.Name = "NavigationFrame"
	NavigationFrame.Parent = Navigation
	NavigationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationFrame.BackgroundTransparency = 1.000
	NavigationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NavigationFrame.BorderSizePixel = 0
	NavigationFrame.Size = UDim2.new(0, 125, 0, 375)
	NavigationFrame.ZIndex = 2

	UIListLayout_2.Parent = NotificationFrame
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout_2.Padding = UDim.new(0, 8)

	UIPadding_3.Parent = NotificationFrame
	UIPadding_3.PaddingBottom = UDim.new(0, 25)
	UIPadding_3.PaddingRight = UDim.new(0, 25)

	UICorner.Parent = Main

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(0, 450, 0, 25)

	UICorner_2.Parent = Top

	CornerFix.Name = "CornerFix"
	CornerFix.Parent = Top
	CornerFix.AnchorPoint = Vector2.new(0, 1)
	CornerFix.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	CornerFix.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerFix.BorderSizePixel = 0
	CornerFix.Position = UDim2.new(0, 0, 1, 0)
	CornerFix.Size = UDim2.new(0, 450, 0, 15)

	Title.Name = "Title"
	Title.Parent = Top
	Title.AnchorPoint = Vector2.new(1, 0)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(1, 0, 0, 0)
	Title.Size = UDim2.new(0, 450, 0, 25)
	Title.Font = Enum.Font.Ubuntu
	Title.Text = title or "SuperSploit Hub"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding.Parent = Title
	UIPadding.PaddingLeft = UDim.new(0, 16)

	Close.Name = "Close"
	Close.Parent = Top
	Close.AnchorPoint = Vector2.new(1, 0)
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(1, 0, 0, 0)
	Close.Size = UDim2.new(0, 25, 0, 25)
	Close.Font = Enum.Font.FredokaOne
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextSize = 14.000

	Minimise.Name = "Minimise"
	Minimise.Parent = Top
	Minimise.AnchorPoint = Vector2.new(1, 0)
	Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimise.BackgroundTransparency = 1.000
	Minimise.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimise.BorderSizePixel = 0
	Minimise.Position = UDim2.new(0.939999998, 0, 0, 0)
	Minimise.Size = UDim2.new(0, 25, 0, 25)
	Minimise.Font = Enum.Font.FredokaOne
	Minimise.Text = "-"
	Minimise.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimise.TextSize = 14.000

	Navigation.Name = "Navigation"
	Navigation.Parent = Main
	Navigation.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Navigation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navigation.BorderSizePixel = 0
	Navigation.Position = UDim2.new(0, 0, 0, 25)
	Navigation.Size = UDim2.new(0, 125, 0, 375)

	UICorner_3.Parent = Navigation

	CornerFix_2.Name = "CornerFix"
	CornerFix_2.Parent = Navigation
	CornerFix_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	CornerFix_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerFix_2.BorderSizePixel = 0
	CornerFix_2.Size = UDim2.new(0, 125, 0, 15)

	CornerFix_3.Name = "CornerFix"
	CornerFix_3.Parent = Navigation
	CornerFix_3.AnchorPoint = Vector2.new(1, 1)
	CornerFix_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	CornerFix_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerFix_3.BorderSizePixel = 0
	CornerFix_3.Position = UDim2.new(1, 0, 1, 0)
	CornerFix_3.Size = UDim2.new(0, 90, 0, 15)

	UIListLayout.Parent = NavigationFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 8)

	UIPadding_2.Parent = NavigationFrame
	UIPadding_2.PaddingTop = UDim.new(0, 8)
	
	ContentFrame.Name = "ContentFrame"
	ContentFrame.Parent = Main
	ContentFrame.AnchorPoint = Vector2.new(1, 1)
	ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContentFrame.BackgroundTransparency = 1.000
	ContentFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContentFrame.BorderSizePixel = 0
	ContentFrame.Position = UDim2.new(1, 0, 1, 0)
	ContentFrame.Size = UDim2.new(0, 325, 0, 375)
	
	Close.MouseButton1Click:Connect(function()
		SuperSploitLibrary:Destroy()
	end)
	

	local minimise = false
	
	Minimise.MouseButton1Click:Connect(function()
		local Tween = TweenService:Create(Main, tweenInfo, {Size = UDim2.new(0, 450, 0, 25)})
		local Tween2 = TweenService:Create(Main, tweenInfo, {Size = UDim2.new(0, 450, 0, 400)})
		
		if not minimise then
			minimise = true
			for _, v in pairs(Main:GetChildren()) do
				if v:IsA("Frame") and v.Name ~= "Top" then
					v.Visible = false
				elseif v.Name == "Top" then
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
					elseif v.Name == "Top" then
						v:WaitForChild("CornerFix").Visible = true
					end
				end
			end)
		end
	end)
	
	SuperSploit:DraggingEnabled(Main)
	
	function SuperSploit:CreateNotification(TitleText, DescriptionText, Duration)
		local Notification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local CountDownFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local CountDown = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local Description = Instance.new("TextLabel")
		local UICorner_4 = Instance.new("UICorner")

		Notification.Name = "Notification"
		Notification.Parent = NotificationFrame
		Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Notification.BorderSizePixel = 0
		Notification.Size = UDim2.new(0, 200, 0, 80)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Notification

		Title.Name = "Title"
		Title.Parent = Notification
		Title.AnchorPoint = Vector2.new(1, 0)
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(1, 0, 0, 0)
		Title.Size = UDim2.new(0, 200, 0, 25)
		Title.Font = Enum.Font.Ubuntu
		Title.Text = TitleText
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000

		CountDownFrame.Name = "CountDownFrame"
		CountDownFrame.Parent = Notification
		CountDownFrame.AnchorPoint = Vector2.new(0.5, 1)
		CountDownFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		CountDownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CountDownFrame.BorderSizePixel = 0
		CountDownFrame.Position = UDim2.new(0.5, 0, 1, 0)
		CountDownFrame.Size = UDim2.new(0, 200, 0, 5)

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = CountDownFrame

		CountDown.Name = "CountDown"
		CountDown.Parent = CountDownFrame
		CountDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CountDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CountDown.BorderSizePixel = 0
		CountDown.Size = UDim2.new(0, 200, 0, 5)

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
		Description.Size = UDim2.new(0, 200, 0, 50)
		Description.Font = Enum.Font.Ubuntu
		Description.Text = DescriptionText
		Description.TextColor3 = Color3.fromRGB(255, 255, 255)
		Description.TextSize = 14.000
		Description.TextWrapped = true

		UICorner_4.Parent = Description
		
		spawn(function()
			local TweenInfo = TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			local Goal = {Size = UDim2.new(0, 0, 1, 0)}

			local CountDownTween = TweenService:Create(CountDown, TweenInfo, Goal)
			CountDownTween:Play()

			wait(Duration)
			NotificationFrame:Destroy()
		end)
	end

	local GUI = {}
	
	local Tabids = 0
	
	function GUI:CreateTab(name)
		local CurrentTabid = Tabids + 1
		Tabids = Tabids + 1
		
		local Tab = Instance.new("TextButton")
		local UICorner_4 = Instance.new("UICorner")
		local Tab_2 = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_3 = Instance.new("UIPadding")
		
		Tab.Name = "Tab"
		Tab.Parent = NavigationFrame
		Tab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 100, 0, 25)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.Ubuntu
		Tab.Text = name
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 14.000

		UICorner_4.CornerRadius = UDim.new(0, 4)
		UICorner_4.Parent = Tab

		Tab_2.Name = tostring(CurrentTabid)
		Tab_2.Parent = ContentFrame
		Tab_2.Active = true
		Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab_2.BackgroundTransparency = 1.000
		Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab_2.BorderSizePixel = 0
		Tab_2.Size = UDim2.new(0, 325, 0, 375)
		Tab_2.ScrollBarThickness = 0

		UIListLayout_2.Parent = Tab_2
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 8)

		UIPadding_3.Parent = Tab_2
		UIPadding_3.PaddingTop = UDim.new(0, 8)
		
		Tab_2.ChildAdded:Connect(function(child)
			Tab_2.CanvasSize = UDim2.new(0, 0, 0, (UIListLayout_2.AbsoluteContentSize.Y + 15))
		end)
		
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
			local TextLabel_5 = Instance.new("TextLabel")
			local UICorner_9 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			Label.Name = "Label"
			Label.Parent = Tab_2
			Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 300, 0, 25)

			TextLabel_5.Parent = Label
			TextLabel_5.AnchorPoint = Vector2.new(1, 0)
			TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.BackgroundTransparency = 1.000
			TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_5.BorderSizePixel = 0
			TextLabel_5.Position = UDim2.new(1, 0, 0, 0)
			TextLabel_5.Size = UDim2.new(0, 300, 0, 25)
			TextLabel_5.Font = Enum.Font.Ubuntu
			TextLabel_5.Text = txt
			TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_5.TextSize = 14.000

			UICorner_9.CornerRadius = UDim.new(0, 4)
			UICorner_9.Parent = Label
			
			UIStroke.Color = Color3.fromRGB(120, 120, 120)
			UIStroke.Thickness = 1.5
			UIStroke.Parent = Label
		end
		
		function GUI:CreateButton(txt, callback)
			local Button = Instance.new("Frame")
			local TextLabel_6 = Instance.new("TextLabel")
			local UIPadding_8 = Instance.new("UIPadding")
			local UICorner_10 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			local TextButton = Instance.new("TextButton")
			
			Button.Name = "Button"
			Button.Parent = Tab_2
			Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 300, 0, 25)

			TextLabel_6.Parent = Button
			TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.BackgroundTransparency = 1.000
			TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_6.BorderSizePixel = 0
			TextLabel_6.Size = UDim2.new(0, 300, 0, 25)
			TextLabel_6.Font = Enum.Font.Ubuntu
			TextLabel_6.Text = txt
			TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_6.TextSize = 14.000

			UIPadding_8.Parent = TextLabel_6
			UIPadding_8.PaddingLeft = UDim.new(0, 8)

			UICorner_10.CornerRadius = UDim.new(0, 4)
			UICorner_10.Parent = Button

			UIStroke_2.Color = Color3.fromRGB(120, 120, 120)
			UIStroke_2.Thickness = 1.5
			UIStroke_2.Parent = Button

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 260, 0, 25)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Ubuntu
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
			local TextLabel_9 = Instance.new("TextLabel")
			local UIPadding_11 = Instance.new("UIPadding")
			local UICorner_15 = Instance.new("UICorner")
			local ToggleFrame = Instance.new("Frame")
			local TextButton_3 = Instance.new("TextButton")
			local UICorner_17 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = Tab_2
			Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 300, 0, 25)
			
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Toggle
			ToggleFrame.AnchorPoint = Vector2.new(0, 0.5)
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.Position = UDim2.new(0.02, 0, 0.5, 0)
			ToggleFrame.Size = UDim2.new(0, 15, 0, 15)

			UICorner_17.CornerRadius = UDim.new(0, 4)
			UICorner_17.Parent = ToggleFrame

			TextButton_3.Parent = Toggle
			TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton_3.BorderSizePixel = 0
			TextButton_3.Size = UDim2.new(0, 300, 0, 25)
			TextButton_3.Font = Enum.Font.Ubuntu
			TextButton_3.Text = ""
			TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_3.TextSize = 14.000
			TextButton_3.Transparency = 1

			TextLabel_9.Parent = Toggle
			TextLabel_9.AnchorPoint = Vector2.new(1, 0)
			TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_9.BackgroundTransparency = 1.000
			TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_9.BorderSizePixel = 0
			TextLabel_9.Position = UDim2.new(1, 0, 0, 0)
			TextLabel_9.Size = UDim2.new(0, 280, 0, 25)
			TextLabel_9.Font = Enum.Font.Ubuntu
			TextLabel_9.Text = txt
			TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_9.TextSize = 14.000
			TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_11.Parent = TextLabel_9
			UIPadding_11.PaddingLeft = UDim.new(0, 8)

			UICorner_15.CornerRadius = UDim.new(0, 4)
			UICorner_15.Parent = Toggle

			UIStroke_2.Color = Color3.fromRGB(120, 120, 120)
			UIStroke_2.Thickness = 1.5
			UIStroke_2.Parent = Toggle
			
			local toggled = false
			
			TextButton_3.MouseEnter:Connect(function()
				if not toggled then
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(100, 100, 100)})
				end
			end)

			TextButton_3.MouseLeave:Connect(function()
				if not toggled then
					SuperSploit:Tween(ToggleFrame, {BackgroundColor3 = Color3.fromRGB(80, 80, 80)})
				end
			end)

			TextButton_3.MouseButton1Click:Connect(function()
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
			local UIStroke_3 = Instance.new("UIStroke")
			local SliderButton = Instance.new("TextButton")
			local Value = Instance.new("TextLabel")

			--Properties:

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
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 6)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Slider

			UIStroke_3.Color = Color3.fromRGB(120, 120, 120)
			UIStroke_3.Thickness = 1.5
			UIStroke_3.Parent = Slider

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
			SliderFill.Size = UDim2.new(0, 0, 0, 10)

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
			SliderButton.Font = Enum.Font.Ubuntu
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
			Value.Font = Enum.Font.Ubuntu
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
			local ImageButton = Instance.new("ImageButton")
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
			TextLabel.Font = Enum.Font.Unknown
			TextLabel.Text = "Dropdown"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 10.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding.Parent = TextLabel
			UIPadding.PaddingLeft = UDim.new(0, 8)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = DropDown

			ImageButton.Parent = DropDown
			ImageButton.AnchorPoint = Vector2.new(1, 0)
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(1, 0, 0, 0)
			ImageButton.Size = UDim2.new(0, 25, 0, 25)
			ImageButton.AutoButtonColor = false
			ImageButton.Image = "http://www.roblox.com/asset/?id=18158472410"

			ItemFrame.Name = "ItemFrame"
			ItemFrame.Parent = DropDown
			ItemFrame.AnchorPoint = Vector2.new(0, 1)
			ItemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ItemFrame.BackgroundTransparency = 1.000
			ItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ItemFrame.BorderSizePixel = 0
			ItemFrame.Position = UDim2.new(0, 0, 1, 0)
			ItemFrame.Size = UDim2.new(0, 300, 0, 55)
			ItemFrame.Visible = false

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
				local OptionButton = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")

				OptionButton.Parent = ItemFrame
				OptionButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
				OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OptionButton.BorderSizePixel = 0
				OptionButton.Size = UDim2.new(0, 280, 0, 25)
				OptionButton.AutoButtonColor = false
				OptionButton.Font = Enum.Font.Ubuntu
				OptionButton.Text = option
				OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				OptionButton.TextSize = 14.000

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = OptionButton

				OptionButton.MouseButton1Click:Connect(function()
					selectItem(option)
				end)
			end
			
			local state = false
			
			ImageButton.MouseButton1Click:Connect(function()
				if state then
					state = false
					ItemFrame.Visible = false
					local newSize = UDim2.new(0, 300, 0, 25)
					local newSize2 = UDim2.new(0, 300, 0, 0)
					SuperSploit:Tween(DropDown, {Size = newSize})
					ItemFrame.Size = newSize2
				else
					state = true
					ItemFrame.Visible = true
					local newSize = UDim2.new(0, 300, 0, (#options * 32) + 25)
					local newSize2 = UDim2.new(0, 300, 0, #options * 32)
					SuperSploit:Tween(DropDown, {Size = newSize})
					ItemFrame.Size = newSize2
				end
			end)
		end

		
		function GUI:CreateInfo(txt)
			local Info = Instance.new("Frame")
			local TextLabel_4 = Instance.new("TextLabel")
			local UIPadding_7 = Instance.new("UIPadding")
			local ImageLabel_5 = Instance.new("ImageLabel")
			local UICorner_8 = Instance.new("UICorner")
			local UIStroke_5 = Instance.new("UIStroke")
			
			Info.Name = "Info"
			Info.Parent = Tab_2
			Info.BackgroundColor3 = Color3.fromRGB(0, 67, 100)
			Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Info.BorderSizePixel = 0
			Info.Size = UDim2.new(0, 300, 0, 25)

			TextLabel_4.Parent = Info
			TextLabel_4.AnchorPoint = Vector2.new(1, 0)
			TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_4.BackgroundTransparency = 1.000
			TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_4.BorderSizePixel = 0
			TextLabel_4.Position = UDim2.new(1, 0, 0, 0)
			TextLabel_4.Size = UDim2.new(0, 270, 0, 25)
			TextLabel_4.Font = Enum.Font.Ubuntu
			TextLabel_4.Text = txt
			TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_4.TextSize = 14.000
			TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_7.Parent = TextLabel_4
			UIPadding_7.PaddingLeft = UDim.new(0, 8)

			ImageLabel_5.Parent = Info
			ImageLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel_5.BackgroundTransparency = 1.000
			ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel_5.BorderSizePixel = 0
			ImageLabel_5.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel_5.Size = UDim2.new(0, 25, 0, 25)
			ImageLabel_5.Image = "http://www.roblox.com/asset/?id=18144243830"
			ImageLabel_5.ScaleType = Enum.ScaleType.Fit

			UICorner_8.CornerRadius = UDim.new(0, 4)
			UICorner_8.Parent = Info
			
			UIStroke_5.Color = Color3.fromRGB(0, 120, 180)
			UIStroke_5.Thickness = 1.5
			UIStroke_5.Parent = Info
		end
		
		function GUI:CreateStatusBad()
			local StatusBad = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UIPadding_4 = Instance.new("UIPadding")
			local UICorner_5 = Instance.new("UICorner")
			local UIStroke_6 = Instance.new("UIStroke")
			local ImageLabel_2 = Instance.new("ImageLabel")
			
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
			TextLabel.Font = Enum.Font.Ubuntu
			TextLabel.Text = "This script is Broken Please Submit a ticket to our discord channel!"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_4.Parent = TextLabel
			UIPadding_4.PaddingLeft = UDim.new(0, 8)
			UIPadding_4.PaddingRight = UDim.new(0, 8)

			UICorner_5.CornerRadius = UDim.new(0, 4)
			UICorner_5.Parent = StatusBad
			
			UIStroke_6.Color = Color3.fromRGB(180, 0, 0)
			UIStroke_6.Thickness = 1.5
			UIStroke_6.Parent = StatusBad

			ImageLabel_2.Parent = StatusBad
			ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel_2.BackgroundTransparency = 1.000
			ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel_2.BorderSizePixel = 0
			ImageLabel_2.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel_2.Size = UDim2.new(0, 25, 0, 25)
			ImageLabel_2.Image = "http://www.roblox.com/asset/?id=18144008577"
			ImageLabel_2.ScaleType = Enum.ScaleType.Fit
		end
		
		function GUI:CreateStatusOkay()
			local StatusOkay = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			local ImageLabel_3 = Instance.new("ImageLabel")
			local TextLabel_2 = Instance.new("TextLabel")
			local UIPadding_5 = Instance.new("UIPadding")
			local UIStroke_7 = Instance.new("UIStroke")
			
			StatusOkay.Name = "StatusOkay"
			StatusOkay.Parent = Tab_2
			StatusOkay.BackgroundColor3 = Color3.fromRGB(120, 120, 0)
			StatusOkay.BorderColor3 = Color3.fromRGB(0, 0, 0)
			StatusOkay.BorderSizePixel = 0
			StatusOkay.Size = UDim2.new(0, 300, 0, 50)

			UICorner_6.CornerRadius = UDim.new(0, 4)
			UICorner_6.Parent = StatusOkay

			ImageLabel_3.Parent = StatusOkay
			ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel_3.BackgroundTransparency = 1.000
			ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel_3.BorderSizePixel = 0
			ImageLabel_3.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel_3.Size = UDim2.new(0, 25, 0, 25)
			ImageLabel_3.Image = "http://www.roblox.com/asset/?id=18144008577"
			ImageLabel_3.ScaleType = Enum.ScaleType.Fit

			TextLabel_2.Parent = StatusOkay
			TextLabel_2.AnchorPoint = Vector2.new(1, 0)
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(1, 0, 0, 0)
			TextLabel_2.Size = UDim2.new(0, 270, 0, 50)
			TextLabel_2.Font = Enum.Font.Ubuntu
			TextLabel_2.Text = "This script is slightly Broken you may experience bugs while using it!"
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextWrapped = true
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_5.Parent = TextLabel_2
			UIPadding_5.PaddingLeft = UDim.new(0, 8)
			
			UIStroke_7.Color = Color3.fromRGB(180, 180, 0)
			UIStroke_7.Thickness = 1.5
			UIStroke_7.Parent = StatusOkay
		end
		
		function GUI:CreateStatusGreat()
			local StatusGreat = Instance.new("Frame")
			local TextLabel_3 = Instance.new("TextLabel")
			local UIPadding_6 = Instance.new("UIPadding")
			local ImageLabel_4 = Instance.new("ImageLabel")
			local UICorner_7 = Instance.new("UICorner")
			local UIStroke_8 = Instance.new("UIStroke")
			
			StatusGreat.Name = "StatusGreat"
			StatusGreat.Parent = Tab_2
			StatusGreat.BackgroundColor3 = Color3.fromRGB(33, 100, 0)
			StatusGreat.BorderColor3 = Color3.fromRGB(0, 0, 0)
			StatusGreat.BorderSizePixel = 0
			StatusGreat.Size = UDim2.new(0, 300, 0, 25)

			TextLabel_3.Parent = StatusGreat
			TextLabel_3.AnchorPoint = Vector2.new(1, 0)
			TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.BackgroundTransparency = 1.000
			TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_3.BorderSizePixel = 0
			TextLabel_3.Position = UDim2.new(1, 0, 0, 0)
			TextLabel_3.Size = UDim2.new(0, 270, 0, 25)
			TextLabel_3.Font = Enum.Font.Ubuntu
			TextLabel_3.Text = "This script is fully operational!"
			TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.TextSize = 14.000
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_6.Parent = TextLabel_3
			UIPadding_6.PaddingLeft = UDim.new(0, 8)

			ImageLabel_4.Parent = StatusGreat
			ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel_4.BackgroundTransparency = 1.000
			ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel_4.BorderSizePixel = 0
			ImageLabel_4.Position = UDim2.new(0.0599999987, 0, 0.5, 0)
			ImageLabel_4.Size = UDim2.new(0, 25, 0, 25)
			ImageLabel_4.Image = "http://www.roblox.com/asset/?id=18144045750"
			ImageLabel_4.ScaleType = Enum.ScaleType.Fit

			UICorner_7.CornerRadius = UDim.new(0, 4)
			UICorner_7.Parent = StatusGreat
			
			UIStroke_8.Color = Color3.fromRGB(60, 180, 0)
			UIStroke_8.Thickness = 1.5
			UIStroke_8.Parent = StatusGreat
		end
	end
	return GUI
end
