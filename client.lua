local ESX = nil
local isInFacility = false
local speedBoostActive = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, facility in ipairs(Config.FacilityCoords) do
            local distance = #(vector3(facility.x, facility.y, facility.z) - playerCoords)

            if distance < Config.ESPDistance then
                isInFacility = true
                break
            else
                isInFacility = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isInFacility then
            if not speedBoostActive then
                speedBoostActive = true
                SetRunSprintMultiplierForPlayer(PlayerId(), Config.SpeedBoost)
                PlaySoundFrontend(-1, Config.SoundEffect, 'HUD_AWARDS', true)
                SetTimeout(Config.SpeedBoostDuration, function()
                    speedBoostActive = false
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                end)
            end

            -- Draw ESP markers
            for _, facility in ipairs(Config.FacilityCoords) do
                DrawMarker(1, facility.x, facility.y, facility.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.ESPColor.r, Config.ESPColor.g, Config.ESPColor.b, Config.ESPColor.a, false, true, 2, nil, nil, false)
            end
        end
    end
end)

RegisterNetEvent('facilityEscape:updateEscapeCount')
AddEventHandler('facilityEscape:updateEscapeCount', function(count)
    ESX.ShowNotification('You have escaped the facility ' .. count .. ' times!')
end)