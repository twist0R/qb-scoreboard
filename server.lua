-- made by kurat420
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Code

ESX.RegisterServerCallback('qb-scoreboard:server:GetActiveCops', function(source, cb)
    local retval = 0
    
    for k, v in pairs(ESX.GetPlayers()) do
        local Player = ESX.GetPlayers(v)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        
        if Player ~= nil then
            if xPlayer.job.name == "police" then -- if you want to put police and sheriff just replace for this ->  " if  xPlayer.job.name == "police" or 'sheriff' then "
                retval = retval + 1
            end
        end
    end

    cb(retval)
end)

ESX.RegisterServerCallback('qb-scoreboard:server:GetConfig', function(source, cb)
    cb(Config.IllegalActions)
end)

RegisterServerEvent('qb-scoreboard:server:SetActivityBusy')
AddEventHandler('qb-scoreboard:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('qb-scoreboard:client:SetActivityBusy', -1, activity, bool)
end)
-- made by kurat420