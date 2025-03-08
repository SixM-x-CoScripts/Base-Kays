function GetIdentifier(source)
    if (Boutique.Framework == "esx" or Boutique.Framework == "newEsx") then
        if ESX ~= nil then
            local player = ESX.GetPlayerFromId(source)
            if player ~= nil then
                return player.identifier
            else
                print("Error: Player is undefined")
            end
        else
            print("Error: ESX is undefined")
        end
    else
        -- IF USE STANDALONE FRAMEWORK, CHANGE IT, DEFAULT LICENSE

        local identifier

        for _, v in pairs(GetPlayerIdentifiers(source)) do
            if string.find(v, "license") then
                identifier = v
                break
            end
        end

        return identifier
    end
end

function GetPlayerFromIdentifier(identifier)
    if (Boutique.Framework == "esx" or Boutique.Framework == "newEsx") then
        return ESX.GetPlayerFromIdentifier(identifier).source
    else
        -- IF USE STANDALONE FRAMEWORK, CHANGE IT
        return -- PLAYER SOURCE
    end
end

function GiveItem(_source, name)
    print('serveur')
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            print("Erreur: xPlayer est nil")
            return
        end
        print(name)
        print('Avant Fonction')
        xPlayer.addInventoryItem(string.lower(name), 1)
        print('Après Fonction')
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
    end
end

function GiveWeapon(_source, name)
    print(name)
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            print("Erreur: xPlayer est nil")
            return
        end 
        if Boutique.ArmeItem == false then 
            print('ici')
            print(name)
            xPlayer.addWeapon(name, 1)
        else
            print('ici')
            print(name)
            xPlayer.addWeapon(name, 1)
        end
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
    end
end

function GiveMoney(_source, count)
    if Boutique.Framework == "esx" or Boutique.Framework == "newEsx" then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer == nil then
            return
        end
        if Boutique.addAccountMoney == false then 
            xPlayer.addMoney(count)
        else
            xPlayer.addAccountMoney(Boutique.AccountName, count)
        end
    else
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework
        -- Your code for QB or Standalone framework     
    end
