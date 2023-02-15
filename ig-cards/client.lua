local centerCoords = {
    vec(-66.0010, 6466.3389, 31.3914, 141.5767)
}

function createBlip(coords, name, sprite, color, scale)
	local blip = AddBlipForCoord(coords.xyz)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('<font face=\'Roboto\'>'..name)
    EndTextCommandSetBlipName(blip)
end

function createPed(coords)
    lib.points.new(coords.xyz, 30.0, {
        onEnter = function(self)
            if not self.npc then
                ESX.Streaming.RequestModel(`a_m_y_business_03`)
                local npc = CreatePed(1, `a_m_y_business_03`, coords, false, true)
                FreezeEntityPosition(npc, true)
                SetEntityInvincible(npc, true)
                SetBlockingOfNonTemporaryEvents(npc, true)
                SetModelAsNoLongerNeeded(`a_m_y_business_03`)
                self.npc = npc
                createTarget(npc)
            end
        end,
        onExit = function(self)
            if self.npc then
				DeleteEntity(self.npc)
				self.npc = nil
			end
        end
    })
end

function createTarget(ped)
    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'ig-cards:identification',
            icon = 'fa-solid fa-id-card',
            label = 'Pasigaminti ID kortelę',
            distance = 2.0,
            onSelect = function(data)
                ESX.TriggerServerCallback('ig-cards:buy', function(playAnim)
                    if playAnim then
                        ESX.Streaming.RequestAnimDict('friends@laf@ig_5')
                        ESX.Streaming.RequestAnimDict('gestures@f@standing@casual')

                        TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        TaskPlayAnim(data.entity, 'gestures@f@standing@casual', 'gesture_hand_down', 2.0, 2.0, 3000, 16, 0.0, false, false, false)

                        RemoveAnimDict('friends@laf@ig_5')
                        RemoveAnimDict('gestures@f@standing@casual')
                    end
                end, 'identification')
            end
        },
        {
            name = 'ig-cards:drive_license',
            icon = 'fa-solid fa-id-badge',
            label = 'Pasigaminti vairuotojo pažymėjimą',
            distance = 2.0,
            onSelect = function(data)
                ESX.TriggerServerCallback('ig-cards:buy', function(playAnim)
                    if playAnim then
                        ESX.Streaming.RequestAnimDict('friends@laf@ig_5')
                        ESX.Streaming.RequestAnimDict('gestures@f@standing@casual')

                        TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        TaskPlayAnim(data.entity, 'gestures@f@standing@casual', 'gesture_hand_down', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        
                        RemoveAnimDict('friends@laf@ig_5')
                        RemoveAnimDict('gestures@f@standing@casual')
                    end
                end, 'drive_license')
            end
        },
        {
            name = 'ig-cards:weapon_license',
            icon = 'fa-solid fa-gun',
            label = 'Pasigaminti ginklų licenziją',
            distance = 2.0,
            onSelect = function(data)
                ESX.TriggerServerCallback('ig-cards:buy', function(playAnim)
                    if playAnim then
                        ESX.Streaming.RequestAnimDict('friends@laf@ig_5')
                        ESX.Streaming.RequestAnimDict('gestures@f@standing@casual')

                        TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        TaskPlayAnim(data.entity, 'gestures@f@standing@casual', 'gesture_hand_down', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        
                        RemoveAnimDict('friends@laf@ig_5')
                        RemoveAnimDict('gestures@f@standing@casual')
                    end
                end, 'weapons_license')
            end
        },
        {
            name = 'ig-cards:medical_license',
            icon = 'fa-solid fa-notes-medical',
            label = 'Pasigaminti medikų patikros dokumentus',
            distance = 2.0,
            onSelect = function(data)
                ESX.TriggerServerCallback('ig-cards:buy', function(playAnim)
                    if playAnim then
                        ESX.Streaming.RequestAnimDict('friends@laf@ig_5')
                        ESX.Streaming.RequestAnimDict('gestures@f@standing@casual')

                        TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        TaskPlayAnim(data.entity, 'gestures@f@standing@casual', 'gesture_hand_down', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        
                        RemoveAnimDict('friends@laf@ig_5')
                        RemoveAnimDict('gestures@f@standing@casual')
                    end
                end, 'medical_license')
            end
        },
        {
            name = 'ig-cards:hunting_license',
            icon = 'fa-solid fa-person-rifle',
            label = 'Pasigaminti medžioklės licenziją',
            distance = 2.0,
            onSelect = function(data)
                ESX.TriggerServerCallback('ig-cards:buy', function(playAnim)
                    if playAnim then
                        ESX.Streaming.RequestAnimDict('friends@laf@ig_5')
                        ESX.Streaming.RequestAnimDict('gestures@f@standing@casual')

                        TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        TaskPlayAnim(data.entity, 'gestures@f@standing@casual', 'gesture_hand_down', 2.0, 2.0, 3000, 16, 0.0, false, false, false)
                        
                        RemoveAnimDict('friends@laf@ig_5')
                        RemoveAnimDict('gestures@f@standing@casual')
                    end
                end, 'hunting_license')
            end
        },
    })
end

for i = 1, #centerCoords do
    local coords = centerCoords[i]
    createBlip(coords, 'Dokumentų centras', 525, 0, 0.5)
    createPed(coords)
end

exports('identification', function(data, slot) showIdentity(data, slot, 'Tapatybės kortelė') end)
exports('drive_license', function(data, slot) showIdentity(data, slot, 'Vairavimo licenzija') end)
exports('weapons_license', function(data, slot) showIdentity(data, slot, 'Ginklų licenzija') end)
exports('medical_license', function(data, slot) showIdentity(data, slot, 'Medikų patikros dokumentas') end)
exports('hunting_license', function(data, slot) showIdentity(data, slot, 'Medžioklės licenzija') end)

function showIdentity(data, slot, name)
    --[[
    local ped = PlayerPedId()
    local prop = CreateObject(`prop_fib_badge`, GetEntityCoords(ped) + vec(0.0, 0.0, 0.2), true, true, true)

    ESX.Streaming.RequestAnimDict('paper_1_rcm_alt1-9')
    TaskPlayAnim(ped, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 3.0, 3.0, -1, 50, 0, false, false, false)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 28422), 0.12, 0.01, -0.06, -310.0, 10.0, 150.0, true, true, false, true, 1, true)
    TriggerServerEvent('ig-cards:show', name)

    SetTimeout(3200, function()
        DeleteEntity(prop)
        ClearPedTasks(ped)
    end)
    ]]
end


print("Nigerio Kiaušiai")