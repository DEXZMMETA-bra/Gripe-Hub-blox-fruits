-- [[ GRIPE HUB - RAYFIELD COM SLIDERS DE COOLDOWN ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🍇 Gripe Hub | Leviathan Pro",
   LoadingTitle = "Injetando Motores de Combate...",
   LoadingSubtitle = "by Developer",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- Serviços Nativos
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

-- Variáveis de Ativação
_G.UseMelee = false; _G.UseSword = false; _G.UseFruit = false; _G.UseGun = false
_G.KillLevi = false; _G.InstaClick = false; _G.FPSBoost = false; _G.FlyBoat = false

-- Variáveis de Cooldown/Hold (Segurar Ataque) vindas dos Sliders
_G.MeleeCooldown = 0.5
_G.SwordCooldown = 0.5
_G.FruitCooldown = 1.0  -- Padrão de 1 segundo (ótimo para Magma)
_G.GunCooldown = 0.5

-- Função Auxiliar para Segurar a Tecla pelo Tempo Determinado
local function pressKey(key, holdTime)
    VirtualInputManager:SendKeyEvent(true, key, false, game) -- Pressiona
    task.wait(holdTime)                                      -- Espera o carregamento (Magma, etc)
    VirtualInputManager:SendKeyEvent(false, key, false, game) -- Solta
end

-- =================================================================
-- LOOP DE COMBATE DINÂMICO (Lê os tempos dos Sliders)
-- =================================================================
task.spawn(function()
    while true do
        task.wait(0.1)
        if _G.KillLevi then
            pcall(function()
                for _, v in pairs(Workspace:GetChildren()) do
                    if v.Name == "Leviathan" or v.Name:match("Leviathan") then
                        local target = v:FindFirstChild("Head") or v:FindFirstChildOfClass("Part")
                        if target then
                            -- Teleporte de Combate seguro
                            LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0, 30, 0)
                            
                            -- COMBO MELEE (Z, X, C)
                            if _G.UseMelee then
                                pressKey(Enum.KeyCode.Z, _G.MeleeCooldown)
                                pressKey(Enum.KeyCode.X, _G.MeleeCooldown)
                                pressKey(Enum.KeyCode.C, _G.MeleeCooldown)
                            end
                            
                            -- COMBO ESPADA (Z, X)
                            if _G.UseSword then
                                pressKey(Enum.KeyCode.Z, _G.SwordCooldown)
                                pressKey(Enum.KeyCode.X, _G.SwordCooldown)
                            end
                            
                            -- COMBO FRUTA (Z, X, C, V, F) - Ideal para carregar Magma
                            if _G.UseFruit then
                                pressKey(Enum.KeyCode.Z, _G.FruitCooldown)
                                pressKey(Enum.KeyCode.X, _G.FruitCooldown)
                                pressKey(Enum.KeyCode.C, _G.FruitCooldown)
                                pressKey(Enum.KeyCode.V, _G.FruitCooldown)
                                pressKey(Enum.KeyCode.F, _G.FruitCooldown)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- =================================================================
-- ABA 1: CONFIGURAÇÃO DE SKILLS (Com Barrinhas de Tempo)
-- =================================================================
local SkillsTab = Window:CreateTab("Config Skills", 4483362458)

-- MELEE
SkillsTab:CreateSection("Estilo de Luta (Melee)")
SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Melee",
   CurrentValue = false,
   Callback = function(Value) _G.UseMelee = Value end,
})
SkillsTab:CreateSlider({
   Name = "Tempo de Ataque (Melee Cooldown)",
   Info = "Tempo segurando cada ataque (Z, X, C)",
   Min = 0.1,
   Max = 5.0,
   CurrentValue = 0.5,
   Increment = 0.1,
   Callback = function(Value) _G.MeleeCooldown = Value end,
})

-- SWORD
SkillsTab:CreateSection("Espada (Sword)")
SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Espada",
   CurrentValue = false,
   Callback = function(Value) _G.UseSword = Value end,
})
SkillsTab:CreateSlider({
   Name = "Tempo de Ataque (Sword Cooldown)",
   Info = "Tempo segurando cada ataque (Z, X)",
   Min = 0.1,
   Max = 5.0,
   CurrentValue = 0.5,
   Increment = 0.1,
   Callback = function(Value) _G.SwordCooldown = Value end,
})

-- FRUIT
SkillsTab:CreateSection("Frutas (Blox Fruit)")
SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Fruta",
   CurrentValue = false,
   Callback = function(Value) _G.UseFruit = Value end,
})
SkillsTab:CreateSlider({
   Name = "Tempo de Carga da Fruta (Magma/Hold Time)",
   Info = "Ajuste para carregar ataques como Magma Z",
   Min = 0.1,
   Max = 5.0,
   CurrentValue = 1.0, -- Começa em 1 segundo conforme seu exemplo
   Increment = 0.1,
   Callback = function(Value) _G.FruitCooldown = Value end,
})

-- =================================================================
-- ABA 2: AUTO LEVIATHAN
-- =================================================================
local LeviathanTab = Window:CreateTab("Auto Leviathan", 4483362458)

LeviathanTab:CreateSection("Combate")
LeviathanTab:CreateToggle({
   Name = "Auto Atacar Leviatã & Segmentos",
   CurrentValue = false,
   Callback = function(Value) _G.KillLevi = Value end,
})

LeviathanTab:CreateToggle({
   Name = "Super Clique Rápido (T-Rex/Kitsune)",
   CurrentValue = false,
   Callback = function(Value)
      _G.InstaClick = Value
      if Value then
         task.spawn(function()
            while _G.InstaClick do
               task.wait()
               pcall(function()
                  local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                  if tool then
                     tool:Activate()
                     VirtualUser:CaptureController()
                     VirtualUser:Button1Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
                  end
               end)
            end
         end)
      end
   end,
})

LeviathanTab:CreateSection("Utilitários do Mar")
LeviathanTab:CreateButton({
   Name = "Teleport: Ilha Congelada (NPC Spy)",
   Callback = function()
      LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21543, 28, -15492)
   end,
})

LeviathanTab:CreateToggle({
   Name = "Barco Voador / Super Velocidade",
   CurrentValue = false,
   Callback = function(Value)
      _G.FlyBoat = Value
      if Value then
         task.spawn(function()
            while _G.FlyBoat do
               task.wait()
               pcall(function()
                  local boat = Workspace.Boats:FindFirstChildOfClass("Model")
                  if boat and boat:FindFirstChild("VehicleSeat") then
                     boat.VehicleSeat.Velocity = Workspace.CurrentCamera.CFrame.LookVector * 150
                  end
               end)
            end
         end)
      end
   end,
})

-- =================================================================
-- ABA 3: CONFIGURAÇÕES E DESEMPENHO
-- =================================================================
local ConfigTab = Window:CreateTab("Configurações", 4483362458)

ConfigTab:CreateToggle({
   Name = "FPS Booster (Destruir Lag da Água)",
   CurrentValue = false,
   Callback = function(Value)
      _G.FPSBoost = Value
      if Value then
         task.spawn(function()
            while _G.FPSBoost do
               task.wait(5)
               pcall(function()
                  for _, v in pairs(Workspace:GetDescendants()) do
                     if v:IsA("Part") or v:IsA("MeshPart") then
                        v.Material = Enum.Material.SmoothPlastic
                     elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Enabled = false
                     end
                  end
                end)
            end
         end)
      end
   end,
})