end
local vehicles = {
    -- Véhicules Achat Direct
    [GetHashKey("suranoe")] = "Suranoe",
    [GetHashKey("superd3")] = "Super D3",
    [GetHashKey("raidenz")] = "Raiden Z",
    [GetHashKey("deluxowb")] = "Deluxo WB",
    [GetHashKey("caracara6x6")] = "Caracara 6x6",
    [GetHashKey("relaxer")] = "Relaxer",
    [GetHashKey("h4rxgranut")] = "Granut H4",
    [GetHashKey("roadrunnerciv")] = "Runner CIV",
    [GetHashKey("scheisser")] = "Scheisser",
    [GetHashKey("dom645")] = "Dom 645",
    [GetHashKey("espexecutive")] = "ESP Executive",
    [GetHashKey("mule5")] = "Mule",

    -- Caisse Diamond
    [GetHashKey("velum")] = "Velum",
    [GetHashKey("thraxd")] = "Thrax D",
    [GetHashKey("SSG_BallerSTD")] = "Baller STD",
    [GetHashKey("dubstag")] = "Dubsta G",
    [GetHashKey("tfdominator")] = "Dominator TF",
    [GetHashKey("jd_oraclev12")] = "Orac",
    [GetHashKey("odyssey")] = "Odyssey",
    [GetHashKey("ajwar")] = "AJ WAR",
    
    -- Caisse Ruby
    [GetHashKey("luxor")] = "Luxor",
    [GetHashKey("comet6scw")] = "Comet SCW",
    [GetHashKey("buzzard2")] = "Buzzard",
    [GetHashKey("mesaxl")] = "Mesa XL",
    [GetHashKey("astronc")] = "Astron C",
    [GetHashKey("manchezbw")] = "Manchez BW",

    -- Caisse Prestige
    [GetHashKey("tempestaes")] = "Tempesta ES",
    [GetHashKey("supervolito2")] = "Supervolito",
    [GetHashKey("mantis")] = "Mantis",
    [GetHashKey("hoonie")] = "Hoonie",
    [GetHashKey("issi8s")] = "Issi 8S",
    [GetHashKey("shinobiold")] = "Shino",

    -- Caisse Élite
    [GetHashKey("toreroxoc")] = "toreroxoc",
    [GetHashKey("jugularest")] = "Jugurest",
    [GetHashKey("nriata")] = "Riata N",
    [GetHashKey("dominator9s")] = "Dominator 9S",
    [GetHashKey("peacemaker")] = "Peacemaker",

    -- [GetHashKey("vetog")] = "Mini Gauntlet",
    -- [GetHashKey("babycar")] = "Mini Voiture Bébé",
    -- [GetHashKey("puipui")] = "Mini Puipui",
    -- [GetHashKey("chiron17")] = "Bugatti Chiron",
    -- [GetHashKey("rs7c821")] = "Audi RS7",
    -- [GetHashKey("tmaxDX")] = "T-Max",
    -- [GetHashKey("bentaygast")] = "Bentley Bentayga",
    -- [GetHashKey("rmode63s")] = "Brabus E63S",
    -- [GetHashKey("22m5")] = "BMW M5 CS",
    -- [GetHashKey("mansaug992")] = "Porsche Mansaug 992",
    -- [GetHashKey("gtr")] = "Nissan GT-R",
    -- [GetHashKey("mule5")] = "Mule",
    -- [GetHashKey("r820")] = "Audi R8 2020",
    -- [GetHashKey("gxa45")] = "Mercedes A45 AMG",
    -- [GetHashKey("18velar")] = "Range Rover Velar",
    -- [GetHashKey("mansoryveyron")] = "Bugatti Veyron Mansory",
    -- [GetHashKey("19raptor")] = "Ford Raptor 2019",
    -- [GetHashKey("royalcustommustang24police")] = "Royal Mustang Police",
    -- [GetHashKey("merk")] = "Mercedes CLE",
    -- [GetHashKey("fsf90xx")] = "SF90xx Stradale",
    -- [GetHashKey("hevo")] = "Huracan Evo Spyder",
    -- [GetHashKey("tecnomar63")] = "Tecnomar 63",
    -- [GetHashKey("rev")] = "Revuelto",
    -- [GetHashKey("720s")] = "Mclaren 720s",
    -- [GetHashKey("wraithb")] = "Rolls-Royce Wraith",
    -- [GetHashKey("16m3f80")] = "BMW M3 F80",
    -- [GetHashKey("amggt63s")] = "Mercedes‑AMG GT63S",
    -- [GetHashKey("722s")] = "SLR 722s Mansory",
    -- [GetHashKey("a45amg")] = "A45 AMG",
    -- [GetHashKey("nh2r")] = "Ninja H2R",
    -- [GetHashKey("21camaro")] = "Chevrolet Camaro",
    -- [GetHashKey("nbfp17")] = "Jaguar F-Pace S",
    -- [GetHashKey("sjtoyota")] = "Toyota LC200",
    -- [GetHashKey("a11017")] = "Alpine A110",
    -- [GetHashKey("texviper")] = "Dodge Viper",
    -- [GetHashKey("minijcwgp20")] = "John Cooper Works",
    -- [GetHashKey("jeeprenegade")] = "Jeep CJ5 Renegade",
    -- [GetHashKey("s55amg")] = "Mercedes-Benz S55 AMG",
    -- [GetHashKey("fd3s")] = "Mazda RX7 Spirit R",
    -- [GetHashKey("ae86")] = "Toyota Sprinter GT",
    -- [GetHashKey("x5e53")] = "BMW X5 E53",
    -- [GetHashKey("eldorado59")] = "Cadillac Eldorado",
    -- [GetHashKey("ami")] = "Citroen AMI",
    -- [GetHashKey("impala59c")] = "Chevrolet Impala",
    -- [GetHashKey("gouvcadillac")] = "Gouvernement Cadillac",
    -- [GetHashKey("gouvcharger")] = "Gouvernement Charger",
    -- [GetHashKey("gouvexp")] = "Gouvernement XP",
    -- [GetHashKey("gouvpressuv")] = "Gouvernement Presidentiel Suv",
    -- [GetHashKey("amboems")] = "Ambulance EMS",
    -- [GetHashKey("GiratiEms")] = "Maserati EMS",
    -- [GetHashKey("RaviertEms")] = "Range EMS",
    -- [GetHashKey("22g63")] = "G63 Police",
    -- [GetHashKey("22m5sal")] = "M5 Police",
    -- [GetHashKey("ACTRPavant")] = "RS6 Police",
    -- [GetHashKey("ACTRPavantum")] = "RS6 Banalisé Police",
    -- [GetHashKey("polbike")] = "Vélo Police",
    -- [GetHashKey("polbmwm7")] = "M7 Police",
    -- [GetHashKey("polcharger18")] = "Dodge Charger Police",
    -- [GetHashKey("polcoach")] = "Bus Police",
    -- [GetHashKey("polcross")] = "Moto Cross Police",
    -- [GetHashKey("poldurango")] = "Tahoe Police",
    -- [GetHashKey("polmustang")] = "Mustang Police",
    -- [GetHashKey("polsilverado19")] = "Pick up Police",
    -- [GetHashKey("sw_bearcat")] = "Bear Cat Swat",
    -- [GetHashKey("sw_sprinter")] = "Sprinter Police",
    -- [GetHashKey("sw_subrb")] = "SUV Police",
    -- [GetHashKey("trhawk")] = "Banalisé",
    -- [GetHashKey("unmarkedjl")] = "Dodge Banalisé",
    -- [GetHashKey("polheli")] = "Hélico Police",
    -- [GetHashKey("buffalo4")] = "Buffalo STX",
}

