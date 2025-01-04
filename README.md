<h2>SuperSploit</h2>

<h2>Load the Library<h2>
<p>Local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/SuperSploit.lua", true))()</p>

<h2>Create A Window<h2>
<p>local Window = Library:CreateLibrary("SuperSploit Hub")</p>
  
<h2>Create A Tab<h2>
<p>local Tab = Window:CreateTab("Tab")</p>
  
<h2>Create A Label<h2>
<p>local Label = Window:CreateLabel("Label")</p>
  
<h2>Create A Button<h2>
<p>local Button = Window:CreateButton("Button", function()
	print("Hello, world!")
end)</p>
  
<h2>Create A Toggle<h2>
<p>local Toggle = Window:CreateToggle("Toggle", function(state)
	if state then
		print("ON")
	else
		print("OFF")
	end
end)</p>
  
<h2>Create A Slider<h2>
<p>local Slider = Window:CreateSlider("Slider", 100, function(value)
	print(value)
end)</p>
  
<h2>Create A Dropdown<h2>
<p>local options = {"Option 1", "Option 2", "Option 3"}

local Dropdown = Window:CreateDropDown("Select an Option", options, function(selectedOption)
	print("You selected: " .. selectedOption)
end)</p>

<h2>Add A Notification<h2>
<p></p>

<h2>Create A Info Label<h2>
<p>local Info = Window:CreateInfo("Info")</p>
  
<h2>Add A Not Working Warning<h2>
<p>local Info = Window:CreateStatusBad()</p>
  
<h2>Add A Somethings Are Not Working Warning<h2>
<p>local Info = Window:CreateStatusOkay()</p>
  
<h2>Add A Working Warning<h2>
<p>local Info = Window:CreateStatusGreat()</p>
