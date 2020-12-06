local ui = script.Parent.TwitterCodesPopUp
local box = ui.EnterCodeBox
local b1 = script.Parent.ImageButton
local b2 = ui.RedeemButton
local b3 = ui.ImageButton
local b4 = script.Parent.MenuButton
local ui2 = script.Parent.MenuPopUp
local b5 = ui2.CloseButton
local count = 0
local entered = false

local function openClose()
	if ui.Visible == false then
		ui.Visible = true
	else
		ui.Visible = false
	end
	wait(0.2)
end

b1.Activated:Connect(openClose)
b3.Activated:Connect(openClose)

local function openCloseMenu()
	if ui2.Visible == false then
		ui2.Visible = true
	else
		ui2.Visible = false
	end
	wait(0.2)
end

b4.Activated:Connect(openCloseMenu)
b5.Activated:Connect(openCloseMenu)

local function checkCode()
	local txt = box.Text
	if txt ~= "" and txt ~= box.PlaceholderText then
		local addclicks, addgems = game.ReplicatedStorage.Codes:InvokeServer(txt)
		print(addclicks)
		print(addgems)
		box.TextColor3 = Color3.fromRGB(34,139,34)
		if addclicks == 0 and addgems == 0 then
			box.TextColor3 = Color3.fromRGB(178,34,34)
			box.Text = "Code Already Redeemed!"
		elseif addclicks == -1 and addgems == -1 then
			box.TextColor3 = Color3.fromRGB(178,34,34) -- red
			box.Text = "Invalid Code!"
		elseif addclicks == 0 then
			box.Text = "Successfully redeemed " ..txt.. " and you have received " .. addgems .. " Gems!"
		elseif addgems == 0 then
			box.Text = "Successfully redeemed " .. txt .. " and you have received " .. addclicks .. " Clicks!"
		else
			box.Text = "Successfully redeemed " .. txt .. " and you have received " .. addclicks .. " Clicks and " .. addgems .. " Gems!"
		end
		wait(0.1)
		for i = 1, 50, 1 do
			if box:IsFocused() == true then
				box.TextColor3 = Color3.fromRGB(63, 63, 63)
				print("Focused")
				entered = true
				return
			end
			wait(0.1)
		end
		print("done with count")
		if entered == false then
			box.Text = ""
			box.TextColor3 = Color3.fromRGB(63, 63, 63)
		end
	end
end

b2.Activated:Connect(checkCode)
box.FocusLost:Connect(checkCode)