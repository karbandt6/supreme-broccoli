local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- Fungsi notifikasi cepat
local function showNotification(message)
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "Notification_" .. math.random(1,999999)

    local textLabel = Instance.new("TextLabel", screenGui)
    textLabel.Size = UDim2.new(0, 300, 0, 40)
    textLabel.Position = UDim2.new(0.5, -150, 0, 50)
    textLabel.AnchorPoint = Vector2.new(0.5, 0)
    textLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.GothamSemibold
    textLabel.TextScaled = true
    textLabel.Text = message

    -- Hilang setelah 1 detik
    task.delay(1, function()
        screenGui:Destroy()
    end)
end

-- Loop Anti-AFK
while true do
    task.wait(20) -- setiap 20 detik

    -- fake click
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(0.2)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

    showNotification("💤 Anti-AFK clicked")
end
