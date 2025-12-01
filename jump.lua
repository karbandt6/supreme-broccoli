-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Variables
local autoJumpEnabled = true -- langsung aktif
local minDelay = 5
local maxDelay = 15
local minJumps = 1
local maxJumps = 15
local jumpCount = 0

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoJumpGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 180)
frame.Position = UDim2.new(0.85, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Text = "Auto Jump (5–30s | 1–40 jumps)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 14
title.Parent = frame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
toggleBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleBtn.Text = "Auto Jump: ON"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.SourceSans
toggleBtn.TextSize = 16
toggleBtn.Parent = frame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 60)
info.Position = UDim2.new(0, 0, 0.55, 0)
info.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
info.TextColor3 = Color3.fromRGB(255, 255, 255)
info.Text = "Delay: 5–30s\nJump Burst: 1–40\nTotal Jumps: 0"
info.Font = Enum.Font.SourceSans
info.TextSize = 14
info.TextWrapped = true
info.Parent = frame

-- Toggle
local function toggle()
	autoJumpEnabled = not autoJumpEnabled
	toggleBtn.Text = autoJumpEnabled and "Auto Jump: ON" or "Auto Jump: OFF"
end

toggleBtn.MouseButton1Click:Connect(toggle)

-- Auto Jump Loop
task.spawn(function()
	while true do
		if autoJumpEnabled then
			
			-- Random jumlah jump (1–40)
			local burst = math.random(minJumps, maxJumps)

			for i = 1, burst do
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.Jump = true
					jumpCount += 1
					info.Text = "Delay: 5–30s\nJump Burst: 1–40\nTotal Jumps: " .. jumpCount
				end
				task.wait(0.05) -- jeda antar jump biar natural
			end
		end

		-- Delay random 5–30 detik
		local delayTime = math.random(minDelay, maxDelay)
		task.wait(delayTime)
	end
end)
