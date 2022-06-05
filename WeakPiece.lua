repeat wait() until game:IsLoaded()
local StarterGui = game:GetService("StarterGui")
local vu = game:GetService("VirtualInputManager")

StarterGui:SetCore("SendNotification", { 
	Title="Weak Piece";
    Text="Auto Farm Running";
    Duration=10;
})

repeat wait() until game:IsLoaded()
print('doing check')
if workspace:FindFirstChild("Mon") ~= nil then -- IS DUNGEON
    print('is dungeon')
    wait(1.5)
    local char = game.Players.LocalPlayer.Character
    local success, err = pcall(function()
        game.Players.LocalPlayer.Backpack:FindFirstChild("Lighting").Parent = game.Players.LocalPlayer.Character
        local args = {[1] = "Teleflash", [2] = Vector3.new(-0.0818870142, 197.129883, 2.96763754)}
        game:GetService("Players").LocalPlayer.Character.Lighting.Event:FireServer(unpack(args))
        game.Players.LocalPlayer.Character:FindFirstChild("Lighting").Parent = game.Players.LocalPlayer.Backpack    
    end)

    if not success then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.0818870142, 197.129883, 2.96763754)
    end

    local pl = Instance.new("Part", workspace)
    pl.Position = Vector3.new(-0.0818870142, 195.129883, 2.96763754)
    pl.Size = Vector3.new(25,0.5,25)
    pl.Anchored = true

    wait(0.5)

    game.Players.LocalPlayer.Backpack:WaitForChild("3SS").Parent = game.Players.LocalPlayer.Character

    while wait(1) do
        vu:SendMouseButtonEvent(0.5, 0.5, 0, true, game, 0)
        vu:SendMouseButtonEvent(0.5, 0.5, 0, false, game, 0)
    end
else -- NOT DUNGEON
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Lighting")
    wait(3)
    game.Players.LocalPlayer.Backpack["Lighting"].Parent = game.Players.LocalPlayer.Character

    local args = {[1] = "Teleflash", [2] = Vector3.new(36.9702, 95.6252, 727.701)}
    game.Players.LocalPlayer.Character.Lighting.Event:FireServer(unpack(args))    
end