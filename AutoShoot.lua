-- Asesinos VS Sheriffs - Auto Shoot
local VirtualInput = game:GetService("VirtualInputManager")
local active = false

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 80)
frame.Position = UDim2.new(0.5, -60, 0.8, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BackgroundTransparency = 0.1
frame.Draggable = true
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 100, 0, 35)
btn.Position = UDim2.new(0.5, -50, 0, 10)
btn.Text = "ACTIVAR"
btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
btn.BackgroundTransparency = 0.2
btn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = btn

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 52)
status.BackgroundTransparency = 1
status.Text = "🔴 INACTIVO"
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.Font = Enum.Font.Gotham
status.TextSize = 10
status.Parent = frame

btn.MouseButton1Click:Connect(function()
    active = not active
    btn.Text = active and "DESACTIVAR" or "ACTIVAR"
    btn.BackgroundColor3 = active and Color3.fromRGB(50, 200, 100) or Color3.fromRGB(200, 50, 50)
    status.Text = active and "🟢 ACTIVADO" or "🔴 INACTIVO"
    status.TextColor3 = active and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if active then
        VirtualInput:SendMouseButtonEvent(Enum.UserInputType.MouseButton1, 0, false)
        task.wait(0.05)
        VirtualInput:SendMouseButtonEvent(Enum.UserInputType.MouseButton1, 0, true)
    end
end)

print("Auto Shoot listo - Juego: Asesinos VS Sheriffs")
