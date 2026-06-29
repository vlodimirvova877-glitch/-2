local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player.PlayerGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 520, 0, 240)
Main.Position = UDim2.new(0.5, -260, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(28,28,28)
Main.BorderSizePixel = 0
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,25,0,18)
Title.Size = UDim2.new(0,200,0,30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Проверка ключа"
Title.TextSize = 20
Title.TextColor3 = Color3.new(1,1,1)
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = Main
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0,25,0,46)
Subtitle.Size = UDim2.new(0,200,0,20)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Введите ключ"
Subtitle.TextSize = 15
Subtitle.TextColor3 = Color3.fromRGB(170,170,170)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

local Box = Instance.new("TextBox")
Box.Parent = Main
Box.Position = UDim2.new(0,25,0,105)
Box.Size = UDim2.new(0,200,0,42)
Box.BackgroundColor3 = Color3.fromRGB(48,48,48)
Box.BorderSizePixel = 0
Box.Font = Enum.Font.Gotham
Box.PlaceholderText = "key"
Box.PlaceholderColor3 = Color3.fromRGB(120,120,120)
Box.Text = ""
Box.TextSize = 15
Box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Box).CornerRadius = UDim.new(0,14)

local Note = Instance.new("TextLabel")
Note.Parent = Main
Note.BackgroundTransparency = 1
Note.Position = UDim2.new(0,280,0,55)
Note.Size = UDim2.new(0,220,0,50)
Note.Font = Enum.Font.Gotham
Note.Text = "Система ключей предназначена для работы с ключом для авторизованным пользователем."
Note.TextWrapped = true
Note.TextSize = 13
Note.TextColor3 = Color3.fromRGB(180,180,180)
Note.TextXAlignment = Enum.TextXAlignment.Center
Note.TextYAlignment = Enum.TextYAlignment.Top

local InstLabel = Instance.new("TextLabel")
InstLabel.Parent = Main
InstLabel.BackgroundTransparency = 1
InstLabel.Position = UDim2.new(0, 280, 0, 110)
InstLabel.Size = UDim2.new(0, 120, 0, 30)
InstLabel.Font = Enum.Font.GothamBold
InstLabel.Text = "Инструкция:"
InstLabel.TextSize = 18
InstLabel.TextColor3 = Color3.fromRGB(180,180,180)
InstLabel.TextXAlignment = Enum.TextXAlignment.Left

local Help = Instance.new("TextButton")
Help.Parent = Main
Help.Size = UDim2.new(0,24,0,24)
Help.Position = UDim2.new(0, 395, 0, 113)
Help.BackgroundColor3 = Color3.fromRGB(55,55,55)
Help.BorderSizePixel = 0
Help.Text = "?"
Help.Font = Enum.Font.GothamBold
Help.TextSize = 14
Help.TextColor3 = Color3.fromRGB(180,180,180)
Instance.new("UICorner",Help).CornerRadius = UDim.new(1,0)

local HelpFrame = Instance.new("Frame")
HelpFrame.Parent = Main
HelpFrame.Visible = false
HelpFrame.Size = UDim2.new(0,170,0,220)
HelpFrame.Position = UDim2.new(0, 430, 0, 10)
HelpFrame.BackgroundColor3 = Color3.fromRGB(36,36,36)
HelpFrame.BorderSizePixel = 0
HelpFrame.ZIndex = 20
Instance.new("UICorner", HelpFrame).CornerRadius = UDim.new(0,10)

local HelpText = Instance.new("TextLabel")
HelpText.Parent = HelpFrame
HelpText.BackgroundTransparency = 1
HelpText.Position = UDim2.new(0,10,0,10)
HelpText.Size = UDim2.new(1,-20,1,-20)
HelpText.Font = Enum.Font.Gotham
HelpText.TextSize = 12
HelpText.TextColor3 = Color3.new(1,1,1)
HelpText.TextWrapped = true
HelpText.TextXAlignment = Enum.TextXAlignment.Left
HelpText.TextYAlignment = Enum.TextYAlignment.Top
HelpText.ZIndex = 21
HelpText.Text = [[
1. Скопируйте ссылку на ключ.

2. Вставьте её в любой браузер.

3. Нажмите в боте /start.

4. Нажмите «Получить ключ».

5. Пройдите капчу.

6. Скопируйте ключ и вставьте его в поле Key.
]]

