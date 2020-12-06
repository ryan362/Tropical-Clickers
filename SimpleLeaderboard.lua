game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr
	local Clicks = Instance.new("IntValue")
	Clicks.Name = "Clicks"
	Clicks.Value = 0
	Clicks.Parent = leaderstats
	local Gems = Instance.new("IntValue")
	Gems.Name = "Gems"
	Gems.Value = 0
	Gems.Parent = leaderstats
end)