ESX = exports['es_extended']:getSharedObject()

AddEventHandler("playerConnecting", function (name, kick, defer)
    defer.defer()

    Citizen.Wait(50)

	if (name:find("<") ~= nil or name:find(">") ~= nil) then
		defer.done("Fuera de aqui created by fxDopa#1648")
		return
	end

    defer.done()
end)

RegisterNetEvent('fx:acdontstop')
AddEventHandler('fx:acdontstop',function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= 'owner' or xPlayer.getGroup() ~= 'superadmin' or xPlayer.getGroup() ~= 'admin' then
        DropPlayer(source, 'Kicked for touching Server Resources')
    end
end)