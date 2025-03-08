while isload == nil do
    Wait(1)
end

local RESOURCE_NAME <const> = GetCurrentResourceName()
local CURRENT_VERSION <const> = GetResourceMetadata(RESOURCE_NAME, 'version', 0)

local IsLastVersion = true
local findCore = false
local LAST_VERSION = "v11"
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= RESOURCE_NAME then
      return
    end

    if LAST_VERSION ~= CURRENT_VERSION then
        IsLastVersion = false
    end
  end)

if RESOURCE_NAME == "kayscore" then
    findCore = true
end

if not findCore then
    Wait(1000)
    Citizen.CreateThread(function()
        print("")
        print("")
        print("")
        print("")
        print("")
        print("^1         ______ _____  _____   ____  _____       ")
        print("^1        |  ____|  __ \\|  __ \\ / __ \\|  __ \\      ")
        print("^1        | |__  | |__) | |__) | |  | | |__) |     ")
        print("^1        |  __| |  _  /|  _  /| |  | |  _  /      ")
        print("^1        | |____| | \\ \\| | \\ \\| |__| | | \\ \\      ")
        print("^1        |______|_|  \\_\\_|  \\_\\\\____/|_|  \\_\\     ")
        print("")
        print("^7        Vous avez changer le nom de la ressource ^2kayscore^7 en ^1"..RESOURCE_NAME)
        print("")
        print("")
    end)
    Wait(1000)
    while true do
        print("/!\\ Merci de changer le nom de la ressource "..RESOURCE_NAME.." -> kayscore")
        Wait(500)
    end
end

Citizen.CreateThread(function()
    Wait(1000)
    if isload then
        Wait(10000)
        print("")
        print("      __   __                 _                _      ")
        print("     |  \\/  |               | |              | |     ")
        print("     | \\  / | ___  _ __ ___ | |__   __ _  ___| | __  ")
        print("     | |\\/| |/ _ \\| '__/ _ \\| '_ \\ / _` |/ __| |/ /  ")
        print("     | |  | | (_) | | | (_) | |_) | (_| | (__|   < _ ")
        print("     |_|  |_|\\___/|_|  \\___/|_.__/ \\__,_|\\___|_|\\_(_)")
        print("")
        print("") 
        print("     [^1SERVER INFO^7] Nom de votre serveur : ^2Kays ^7")
        print("     [^1SERVER INFO^7] Lien du serveur discord : ^2.gg/kays ^7")
        print("     [^1SERVER INFO^7] Developer : ^2kays ^7")
        print("")
        print("")
    else        
        print("")
        print("")
        print("")
        print("")
        print("")
        print("^1         ______ _____  _____   ____  _____       ")
        print("^1        |  ____|  __ \\|  __ \\ / __ \\|  __ \\      ")
        print("^1        | |__  | |__) | |__) | |  | | |__) |     ")
        print("^1        |  __| |  _  /|  _  /| |  | |  _  /      ")
        print("^1        | |____| | \\ \\| | \\ \\| |__| | | \\ \\      ")
        print("^1        |______|_|  \\_\\_|  \\_\\\\____/|_|  \\_\\     ")
        print("")
        print("^7        Nous avons détecter une erreur dans votre configuration.^7")
        print("")
        print("")
        print("")
        print("")
        print("")
    end
end)
