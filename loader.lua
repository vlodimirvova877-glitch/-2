-- ============================================
-- ЗАГРУЗЧИК MURDER HUB
-- ============================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Создаём GUI для ввода ключа
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player.PlayerGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 400, 0, 200)
Main.Position = UDim2.new(0.5, -200, 0.5, -100)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.BackgroundTransparency = 0.08
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🔑 Введите ключ"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

-- Поле ввода
local Box = Instance.new("TextBox")
Box.Parent = Main
Box.Position = UDim2.new(0.1, 0, 0, 70)
Box.Size = UDim2.new(0.8, 0, 0, 45)
Box.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
Box.BackgroundTransparency = 0.5
Box.BorderSizePixel = 0
Box.Font = Enum.Font.Gotham
Box.PlaceholderText = "Введите ключ..."
Box.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
Box.Text = ""
Box.TextSize = 16
Box.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)

-- Статус
local Status = Instance.new("TextLabel")
Status.Parent = Main
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.new(0, 0, 0, 135)
Status.BackgroundTransparency = 1
Status.Text = "Получите ключ: https://t.me/beta_scriptsbot"
Status.TextColor3 = Color3.fromRGB(170, 170, 190)
Status.TextSize = 13
Status.Font = Enum.Font.Gotham
Status.Parent = Main

-- Кнопка закрытия
local Close = Instance.new("TextButton")
Close.Parent = Main
Close.Position = UDim2.new(1, -40, 0, 5)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.BackgroundTransparency = 1
Close.Text = "✕"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 28
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Проверка ключа
local VALID_KEY = "murder2026"

Box.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    if Box.Text == VALID_KEY then
        Status.Text = "✅ Ключ верный! Загрузка..."
        Status.TextColor3 = Color3.fromRGB(0, 255, 100)
        task.wait(0.5)
        ScreenGui:Destroy()
        
        -- Загружаем основной скрипт с исправленным Rayfield
        loadstring(game:HttpGet('https://raw.githubusercontent.com/vlodimirvova877-glitch/-2/refs/heads/main/hub_fixed.lua'))()
    else
        Status.Text = "❌ Неверный ключ! Попробуйте снова"
        Status.TextColor3 = Color3.fromRGB(255, 50, 50)
        Box.Text = ""
        task.wait(2)
        Status.Text = "Получите ключ: https://t.me/beta_scriptsbot"
        Status.TextColor3 = Color3.fromRGB(170, 170, 190)
    end
end)