function GiveVehicle(_source, citizenId, plate, vehicleData)

    local xPlayer = ESX.GetPlayerFromId(_source)

    if not xPlayer then
        return
    end

    local UniqueID = xPlayer.UniqueID
    local label = vehicles[vehicleData.model]

    if not UniqueID then
        return
    end

    if label == "Buzzard" or label == "Cargobob" or label == "Velum" or label == "Hélico Police" then
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 2, 1, 'aircraft')")
    elseif label == "Tecnomar 63" then
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 3, 1, 'boat')")
    else
        local label = vehicles[vehicleData.model]
        ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, label, garageid, boutique, type) VALUES ('" .. UniqueID .. "', '" .. plate .. "', '" .. json.encode(vehicleData) .. "', '"..label.."', 1, 1, 'car')")
    end
end




-- function GiveVehicle(_source, plate, vehicleData)
--     local garageID = 1
--     local boutique = 1

--     local xPlayer = ESX.GetPlayerFromId(_source)

--     if not xPlayer then
--         print("Erreur : xPlayer est nil lors de l'appel à GiveVehicle pour la source " .. tostring(_source))
--         return
--     end

--     local UniqueID = xPlayer.UniqueID
--     local garageId = 1
--     local boutique = 1

--     if not UniqueID then
--         print("Erreur : UniqueID est nil pour la source " .. tostring(_source))
--         return
--     end

--     -- Imprimer l'UniqueID dans la console pour le débogage
--     print("Insertion de véhicule pour l'UniqueID : " .. UniqueID)

--     ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, garageid, boutique) VALUES ('"..UniqueID.."', '"..plate.."', '"..json.encode(vehicleData).."', '"..garageID.."', '"..boutique.."')")
-- end



-- function GiveVehicle(_source, citizenId, plate, vehicleData)
--     ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES ('"..citizenId.."', '"..plate.."', '"..json.encode(vehicleData).."')")
-- end


-- QBCore beta test function

--[[

local vehicles = {
    [GetHashKey("sultan")] = "sultan",
}

function GiveVehicle(_source, citizenId, plate, vehicleData)
    local pData = QBCore.Functions.GetPlayer(_source)
    local cid = pData.PlayerData.citizenid        
    local fullName = vehicles[vehicleData.model]

    ExecuteSql("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES ('"..pData.PlayerData.license.."', '"..cid.."', '"..fullname.."', '"..vehicleData.model.."', '"..json.encode(vehicleData).."'), '"..plate.."', 1") 
end

]]

