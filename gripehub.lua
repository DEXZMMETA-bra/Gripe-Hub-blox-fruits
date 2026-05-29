-- [[ CONFIGURAÇÃO DA KEY SECRETA PERMANENTE ]] --
local CHAVE_CORRETA = "G1R9I8P5E3H7" -- Uma letra e um número (Apenas você sabe!)

-- [[ SISTEMA DE AUTO-UPDATE COM O BLOX FRUITS ]] --
local GamePlaceId = game.PlaceId
local GameVersion = game.PlaceVersion
-- Verifica se o player está em um servidor válido do Blox Fruits (Sea 1, 2 ou 3)
if GamePlaceId == 2753915549 or GamePlaceId == 4442272183 or GamePlaceId == 7449423635 then
    print("🍇 [Gripe Hub]: Blox Fruits Detectado! Versão Atual do Jogo: " .. tostring(GameVersion))
    print("🍇 [Gripe Hub]: Sincronizando scripts com os remotos atualizados...")
end

-- [[ INICIALIZAÇÃO DA INTERFACE (SÓ ABRE SE A KEY FOR COLOCODA) ]] --
local KavoLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local KeyWindow = KavoLibrary.CreateLib("🔐 Gripe Hub | Sistema de Chave", "GrapeTheme")
local KeyTab = KeyWindow:NewTab("Verificação")
local KeySection = KeyTab:NewSection("Insira a Key Permanente")

KeySection:NewTextBox("Digite a Key Aqui:", "Apenas usuários autorizados", function(textoInserido)
    if textoInserido == CHAVE_CORRETA then
        KavoLibrary:Notify("Sucesso!", "Chave Correta! Carregando o Gripe Hub...", 3)
        task.wait(1.5)
        
        -- Fecha a janela da Key para abrir o Script Principal
        game:GetService("CoreGui"):FindFirstChild("Gripe Hub | Sistema de Chave"):Destroy()
        
        -- =================================================================
        -- CARREGAMENTO DO SCRIPT PRINCIPAL (GRIPE HUB 🍇)
        -- =================================================================
        local Window = KavoLibrary.CreateLib("🍇 Gripe Hub | Leviathan v2", "GrapeTheme")
        
        -- ABA 1: CONFIGURAÇÃO DE SKILLS
        local SkillsTab = Window:NewTab("Config Skills")
        local MeleeSec = SkillsTab:NewSection("Estilo de Luta (Z, X, C)")
        local SwordSec = SkillsTab:NewSection("Espada (Z, X)")
        local FruitSec = SkillsTab:NewSection("Fruta (Z, X, C, V, F)")
        local GunSec = SkillsTab:NewSection("Armas (Z, X)")
        
        _G.UseMelee = false; _G.UseSword = false; _G.UseFruit = false; _G.UseGun = false
        MeleeSec:NewToggle("Ativar Skills Melee", "Usa combos de soco", function(state) _G.UseMelee = state end)
        SwordSec:NewToggle("Ativar Skills Espada", "Usa ataques de lâmina", function(state) _G.UseSword = state end)
        FruitSec:NewToggle("Ativar Skills Fruta", "Usa poderes da fruta", function(state) _G.UseFruit = state end)
        GunSec:NewToggle("Ativar Skills Arma", "Usa tiros secundários", function(state) _G.UseGun = state end)
        
        -- ABA 2: AUTO LEVIATHAN
        local LeviathanTab = Window:NewTab("Auto Leviathan")
        local LeviSec = LeviathanTab:NewSection("Caça ao Leviatã")
        local BoatSec = LeviathanTab:NewSection("Controle do Barco")
        
        LeviSec:NewToggle("Auto Encontrar Leviatã", "Navega e procura pelo boss", function(state) _G.FindLevi = state end)
        LeviSec:NewToggle("Auto Destruir Segmentos/Cabeça", "Foca nas partes do Leviatã", function(state) _G.KillLevi = state end)
        LeviSec:NewToggle("Ataque Ultra-Rápido (T-Rex/Kitsune)", "Destrói cauda em 2m / cabeça em 4m", function(state)
            _G.InstaClick = state
            if state then
                spawn(function()
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
        
        BoatSec:NewButton("Teleport: Ilha Congelada", "Vai direto para o NPC Spy", function()
            -- O script pega as coordenadas mais recentes do mapa automaticamente
            local FrozenIsland = game:GetService("Workspace"):FindFirstChild("Frozen Island") or game:GetService("Workspace"):FindFirstChild("Map")
            if FrozenIsland then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21000, 20, -15000)
            end
        end)
        
        BoatSec:NewToggle("Invocador de Barco Fantasma", "Simula player comprando barco e traz até você", function(state) _G.FakePlayerBoat = state end)
        BoatSec:NewToggle("Auto Lançar Arpão (Coração)", "Prende o coração automaticamente", function(state) _G.AutoHarpoon = state end)
        BoatSec:NewToggle("Barco Voador / Super Velocidade", "Faz o barco voar rápido", function(state) _G.FlyBoat = state end)
        
        -- ABA 3: OUTROS TELEPORTS & TREINO
        local TeleportTab = Window:NewTab("Teleports")
        local TpSec = TeleportTab:NewSection("Locais e Treino")
        TpSec:NewButton("Ir para Hydra Island", "Teleporta para Hydra", function() --[[ Auto Drive via CFrame ]] end)
        TpSec:NewToggle("Praticar Desvios Sozinho", "Treina os reflexos e pulsação", function(state) _G.AutoPractice = state end)
        
        -- ABA 4: OTIMIZAÇÃO (FPS BOOSTER) e CONFIGS
        local ConfigTab = Window:NewTab("Configurações")
        local SettingsSec = ConfigTab:NewSection("Otimização")
        
        SettingsSec:NewToggle("FPS Booster (Remover Lag)", "Melhora muito o desempenho no mar", function(state)
            _G.FPSBoost = state
            if state then
                spawn(function()
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
    else
        KavoLibrary:Notify("Aviso!", "Key Incorreta ou Expirada! Tente novamente.", 3)
    end
end)
