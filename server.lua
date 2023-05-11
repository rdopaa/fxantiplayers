ESX = exports['es_extended']:getSharedObject()

AddEventHandler("playerConnecting", function (name, kick, defer)
    defer.defer()

    Wait(50)

	if (name:find("<") ~= nil or name:find(">") ~= nil) then
		defer.done("Fuera de aqui created by fxDopa#1648")
		return
	end

    defer.done()
end)

RegisterServerEvent('fx:acdontstop',function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= 'owner' or xPlayer.getGroup() ~= 'superadmin' or xPlayer.getGroup() ~= 'admin' then
        DropPlayer(source, 'Kicked for touching Server Resources')
    end
end)

CreateThread(function()
    while true do
        local source = source
        local xPlayers = ESX.GetPlayers()

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            local money = xPlayer.getMoney()
            local bank = xPlayer.getAccount('bank').money
            local blackMoney = xPlayer.getAccount('black_money').money

            if money or bank or blackMoney >= Config.MoneyCount then
                DropPlayer(source, 'Kicked for having more money than allowed')
            end
        end
        Wait(10*60*1000)
    end
end)
-- If you want to put a log for when the user exceeds the configured amount, add this under each sequence
-- PerformHttpRequest(config.discordWebHookUrl, function(err, text, headers) end, 'POST', json.encode({username = 'MoneySystem', content = ':warning: ' .. GetPlayerName(xPlayer.source) .. ' hat ' .. xPlayer.getAccount('black_money').money .. '$ (DINERO-NEGRO)', avatar_url = 'https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg'}), { ['Content-Type'] = 'application/json' })
