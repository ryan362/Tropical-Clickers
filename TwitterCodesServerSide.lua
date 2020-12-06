local dsserv = game:GetService("DataStoreService")
local codeds = dsserv:GetDataStore("codes-test")
local rf = game.ReplicatedStorage:WaitForChild("Codes")
local output = false
local count = 0
local codes = {
	{"RUSSO", 250, 0},
	{"TOFUU", 250, 50},
	{"INTEL", 200, 100},
	{"RELEASE", 250, 0},
	{"TWISTED", 500, 500}
}

local function codeChecker(plr, code)
	local input = code
	for i = 1, #codes do
		if codes[i][1] == input then
			local success, err = pcall(function()
				output = codeds:GetAsync(plr.DisplayName.."-"..input)
			end)
			if success and output == true then
				return 0, 0
			else
				plr.leaderstats.Clicks.Value = plr.leaderstats.Clicks.Value + codes[i][2]
				plr.leaderstats.Gems.Value = plr.leaderstats.Gems.Value + codes[i][3]
				codeds:SetAsync(plr.DisplayName.."-"..input, true)
				return codes[i][2], codes[i][3]
			end
		else
			count = count + 1
			if count == #codes then
				count = 0
				return -1, -1
			end
		end
	end	
end

rf.OnServerInvoke = codeChecker