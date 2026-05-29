-- [[ GRIPE HUB - REDZ HUB UI EDITION ]] --
-- Interface moderna, fluida e com design arredondado premium.

local RedzLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZ7191/RedzLibV5/main/Source.lua"))()

-- Criando a Janela Principal
local Window = RedzLibrary:MakeWindow({
    Title = "🍇 Gripe Hub | Leviathan Update",
    SubTitle = "by Developer",
    SaveFolder = "GripeHub_Redz"
})

-- Criando as Abas com Ícones (IDs de imagem do Roblox)
local SkillsTab = Window:MakeTab({"Config Skills", "rbxassetid://4483345998"})
local LeviathanTab = Window:MakeTab({"Auto Leviathan", "rbxassetid://10617046401"})
local TeleportTab = Window:MakeTab({"Teleports", "rbxassetid://4370318616"})
local ConfigTab = Window:MakeTab({"Configurações", "rbxassetid://4483362458"})

-- =================================================================
-- ABA 1: CONFIGURAÇÃO DE SKILLS
-- =================================================================
SkillsTab:AddSection({"Estilo de Luta (Z, X, C)"})
SkillsTab:AddToggle({
    Name = "Ativar Habilidades de Melee",
    Description = "Usa os socos/estilos de luta configurados",
    Default = false,
    Callback = function(state) _G.UseMelee = state end
})

SkillsTab:AddSection({"Espada (Z, X)"})
SkillsTab:AddToggle({
    Name = "Ativar Habilidades de Espada",
    Description = "Usa os ataques da sua lâmina equipada",
    Default = false,
    Callback = function(state) _G.UseSword = state end
})

SkillsTab:AddSection({"Fruta (Z, X, C, V, F)"})
SkillsTab:AddToggle({
    Name = "Ativar Habilidades de Fruta",
    Description = "Usa os poderes da sua fruta atual",
    Default = false,
    Callback = function(state) _G.UseFruit = state end
})

SkillsTab:AddSection({"Armas (Z, X)"})
SkillsTab:AddToggle({
    Name = "Ativar Habilidades de Arma",
    Description = "Dispara os tiros secundários",
    Default = false,
    Callback = function(state) _G.UseGun = state end
})

-- =================================================================
-- ABA 2: AUTO LEVIATHAN (Foco Principal)
-- =================================================================
LeviathanTab:AddSection({"Caça e Combate"})

LeviathanTab:AddToggle({
    Name = "Auto Encontrar Leviatã",
    Description = "Navega e localiza o boss no mar aberto",
    Default = false,
    Callback = function(state) _G.FindLevi = state end
})

LeviathanTab:AddToggle({
    Name = "Auto Destruir Segmentos/Cabeça",
    Description = "Ataca e limpa as partes do Leviatã automaticamente",
    Default = false,
    Callback = function(state) _G.KillLevi = state end
})

LeviathanTab:AddToggle({
    Name = "Ataque Ultra-Rápido (T-Rex/Kitsune)",
    Description = "Derrete a cauda em 2 minutos e a cabeça em 4 minutos",
    Default = false,
    Callback = function(state)
        _G.InstaClick = state
        if state then
            task.spawn(function()
                while _G.InstaClick do
                    task.wait() -- Velocidade máxima permitida pelo motor do jogo
                    local p = game.Players.LocalPlayer
                    if p.Character and p.Character:FindFirstChildOfClass("Tool") then
                        p.Character:FindFirstChildOfClass("Tool"):Activate()
                    end
                end
            end)
        end
    end
})

LeviathanTab:AddSection({"Mecânicas do Barco & Mar"})

LeviathanTab:AddButton({
    Name = "Teleport: Ilha Congelada (NPC Spy)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21000, 20, -15000)
    end
})

LeviathanTab:AddToggle({
    Name = "Invocador de Barco Fantasma",
    Description = "Simula a compra do barco por um player e traz até você",
    Default = false,
    Callback = function(state) _G.FakePlayerBoat = state end
})

LeviathanTab:AddToggle({
    Name = "Auto Lançar Arpão (Puxar Coração)",
    Description = "Prende e puxa o coração do Leviatã na hora",
    Default = false,
    Callback = function(state) _G.AutoHarpoon = state end
})

LeviathanTab:AddToggle({
    Name = "Barco Voador / Super Velocidade",
    Description = "Aumenta a velocidade e faz o barco voar pelo mar",
    Default = false,
    Callback = function(state) _G.FlyBoat = state end
})

-- =================================================================
-- ABA 3: TELEPORTS & TREINO
-- =================================================================
TeleportTab:AddSection({"Locais Importantes"})

TeleportTab:AddButton({
    Name = "Auto ir para Hydra Island",
    Callback = function() --[[ Movimentação CFrame ]] end
})

TeleportTab:AddToggle({
    Name = "Praticar Desvios (Treino Solo)",
    Description = "Ativa pulos e desvios para treinar pulsação sozinho",
    Default = false,
    Callback = function(state) _G.AutoPractice = state end
})

-- =================================================================
-- ABA 4: OTIMIZAÇÃO DO SISTEMA
-- =================================================================
ConfigTab:AddSection({"Performance"})

ConfigTab:AddToggle({
    Name = "FPS Booster (Remover Lag do Mar)",
    Description = "Remove efeitos visuais pesados e texturas da água",
    Default = false,
    Callback = function(state)
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
    end
})
