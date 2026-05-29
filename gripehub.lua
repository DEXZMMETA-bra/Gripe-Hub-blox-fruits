-- [[ GRIPE HUB - INTERFACE PRÓPRIA E TRANSPARENTE ]] --
-- Desenvolvido do zero com cantos arredondados e design Uva Premium 🍇

local GripeHubUI = {}

function GripeHubUI:CreateWindow()
    -- Destrói a interface antiga se ela já estiver aberta para não duplicar
    if game:GetService("CoreGui"):FindFirstChild("GripeHub") then
        game:GetService("CoreGui").GripeHub:Destroy()
    end

    -- Tela Principal (ScreenGui)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "GripeHub"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Corpo do Menu (Main Frame) com Transparência
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 10, 25) -- Fundo Uva Escuro
    MainFrame.BackgroundTransparency = 0.25 -- Transparência Premium estilo Acrylic
    MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
    MainFrame.Size = UDim2.new(0, 550, 0, 380)
    MainFrame.Active = true
    MainFrame.Draggable = true -- Permite arrastar o menu pela tela do celular

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    -- Barra de Título (Header)
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.BackgroundColor3 = Color3.fromRGB(45, 15, 65)
    Header.BackgroundTransparency = 0.4
    Header.Size = UDim2.new(1, 0, 0, 45)

    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header

    local Title = Instance.new("TextLabel")
    Title.Parent = Header
    Title.Text = "🍇 Gripe Hub | Leviathan Sea"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0, 300, 1, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Painel Lateral de Abas (Sidebar)
    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    Sidebar.BackgroundTransparency = 0.5
    Sidebar.Position = UDim2.new(0, 10, 0, 55)
    Sidebar.Size = UDim2.new(0, 140, 0, 315)
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 400)
    Sidebar.ScrollBarThickness = 0

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 8)
    SidebarCorner.Parent = Sidebar

    local SidebarLayout = Instance.new("UIListLayout")
    SidebarLayout.Parent = Sidebar
    SidebarLayout.Padding = UDim.new(0, 6)

    -- Container de Conteúdo (Onde os botões aparecem)
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Parent = MainFrame
    Container.BackgroundColor3 = Color3.fromRGB(35, 15, 45)
    Container.BackgroundTransparency = 0.6
    Container.Position = UDim2.new(0, 160, 0, 55)
    Container.Size = UDim2.new(0, 380, 0, 315)

    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 8)
    ContainerCorner.Parent = Container

    -- Sistema interno para alternar entre as abas
    local Tabs = {}
    local FirstTab = true

    function Tabs:CreateTab(tabName)
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = tabName .. "_Content"
        TabContent.Parent = Container
        TabContent.Size = UDim2.new(1, -20, 1, -20)
        TabContent.Position = UDim2.new(0, 10, 0, 10)
        TabContent.BackgroundTransparency = 1
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 600)
        TabContent.ScrollBarThickness = 2
        TabContent.Visible = FirstTab
        FirstTab = false

        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = TabContent
        ContentLayout.Padding = UDim.new(0, 8)

        -- Botão da Aba na Sidebar
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.Size = UDim2.new(1, 0, 0, 35)
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 20, 90)
        TabButton.BackgroundTransparency = 0.3
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(230, 230, 230)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextSize = 13

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 6)
        BtnCorner.Parent = TabButton

        TabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(Container:GetChildren()) do
                if child:IsA("ScrollingFrame") then child.Visible = false end
            end
            TabContent.Visible = true
        end)

        -- Elemento: Criar um Toggle (Ativador)
        function TabContent:CreateToggle(toggleName, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Parent = TabContent
            ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 20, 70)
            ToggleFrame.BackgroundTransparency = 0.4

            local TFCorner = Instance.new("UICorner")
            TFCorner.CornerRadius = UDim.new(0, 6)
            TFCorner.Parent = ToggleFrame

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.Text = toggleName
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.TextSize = 14
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 250, 1, 0)
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.BackgroundTransparency = 1

            local ClickButton = Instance.new("TextButton")
            ClickButton.Parent = ToggleFrame
            ClickButton.Position = UDim2.new(1, -45, 0, 10)
            ClickButton.Size = UDim2.new(0, 35, 0, 20)
            ClickButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            ClickButton.Text = ""
            
            local CBCorner = Instance.new("UICorner")
            CBCorner.CornerRadius = UDim.new(0, 4)
            CBCorner.Parent = ClickButton

            local state = false
            ClickButton.MouseButton1Click:Connect(function()
                state = not state
                if state then
                    ClickButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50) -- Verde ativo
                else
                    ClickButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Vermelho inativo
                end
                callback(state)
            end)
        end

        -- Elemento: Criar um Botão Simples
        function TabContent:CreateButton(btnText, callback)
            local ActionBtn = Instance.new("TextButton")
            ActionBtn.Parent = TabContent
            ActionBtn.Size = UDim2.new(1, 0, 0, 40)
            ActionBtn.BackgroundColor3 = Color3.fromRGB(75, 25, 110)
            ActionBtn.BackgroundTransparency = 0.3
            ActionBtn.Text = btnText
            ActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            ActionBtn.Font = Enum.Font.GothamBold
            ActionBtn.TextSize = 14

            local ABCorner = Instance.new("UICorner")
            ABCorner.CornerRadius = UDim.new(0, 6)
            ABCorner.Parent = ActionBtn

            ActionBtn.MouseButton1Click:Connect(callback)
        end

        return TabContent
    end

    return Tabs
