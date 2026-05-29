-- [[ GRIPE HUB - FLUENT UI PREMIUM EDITION ]] --
-- Interface idêntica aos melhores scripts atuais (Efeito Acrylic / Windows 11)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/main/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/main/Addons/InterfaceManager.lua"))()

-- Criando a Janela Principal no estilo Fluent
local Window = Fluent:CreateWindow({
    Title = "Gripe Hub 🍇",
    SubTitle = "by Developer",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- Ativa o efeito borrado transparente super moderno
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Aperte CTRL Esquerdo para ocultar/mostrar o menu
})

-- Criando as Abas Laterais
local Tabs = {
    Skills = Window:AddTab({ Title = "Config Skills", Icon = "sword" }),
    Leviathan = Window:AddTab({ Title = "Auto Leviathan", Icon = "skull" }),
    Teleport = Window:AddTab({ Title = "Teleports", Icon = "map-pin" }),
    Settings = Window:AddTab({ Title = "Configurações", Icon = "settings" })
}

-- Notificação Inicial de Sucesso
Fluent:Notify({
    Title = "Gripe Hub",
    Content = "Script injetado com sucesso na Fluent UI!",
    Duration = 5
})

-- Variáveis Globais de Controle
_G.UseMelee = false
_G.UseSword = false
_G.UseFruit = false
_G.UseGun = false

-- =================================================================
-- ABA 1: CONFIGURAÇÃO DE SKILLS
-- =================================================================
Tabs.Skills:AddSection("Estilo de Luta (Z, X, C)")
local ToggleMelee = Tabs.Skills:AddToggle("ToggleMelee", { Title = "Ativar Habilidades de Melee", Default = false })
ToggleMelee:OnChanged(function() _G.UseMelee = ToggleMelee.Value end)

Tabs.Skills:AddSection("Espada (Z, X)")
local ToggleSword = Tabs.Skills:AddToggle("ToggleSword", { Title = "Ativar Habilidades de Espada", Default = false })
ToggleSword:OnChanged(function() _G.UseSword = ToggleSword.Value end)

Tabs.Skills:AddSection("Fruta (Z, X, C, V, F)")
local ToggleFruit = Tabs.Skills:AddToggle("ToggleFruit", { Title = "Ativar Habilidades de Fruta", Default = false })
ToggleFruit:OnChanged(function() _G.UseFruit = ToggleFruit.Value end)

Tabs.Skills:AddSection("Armas (Z, X)")
local ToggleGun = Tabs.Skills:AddToggle("ToggleGun", { Title = "Ativar Habilidades de Arma", Default = false })
ToggleGun:OnChanged(function() _G.UseGun = ToggleGun.Value end)


-- =================================================================
-- ABA 2: AUTO LEVIATHAN (Mecânicas Principais)
-- =================================================================
Tabs.Leviathan:AddSection("Caça e Combate")

local ToggleFind = Tabs.Leviathan:AddToggle("ToggleFind", { Title = "Auto Encontrar Leviatã", Default = false })
ToggleFind:OnChanged(function() _G.FindLevi = ToggleFind.Value end)

local ToggleKill = Tabs.Leviathan:AddToggle("ToggleKill", { Title = "Auto Destruir Segmentos/Cabeça", Default = false })
ToggleKill:OnChanged(function() _G.KillLevi = ToggleKill.Value end)

local ToggleClick = Tabs.Leviathan:AddToggle("ToggleClick", { Title = "Ataque Ultra-Rápido (T-Rex/Kitsune)", Default = false })
ToggleClick:OnChanged(function()
    _G.InstaClick = ToggleClick.Value
    if _G.InstaClick then
        task.spawn(function()
            while _G.InstaClick do
                task.wait() -- Velocidade insana de cliques
                local p = game.Players.LocalPlayer
                if p.Character and p.Character:FindFirstChildOfClass("Tool") then
                    p.Character:FindFirstChildOfClass("Tool"):Activate()
                end
            end
        end)
    end
end)

Tabs.Leviathan:AddSection("Gerenciamento do Mar")

Tabs.Leviathan:AddButton({
    Title = "Teleport: Ilha Congelada (NPC Spy)",
    Description = "Corta caminho direto para a Frozen Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21000, 20, -15000)
    end
})

local ToggleFakeBoat = Tabs.Leviathan:AddToggle("ToggleFakeBoat", { Title = "Invocador de Barco Fantasma", Default = false })
ToggleFakeBoat:OnChanged(function() _G.FakePlayerBoat = ToggleFakeBoat.Value end)

local ToggleHarpoon = Tabs.Leviathan:AddToggle("ToggleHarpoon", { Title = "Auto Lançar Arpão (Coração)", Default = false })
ToggleHarpoon:OnChanged(function() _G.AutoHarpoon = ToggleHarpoon.Value end)

local ToggleFlyBoat = Tabs.Leviathan:AddToggle("ToggleFlyBoat", { Title = "Barco Voador / Super Velocidade", Default = false })
ToggleFlyBoat:OnChanged(function() _G.FlyBoat = ToggleFlyBoat.Value end)


-- =================================================================
-- ABA 3: TELEPORTS & TREINO
-- =================================================================
Tabs.Teleport:AddSection("Navegação Local")

Tabs.Teleport:AddButton({
    Title = "Auto ir para Hydra Island",
    Callback = function() --[[ Movimentação via CFrame ]] end
})

local TogglePractice = Tabs.Teleport:AddToggle("TogglePractice", { Title = "Praticar Desvios (Treino Solo)", Default = false })
TogglePractice:OnChanged(function() _G.AutoPractice = TogglePractice.Value end)


-- =================================================================
-- ABA 4: CONFIGURAÇÕES E OTIMIZAÇÃO (FPS)
-- =================================================================
Tabs.Settings:AddSection("Performance")

local ToggleFPS = Tabs.Settings:AddToggle("ToggleFPS", { Title = "FPS Booster (Remover Lag do Mar)", Default = false })
ToggleFPS:OnChanged(function()
    _G.FPSBoost = ToggleFPS.Value
    if _G.FPSBoost then
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

-- Integração nativa de configurações da Fluent
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("GripeHub_Fluent")
SaveManager:SetFolder("GripeHub_Fluent/configs")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
