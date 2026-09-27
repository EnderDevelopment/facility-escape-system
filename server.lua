local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('facilityEscape:getEscapeCount', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchScalar('SELECT escape_count FROM facility_escape WHERE player_id = @player_id', {
            ['@player_id'] = xPlayer.identifier
        }, function(result)
            if result then
                cb(result)
            else
                MySQL.Async.execute('INSERT INTO facility_escape (player_id, escape_count) VALUES (@player_id, 0)', {
                    ['@player_id'] = xPlayer.identifier
                }, function()
                    cb(0)
                end)
            end
        end)
    else
        cb(0)
    end
end)

RegisterNetEvent('facilityEscape:escape')
AddEventHandler('facilityEscape:escape', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.execute('UPDATE facility_escape SET escape_count = escape_count + 1, last_escape = CURRENT_TIMESTAMP WHERE player_id = @player_id', {
            ['@player_id'] = xPlayer.identifier
        }, function()
            MySQL.Async.fetchScalar('SELECT escape_count FROM facility_escape WHERE player_id = @player_id', {
                ['@player_id'] = xPlayer.identifier
            }, function(result)
                if result then
                    TriggerClientEvent('facilityEscape:updateEscapeCount', source, result)
                end
            end)
        end)
    end
end)