end

-- =================================================================
-- CONFIGURAÇÃO DE ABAS E COMANDOS DO GRIPE HUB
-- =================================================================
local MyWindow = GripeHubUI:CreateWindow()

local Tab1 = MyWindow:CreateTab("Skills Config")
local Tab2 = MyWindow:CreateTab("Auto Leviathan")
local Tab3 = MyWindow:CreateTab("Teleports")
local Tab4 = MyWindow:CreateTab("Configurações")

-- Funções da Aba 1: Skills
Tab1:CreateToggle("Usar Habilidades de Melee (Z,X,C)", function(state) _G.UseMelee = state end)
Tab1:CreateToggle("Usar Habilidades de Espada (Z,X)", function(state) _G.UseSword = state end)
Tab1:CreateToggle("Usar Habilidades de Fruta (Z,X,C,V,F)", function(state) _G.UseFruit = state end)
Tab1:CreateToggle("Usar Habilidades de Arma (Z,X)", function(state) _G.UseGun = state end)

-- Funções da Aba 2: Leviathan Boss
Tab2:CreateToggle("Auto Encontrar Leviatã", function(state) _G.FindLevi = state end)
Tab2:CreateToggle("Auto Destruir Segmentos e Cabeça", function(state) _G.KillLevi = state end)
Tab2:CreateToggle("Super Clique Rápido (T-Rex/Kitsune)", function(state)
    _G.InstaClick = state
    if state then
        task.spawn(function()
            while _G.InstaClick do
                task.wait()
                local p = game.Players.LocalPlayer
                if p.Character and p.Character:FindFirstChildOfClass("Tool") then
                    p.Character:FindFirstChildOfClass("Tool"):Activate()
                end
            end
        end)
    end
end)

Tab2:CreateButton("Teleport: Ilha Congelada (NPC Spy)", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21000, 20, -15000)
end)
Tab2:CreateToggle("Invocador de Barco Fantasma", function(state) _G.FakePlayerBoat = state end)
Tab2:CreateToggle("Auto Arpão no Coração", function(state) _G.AutoHarpoon = state end)
Tab2:CreateToggle("Barco Voador / Super Velocidade", function(state) _G.FlyBoat = state end)

-- Funções da Aba 3: Teleports extras
Tab3:CreateButton("Ir para Hydra Island", function() --[[ Código CFrame ]] end)
Tab3:CreateToggle("Praticar Desvios Sozinho", function(state) _G.AutoPractice = state end)

-- Funções da Aba 4: Otimização
Tab4:CreateToggle("FPS Booster (Remover Lag do Mar)", function(state)
    _G.FPSBoost = state
    if state then
        task.spawn(function()
            while _G.FPSBoost do
                task.wait(2)
                for _, v in pairs(game:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("MeshPart") then
                        v.Material = Enum.Material.SmoothPlastic
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Enabled = false
                    end
                end
            end
        end)
    end
end)