local Copy = Instance.new("TextButton")
Copy.Parent = Main
Copy.Position = UDim2.new(0, 310, 0, 160)
Copy.Size = UDim2.new(0, 160, 0, 38)
Copy.BackgroundColor3 = Color3.fromRGB(65,65,65)
Copy.BorderSizePixel = 0
Copy.Text = "Получить ключ"
Copy.Font = Enum.Font.GothamBold
Copy.TextSize = 15
Copy.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Copy).CornerRadius = UDim.new(0,14)

local Close = Instance.new("TextButton")
Close.Parent = Main
Close.Position = UDim2.new(1,-40,0,10)
Close.Size = UDim2.new(0,30,0,30)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 32
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.ZIndex = 10

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
Help.MouseButton1Click:Connect(function()
    HelpFrame.Visible = not HelpFrame.Visible
end)
Copy.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/beta_scriptsbot")
    Box.PlaceholderText = "скопировано"
    Box.Text = ""
    task.wait(2)
    Box.PlaceholderText = "key"
end)

-- ===== ПРОВЕРКА НА СПАВНЕ =====
local function isOnMap()
    local char = Player.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    local pos = hrp.Position
    
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") 
            and v.Name:lower():find("coin") 
            and v.Parent 
            and v.Transparency < 0.9 
        then
            local dist = (v.Position - pos).Magnitude
            if dist < 100 then
                return true
            end
        end
    end
    
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Parent then
            local name = v.Name:lower()
            if name:find("lobby") or name:find("spawn") or name:find("waiting") then
                if (v.Position - pos).Magnitude < 50 then
                    return false
                end
            end
        end
    end
    
    return false
end

-- ===== ФАРМ С ТВИНАМИ =====
local farmToggle = false

local function moveToStep(pos)
    local char = Player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local STEP = 30

    while (pos - hrp.Position).Magnitude > STEP do
        local direction = (pos - hrp.Position).Unit
        local nextPos = hrp.Position + direction * STEP

        local tween = TweenService:Create(
            hrp,
            TweenInfo.new(0.4, Enum.EasingStyle.Linear),
            {CFrame = CFrame.new(nextPos + Vector3.new(0, 2, 0))}
        )
        tween:Play()
        tween.Completed:Wait()
    end

    local tween = TweenService:Create(
        hrp,
        TweenInfo.new(0.4, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(pos + Vector3.new(0, 2, 0))}
    )
    tween:Play()
    tween.Completed:Wait()
end

local function startCoinFarmStep(isActive)
    local p = Player
    local collectedCoins = {}

    local function getNearestCoin()
        local char = p.Character
        if not char then return nil end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        local nearest, nearestDist = nil, math.huge
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart")
                and v.Name:lower():find("coin")
                and v.Parent ~= nil
                and not collectedCoins[v]
                and v.Transparency < 0.9
            then
                local dist = (v.Position - hrp.Position).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearest = v
                end
            end
        end
        return nearest
    end

    task.spawn(function()
        while true do
            task.wait(15)
            collectedCoins = {}
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.3)

            if not isActive() then continue end
            if not isOnMap() then 
                task.wait(1)
                continue 
            end

            local char = p.Character
            if not char then continue end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end

            local coin = getNearestCoin()
            if not coin then
                collectedCoins = {}
                task.wait(1)
                continue
            end

            moveToStep(coin.Position)
            task.wait(0.3)

            if coin and coin.Parent then
                pcall(function()
                    if firetouchinterest then
                        firetouchinterest(hrp, coin, 0)
                        task.wait(0.3)
                        firetouchinterest(hrp, coin, 1)
                    end
                end)
            end

            if coin and coin.Parent then
                collectedCoins[coin] = true
            end
        end
    end)
end

-- ===== ФАРМ ТП (С ЗАЩИТОЙ ОТ КИКА) =====
local farmTpToggle = false

