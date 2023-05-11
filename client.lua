ESX = exports['es_extended']:getSharedObject()

AddEventHandler("onClientResourceStop", function(resourceName)
    local _src = source
    CancelEvent()
    TriggerServerEvent('fx:acdontstop', GetPlayerServerId(PlayerId()))
end)

AddEventHandler('onResourceStop', function(resourceName)
    local _src = source
    CancelEvent()
    TriggerServerEvent('fx:acdontstop', GetPlayerServerId(PlayerId()))
end)
