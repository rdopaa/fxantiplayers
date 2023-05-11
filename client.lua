ESX = exports['es_extended']:getSharedObject()

--- ANTI ENSURE, STOP AND START ---
AddEventHandler("onClientResourceStop", function(resourceName)
    TriggerServerEvent('fx:acdontstop')
end)

AddEventHandler('onResourceStop', function(resourceName)
    TriggerServerEvent('fx:acdontstop')
end)


-- CONFIG GENERAL ANTI PLAYERS -- | INFINITE AMMO - GODMODE - DAMAGE - ANTI-EXPLOSIONS |
CreateThread(function()
    while true do 
        Wait(300 * 1000) -- Verificar cada 5 minutos
        local source = source
        local PlayerPed = PlayerPedId()
        if Config.GeneralAntiPlayers then 
            if DoesEntityExist(PlayerPed) then
                Wait(50)
                -- ANTI INFINITE AMMO
                SetPedInfiniteAmmoClip(PlayerPed, false)
                -- ANTI GOD-MODE 
                SetPlayerInvincible(PlayerPed, false)
                SetEntityInvincible(PlayerPed, false)
                -- ANTI DAMAGE
                SetEntityCanBeDamaged(PlayerPed, true)
                ResetEntityAlpha(PlayerPed)
                -- ANTI EXPLOSIONS
                N_0x4757f00bc6323cfe(GetHashKey("WEAPON_EXPLOSION"), 0.0) 
                SetEntityProofs(PlayerPed, false, true, true, false, false, false, 1, false)    
            end
        end 
    end 
end)
