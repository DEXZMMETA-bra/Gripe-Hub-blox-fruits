-- [[ GRIPE HUB - LÓGICA PURA DAS SKILLS ]] --
-- Este script roda em background controlando os botões de Melee, Espada e Fruta

local VirtualInputManager = game:GetService("VirtualInputManager")

-- Função para segurar a tecla pelo tempo do Slider
local function pressKey(key, holdTime)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    task.wait(holdTime)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

-- Cancela o loop antigo se ele já estiver rodando para não dar double-click
if _G.SkillsLoop then _G.SkillsLoop = false task.wait(0.3) end
_G.SkillsLoop = true

task.spawn(function()
    while _G.SkillsLoop do
        task.wait(0.1)
        pcall(function()
            -- Só ataca se o personagem estiver vivo
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                
                -- EXECUTA MELEE SE ATIVADO NA UI
                if _G.UseMelee then
                    pressKey(Enum.KeyCode.Z, _G.MeleeCooldown or 0.5)
                    pressKey(Enum.KeyCode.X, _G.MeleeCooldown or 0.5)
                    pressKey(Enum.KeyCode.C, _G.MeleeCooldown or 0.5)
                end
                
                -- EXECUTA ESPADA SE ATIVADO NA UI
                if _G.UseSword then
                    pressKey(Enum.KeyCode.Z, _G.SwordCooldown or 0.5)
                    pressKey(Enum.KeyCode.X, _G.SwordCooldown or 0.5)
                end
                
                -- EXECUTA FRUTA SE ATIVADO NA UI (Ideal para Magma)
                if _G.UseFruit then
                    pressKey(Enum.KeyCode.Z, _G.FruitCooldown or 1.0)
                    pressKey(Enum.KeyCode.X, _G.FruitCooldown or 1.0)
                    pressKey(Enum.KeyCode.C, _G.FruitCooldown or 1.0)
                    pressKey(Enum.KeyCode.V, _G.FruitCooldown or 1.0)
                    pressKey(Enum.KeyCode.F, _G.FruitCooldown or 1.0)
                end
                
            end
        end)
    end
end)
