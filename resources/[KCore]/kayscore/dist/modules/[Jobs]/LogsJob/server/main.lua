LogsJobFunc = {}


LogsJobFunc.SendLogsService = function(job, message, typee)

    local link = LogsJob.service[job][typee]
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Logs",
            ["description"] = message,
            ["footer"] = {
                ["text"] = date
            }
        }
    }

    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })

end



LogsJobFunc.SendLogsRadar = function(message, typee)

    local link = LogsJob.police['radar'][typee]
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Logs",
            ["description"] = message,
            ["footer"] = {
                ["text"] = date
            }
        }
    }

    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })

end

LogsJobFunc.SendLogsArmurie = function(armu, message, typee)

    local link = LogsJob.police[armu][typee]
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Logs",
            ["description"] = message,
            ["footer"] = {
                ["text"] = date
            }
        }
    }

    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })

end


----- logs joueurs 


local logsPlayer = {
    ['give'] = '',
    ['give-money'] = '',
    ['sortie-veh'] = '',
    ['ranger-veh'] = '',
    ['paybill'] = '',
    ['dead'] = '',
    ['dead'] = '',
}




------------
local logsACJob = {
    ['money'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['weapon'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['blanchi'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['revive'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['give'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['repaircar'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['customcar'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['bill'] = 'https:webhooks/1231523154703417356/5rXNceCLUdNjXBV5RUa9E-PPYdW9kNgkdtlCgTN31ltKdF4OBEQjbmaQEHmjz31lcFJq',
    ['revive'] = 'https:webhooks/1240611009429901407/f37-0cUuL4xRi8ljttkxTJ_E_mAhEqHZLwsvGyYYWhZV-v-xc8hgDcCgJRpgtzRnAWcm',
}

function logsACJob.SendLogsACJob(type, message)
    local link = logsACJob[type]
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Logs",
            ["description"] = message,
            ["footer"] = {
                ["text"] = date
            }
        }
    }

    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end