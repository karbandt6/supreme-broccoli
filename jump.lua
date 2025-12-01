local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setupAutoJump(char)
    local humanoid = char:WaitForChild("Humanoid")

    while humanoid and humanoid.Parent do
        if humanoid.Health <= 0 then
            break
        end
        
        humanoid.Jump = true

        wait(math.random() * 5 + 1) -- random float antara 1 sampai 6 detik
    end
end

setupAutoJump(character)

player.CharacterAdded:Connect(function(char)
    setupAutoJump(char)
end)
