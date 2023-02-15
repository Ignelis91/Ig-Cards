local LytisTurbut = nil

ESX.RegisterServerCallback('ig-cards:buy', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    if money >= 2000 then
        local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        })
        if result[1].sex == 'm' then LytisTurbut = 'Vyras' elseif result[1].sex == 'f' then LytisTurbut = 'Moteris' end
            local desc = "  \nVardas: " .. result[1].firstname .. " " .. result[1].lastname .. "  \nLytis: " .. LytisTurbut  .. "   \nGimimo Metai: " .. result[1].dateofbirth
            xPlayer.removeMoney(2000)
            exports.ox_inventory:AddItem(source, item, 1, {description = desc})
            TriggerClientEvent('esx:showNotification', source, "Sekmingai Nusipirkote")
            cb(playAnim)
    else 
        TriggerClientEvent('esx:showNotification', source, "Jums Nepakanka Pinigu")
    end
end)
