local scriptUrl = "https://raw.githubusercontent.com/Xdblaze7115/scripts/refs/heads/main/" .. game.PlaceId .. ".lua"

local success, result = pcall(function()
    return game:HttpGet(scriptUrl, true)
end)

if success and result and result ~= "" then
    local Library = loadstring(result)()
else
    warn("Failed to load script. HTTP request returned nil or an error. Check the URL or server response.")
end
