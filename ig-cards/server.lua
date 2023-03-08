local Lytis = nil

ESX.RegisterServerCallback('ig-cards:buy', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    if money >= 2000 then
            if xPlayer.get("sex") == 'm' then Lytis = 'Vyras' elseif xPlayer.get("sex") == 'f' then Lytis = 'Moteris' end
            local desc = "  \nVardas: " .. xPlayer.getName() .. "  \nLytis: " .. Lytis  .. "   \nGimimo Metai: " .. xPlayer.get("dateofbirth")
            xPlayer.removeMoney(2000)
            exports.ox_inventory:AddItem(source, item, 1, {description = desc})
            TriggerClientEvent('esx:showNotification', source, "Sekmingai Nusipirkote")
            cb(true)
    else 
        TriggerClientEvent('esx:showNotification', source, "Jums Nepakanka Pinigu")
    end
end)
