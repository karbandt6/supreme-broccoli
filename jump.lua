local Players = game:GetService("Players")
local player = Players.LocalPlayer

local autoJumpEnabled = true
local totalJumps = 0

-- GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0.8, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Text = "Auto Jump Step"
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, 0, 0, 95)
info.Position = UDim2.new(0, 0, 0.25, 0)
info.TextColor3 = Color3.fromRGB(255, 255, 255)
info.TextWrapped = true
info.Text = "Waiting..."
info.BackgroundTransparency = 1

local function updateInfo(step, jumps)
	info.Text = 
		"Step Delay: " .. step .. " sec" ..
		"\nBatch Jumps: " .. jumps ..
		"\nTotal Jumps: " .. totalJumps
end

task.spawn(function()
	while true do
		if autoJumpEnabled then

			-- LOOP delay 1 → 5 → ulang
			for delay = 1, 5 do
				
				-- Jumlah jump 10–50
				local batch = math.random(10, 50)
				updateInfo(delay, batch)

				for i = 1, batch do
					if player.Character and player.Character:FindFirstChild("Humanoid") then
						player.Character.Humanoid.Jump = true
						totalJumps += 1
						updateInfo(delay, batch)
					end
					task.wait(delay)
				end
			end
		end

		task.wait(0.1)
	end
end)
