local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
math.randomseed(tick())

-- Fungsi random warna
local function randomColor()
    return Color3.fromHSV(math.random(), 0.6 + math.random() * 0.4, 1)
end

-- Fungsi notifikasi futuristik
local function showNotification(message)
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "Notification_" .. math.random(1,999999)

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 320, 0, 50)
    frame.Position = UDim2.new(0.5, -160, 0, -60) -- start di atas layar
    frame.AnchorPoint = Vector2.new(0.5, 0)
    frame.BackgroundColor3 = randomColor()
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.Rotation = math.random(-5,5)
    frame.ClipsDescendants = true

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Font = Enum.Font.GothamSemibold
    text.TextScaled = true

    -- Animasi slide down + fade in
    for i = 0, 1, 0.05 do
        frame.Position = UDim2.new(0.5, -160, 0, -60 + i*80) -- turun 80px
        frame.BackgroundTransparency = 0.15 * (1 - i)
        text.TextTransparency = 1 - i
        task.wait(0.03)
    end

    -- Tunggu 1 detik
    task.wait(1)

    -- Animasi fade out
    for i = 0, 1, 0.05 do
        frame.BackgroundTransparency = 0.15 + i
        text.TextTransparency = i
        frame.Position = frame.Position + UDim2.new(0,0,-1,0) -- naik dikit saat hilang
        task.wait(0.03)
    end

    screenGui:Destroy()
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
