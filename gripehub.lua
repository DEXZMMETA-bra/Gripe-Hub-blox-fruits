-- [[ GRIPE HUB - INTERFACE PRINCIPAL MODULAR ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🍇 Gripe Hub | Leviathan Pro",
   LoadingTitle = "Injetando Interface Rayfield...",
   LoadingSubtitle = "by Developer",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- Variáveis Globais de Configuração
_G.UseMelee = false; _G.UseSword = false; _G.UseFruit = false
_G.KillLevi = false; _G.InstaClick = false; _G.FPSBoost = false; _G.FlyBoat = false

_G.MeleeCooldown = 0.5
_G.SwordCooldown = 0.5
_G.FruitCooldown = 1.0

-- Função interna para gerenciar o carregamento do script de Skills
local function atualizarSkills()
    if _G.UseMelee or _G.UseSword or _G.UseFruit then
        -- Se alguma skill estiver ligada, puxa a lógica externa do GitHub
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DEXZMMETA-bra/Gripe-Hub-blox-fruits/refs/heads/main/skills_logica.lua"))()
    else
        -- Se tudo for desligado, para o script de background
        _G.SkillsLoop = false
    end
end

-- =================================================================
-- ABA 1: CONFIGURAÇÃO DE SKILLS (PUXA EXTERNO)
-- =================================================================
local SkillsTab = Window:CreateTab("Config Skills", 4483362458)

SkillsTab:CreateSection("Estilo de Luta (Melee)")
SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Melee",
   CurrentValue = false,
   Callback = function(Value) 
      _G.UseMelee = Value 
      atualizarSkills()
   end,
})
SkillsTab:CreateSlider({
   Name = "Tempo de Ataque (Melee Cooldown)",
   Min = 0.1, Max = 5.0, CurrentValue = 0.5, Increment = 0.1,
   Callback = function(Value) _G.MeleeCooldown = Value end,
})

SkillsTab:CreateSection("Frutas (Blox Fruit)")
SkillsTab:CreateToggle({
   Name = "Ativar Habilidades de Fruta",
   CurrentValue = false,
   Callback = function(Value) 
      _G.UseFruit = Value 
      atualizarSkills()
   end,
})
SkillsTab:CreateSlider({
   Name = "Tempo de Carga da Fruta (Magma Hold)",
   Min = 0.1, Max = 5.0, CurrentValue = 1.0, Increment = 0.1,
   Callback = function(Value) _G.FruitCooldown = Value end,
})

-- =================================================================
-- ABA 2: AUTO LEVIATHAN (PUXA EXTERNO)
-- =================================================================
local LeviathanTab = Window:CreateTab("Auto Leviathan", 4483362458)

LeviathanTab:CreateToggle({
   Name = "Auto Atacar Leviatã & Segmentos",
   CurrentValue = false,
   Callback = function(Value) 
      _G.KillLevi = Value 
      if Value then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/DEXZMMETA-bra/Gripe-Hub-blox-fruits/refs/heads/main/levi_logica.lua"))()
      else
         _G.LeviLoop = false
      end
   end,
})

LeviathanTab:CreateButton({
   Name = "Teleport: Ilha Congelada (NPC Spy)",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21543, 28, -15492)
   end,
})