local function startCoinFarmTp(isActive)
    local p = Player
    local collectedCoins = {}
    local lastTp = tick()
    local tpCount = 0

    local function getNearestCoin()
        local char = p.Character
        if not char then return nil end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return nil end
        local nearest, nearestDist = nil, math.huge
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart")
                and v.Name:lower():find("coin")
                and v.Parent ~= nil
                and not collectedCoins[v]
                and v.Transparency < 0.9
            then
                local dist = (v.Position - hrp.Position).Magnitude
                if dist < nearestDist then
                    nearestDist = dist
                    nearest = v
                end
            end
        end
        return nearest
    end

    task.spawn(function()
        while true do
            task.wait(15)
            collectedCoins = {}
        end
    end)

    task.spawn(function()
        while true do
            -- Базовая задержка
            local baseDelay = 0.75
            
            -- Если было много ТП за последнюю секунду - увеличиваем задержку
            if tick() - lastTp < 1 then
                tpCount = tpCount + 1
                if tpCount > 3 then
                    baseDelay = 1.5 -- замедляемся если больше 3 ТП в секунду
                    tpCount = 0
                end
            else
                tpCount = 0
            end
            
            task.wait(baseDelay)

            if not isActive() then continue end
            if not isOnMap() then 
                task.wait(1)
                continue 
            end

            local char = p.Character
            if not char then continue end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end

            local coin = getNearestCoin()
            if not coin then
                collectedCoins = {}
                task.wait(1)
                continue
            end

            -- Проверка дистанции (не ТП если слишком далеко)
            local dist = (coin.Position - hrp.Position).Magnitude
            if dist > 200 then
                collectedCoins[coin] = true
                continue
            end

            -- Имитация прыжка перед ТП
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
            
            task.wait(0.1)
            
            -- Плавное ТП с небольшим разбросом
            local offset = Vector3.new(
                math.random(-1, 1) * 0.5,
                2,
                math.random(-1, 1) * 0.5
            )
            hrp.CFrame = CFrame.new(coin.Position + offset)
            lastTp = tick()
            
            task.wait(0.3)

            if coin and coin.Parent then
                pcall(function()
                    if firetouchinterest then
                        firetouchinterest(hrp, coin, 0)
                        task.wait(0.3)
                        firetouchinterest(hrp, coin, 1)
                    end
                end)
            end

            if coin and coin.Parent then
                collectedCoins[coin] = true
            end
        end
    end)
end

-- ===== RAYFIELD =====
local function LaunchRayfield()
    local ok, Rayfield = pcall(function()
        return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)
    if not ok or not Rayfield then
        warn("Rayfield не загрузился")
        return
    end

    local Window = Rayfield:CreateWindow({
        Name = "Murder Mystery 2 v2-0-0",
        LoadingTitle = "Загрузка...",
        LoadingSubtitle = "Мобильная версия",
        ConfigurationSaving = { Enabled = false },
        Discord = { Enabled = false },
        KeySystem = false
    })

    local AutoTab = Window:CreateTab("АВТО", 4483362458)

    local farmStepStarted = false
    AutoTab:CreateToggle({
        Name = "Авто фарм монет",
        CurrentValue = false,
        Flag = "CoinFarm",
        Callback = function(Value)
            farmToggle = Value
            if Value and not farmStepStarted then
                farmStepStarted = true
                startCoinFarmStep(function() return farmToggle end)
            end
            Rayfield:Notify({
                Title = "Фарм монет",
                Content = Value and "Включён!" or "Выключен!",
                Duration = 2,
                Image = "check"
            })
        end
    })

    local farmTpStarted = false
    AutoTab:CreateToggle({
        Name = "Авто фарм ТП",
        CurrentValue = false,
        Flag = "CoinFarmTp",
        Callback = function(Value)
            farmTpToggle = Value
            if Value and not farmTpStarted then
                farmTpStarted = true
                startCoinFarmTp(function() return farmTpToggle end)
            end
            Rayfield:Notify({
                Title = "Фарм ТП",
                Content = Value and "Включён!" or "Выключен!",
                Duration = 2,
                Image = "check"
            })
        end
    })

    Rayfield:Notify({
        Title = "Murder Mystery 2",
        Content = "Меню загружено!",
        Duration = 2,
        Image = "check"
    })
end

-- ===== КЛЮЧ =====
local VALID_KEY = "murder2026"
Box.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    if Box.Text == VALID_KEY then
        ScreenGui:Destroy()
        pcall(LaunchRayfield)
    else
        Box.Text = ""
        Box.PlaceholderText = "Неверный ключ!"
    end
end)
