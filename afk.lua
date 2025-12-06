local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
math.randomseed(tick())

-- Fungsi notifikasi sederhana
local function showNotification(message)
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "Notification_" .. math.random(1,999999)

    local textLabel = Instance.new("TextLabel", screenGui)
    textLabel.Size = UDim2.new(1, 0, 0, 50)
    textLabel.Position = UDim2.new(0, 0, 0.05, 0) -- di tengah atas layar
    textLabel.BackgroundTransparency = 1
    textLabel.Text = message
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- hijau neon
    textLabel.Font = Enum.Font.GothamSemibold
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0.5 -- biar mudah dibaca

    -- Hilang setelah 1 detik
    task.delay(1, function()
        screenGui:Destroy()
    end)
end

-- Loop Anti-AFK dengan random interval 15-30 detik
task.spawn(function()
    while true do
        local waitTime = math.random(15,30)
        task.wait(waitTime)

        -- Fake click virtual
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(0.2 + math.random() * 0.2)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)

        showNotification("⚡ System Active – AFK Bypassed ("..waitTime.."s)")
    end
end)
