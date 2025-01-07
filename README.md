<h2>SuperSploit</h2>

<h2>Load the Library</h2>
<pre><code>local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/SuperSploit.lua", true))()</code></pre>

<h2>Create A Window</h2>
<pre><code>local Window = Library:CreateLibrary("SuperSploit Hub")</code></pre>
  
<h2>Create A Tab</h2>
<pre><code>local Tab = Window:CreateTab("Tab")</code></pre>
  
<h2>Create A Label</h2>
<pre><code>local Label = Window:CreateLabel("Label")</code></pre>
  
<h2>Create A Button</h2>
<pre><code>local Button = Window:CreateButton("Button", function()
	print("Hello, world!")
end)</code></pre>
  
<h2>Create A Toggle</h2>
<pre><code>local Toggle = Window:CreateToggle("Toggle", function(state)
	if state then
		print("ON")
	else
		print("OFF")
	end
end)</code></pre>

<h2>Create A Slider</h2>
<pre><code>local Slider = Window:CreateSlider("Slider", 100, function(value)
	print(value)
end)</code></pre>

<h2>Create A Dropdown</h2>
<pre><code>local options = {"Option 1", "Option 2", "Option 3"}
	local Dropdown = Window:CreateDropDown("Select an Option", options, function(selectedOption)
	print("You selected: " .. selectedOption)
end)</code></pre>

<h2>Add A Notification</h2>
<pre><code>local Notification = SuperSploit:CreateNotification("Test Title", "This is a description for the test.", 5)</code></pre>

<h2>Create A Info Label</h2>
<pre><code>local Info = Window:CreateInfo("Info")</code></pre>
  
<h2>Add A Not Working Warning</h2>
<pre><code>local Info = Window:CreateStatusBad()</code></pre>
  
<h2>Add A Some things Are Not Working Warning</h2>
<pre><code>local Info = Window:CreateStatusOkay()</code></pre>
  
<h2>Add A Working Warning</h2>
<pre><code>local Info = Window:CreateStatusGreat()</code></pre>
