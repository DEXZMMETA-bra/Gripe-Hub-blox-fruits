-- [[ GRIPE HUB - RAYFIELD UI EDITION ]] --
-- Interface: Rayfield UI (100% Compatível com Mobile, sem chaves!)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🍇 Gripe Hub | Leviathan Update",
   LoadingTitle = "Carregando Gripe Hub...",
   LoadingSubtitle = "by Developer",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GripeHub_Rayfield",
      FileName = "BloxFruitsConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false -- Removido o sistema de chaves! Abre direto.
})

-- Variáveis Globais de Funcionamento
_G.UseMelee = false; _G.UseSword = false; _G.UseFruit = false; _G.UseGun = false
_G.FindLevi = false; _G.KillLevi = false; _G.InstaClick = false
_G.FakePlayerBoat = false; _G.AutoHarpoon = false; _G.FlyBoat = false
_G.AutoPractice = false; _G.FPSBoost = false

-- =================================================================
-- ABA 1: CONFIGURAÇÃO DE SKILLS
-- =================================================================
local SkillsTab = Window:CreateTab("Config Skills", 4483362458) -- Ícone de espada/config

SkillsTab:CreateSection("Estilo de Luta (Melee) - Z, X, C")
local ToggleMelee = SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Melee",
   CurrentValue = false,
   Flag = "ToggleMelee",
   Callback = function(Value) _G.UseMelee = Value end,
})

SkillsTab:CreateSection("Espada (Sword) - Z, X")
local ToggleSword = SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Espada",
   CurrentValue = false,
   Flag = "ToggleSword",
   Callback = function(Value) _G.UseSword = Value end,
})

SkillsTab:CreateSection("Fruta (Blox Fruit) - Z, X, C, V, F")
local ToggleFruit = SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Fruta",
   CurrentValue = false,
   Flag = "ToggleFruit",
   Callback = function(Value) _G.UseFruit = Value end,
})

SkillsTab:CreateSection("Arma (Gun) - Z, X")
local ToggleGun = SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Arma",
   CurrentValue = false,
   Flag = "ToggleGun",
   Callback = function(Value) _G.UseGun = Value end,
})

-- =================================================================
-- ABA 2: AUTO LEVIATHAN (Foco Principal)
-- =================================================================
local LeviathanTab = Window:CreateTab("Auto Leviathan", 4483362458)

LeviathanTab:CreateSection("Caça e Combate ao Boss")

local ToggleFind = LeviathanTab:CreateToggle({
   Name = "Auto Encontrar Leviatã",
   CurrentValue = false,
   Flag = "ToggleFind",
   Callback = function(Value) _G.FindLevi = Value end,
})

local ToggleKill = LeviathanTab:CreateToggle({
   Name = "Auto Destruir Segmentos e Cabeça",
   CurrentValue = false,
   Flag = "ToggleKill",
   Callback = function(Value) _G.KillLevi = Value end,
})

local ToggleClick = LeviathanTab:CreateToggle({
   Name = "Super Clique Rápido (T-Rex/Kitsune/Dragon)",
   CurrentValue = false,
   Flag = "ToggleClick",
   Callback = function(Value)
      _G.InstaClick = Value
      if Value then
         task.spawn(function()
            while _G.InstaClick do
               task.wait() -- Velocidade máxima para derreter cauda/cabeça
               local p = game.Players.LocalPlayer
               if p.Character and p.Character:FindFirstChildOfClass("Tool") then
                  p.Character:FindFirstChildOfClass("Tool"):Activate()
               end
            end
         end)
      end
   end,
})

LeviathanTab:CreateSection("Controle de Barcos e Mar")

LeviathanTab:CreateButton({
   Name = "Teleport: Ilha Congelada (NPC Spy)",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21000, 20, -15000)
   end,
})

local ToggleFakeBoat = LeviathanTab:CreateToggle({
   Name = "Invocador de Barco Fantasma",
   CurrentValue = false,
   Flag = "ToggleFakeBoat",
   Callback = function(Value) _G.FakePlayerBoat = Value end,
})

local ToggleHarpoon = LeviathanTab:CreateToggle({
   Name = "Auto Lançar Arpão (Puxar Coração)",
   CurrentValue = false,
   Flag = "ToggleHarpoon",
   Callback = function(Value) _G.AutoHarpoon = Value end,
})

local ToggleFlyBoat = LeviathanTab:CreateToggle({
   Name = "Barco Voador / Super Velocidade",
   CurrentValue = false,
   Flag = "ToggleFlyBoat",
   Callback = function(Value) _G.FlyBoat = Value end,
})

-- =================================================================
-- ABA 3: TELEPORTS & TREINO
-- =================================================================
local TeleportTab = Window:CreateTab("Teleports", 4483362458)

TeleportTab:CreateButton({
   Name = "Auto ir para Hydra Island",
   Callback = function() --[[ Movimentação CFrame ]] end,
})

local TogglePractice = TeleportTab:CreateToggle({
   Name = "Praticar Desvios Sozinho (Treinar Pulsação)",
   CurrentValue = false,
   Flag = "TogglePractice",
   Callback = function(Value) _G.AutoPractice = Value end,
})

-- =================================================================
-- ABA 4: CONFIGURAÇÕES DO SISTEMA (FPS)
-- =================================================================
local ConfigTab = Window:CreateTab("Configurações", 4483362458)

local ToggleFPS = ConfigTab:CreateToggle({
   Name = "FPS Booster (Remover Lag do Mar)",
   CurrentValue = false,
   Flag = "ToggleFPS",
   Callback = function(Value)
      _G.FPSBoost = Value
      if Value then
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
   end,
})
