-- [[ GRIPE HUB - LÓGICA PURA DO LEVIATHAN ]] --
-- Este script roda em background sendo puxado pela UI Principal

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Função para segurar a tecla pelo tempo do Slider
local function pressKey(key, holdTime)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    task.wait(holdTime)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

-- Cancela o loop antigo se ele já estiver rodando para não duplicar
if _G.LeviLoop then _G.LeviLoop = false task.wait(0.3) end
_G.LeviLoop = true

task.spawn(function()
    while _G.LeviLoop and _G.KillLevi do
        task.wait(0.1)
        pcall(function()
            for _, v in pairs(Workspace:GetChildren()) do
                if v.Name == "Leviathan" or v.Name:match("Leviathan") then
                    local target = v:FindFirstChild("Head") or v:FindFirstChildOfClass("Part")
                    if target then
                        -- Teleporte de Combate seguro acima do Leviatã
                        LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0, 30, 0)
                        
                        -- Executa o combo usando os tempos dos Sliders da UI principal
                        if _G.UseMelee then
                            pressKey(Enum.KeyCode.Z, _G.MeleeCooldown or 0.5)
                            pressKey(Enum.KeyCode.X, _G.MeleeCooldown or 0.5)
                            pressKey(Enum.KeyCode.C, _G.MeleeCooldown or 0.5)
                        end
                        if _G.UseSword then
                            pressKey(Enum.KeyCode.Z, _G.SwordCooldown or 0.5)
                            pressKey(Enum.KeyCode.X, _G.SwordCooldown or 0.5)
                        end
                        if _G.UseFruit then
                            pressKey(Enum.KeyCode.Z, _G.FruitCooldown or 1.0) -- Tempo da Magma
                            pressKey(Enum.KeyCode.X, _G.FruitCooldown or 1.0)
                            pressKey(Enum.KeyCode.C, _G.FruitCooldown or 1.0)
                            pressKey(Enum.KeyCode.V, _G.FruitCooldown or 1.0)
                            pressKey(Enum.KeyCode.F, _G.FruitCooldown or 1.0)
                        end
                    end
                end
            end
        end)
    end
end)
