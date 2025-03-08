local radiographyState = false 
local radiographyLimb = {""}

local function openRadiographyMenu(job)
    local menu = RageUI.CreateMenu("Radiographie", "Actions disponible")
    local radioLimbs = UTILS:formatToList(kayscoreAmulance.Ambulance.radiographsLimb)
    local coords = Player.coords 
    local radioIndex = 1

	RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do 
		Citizen.Wait(0)
		RageUI.IsVisible(menu, function()
            RageUI.List("Effectuer une radio", radioLimbs, radioIndex, nil, {}, true, {
                onListChange = function(Index)
                    radioIndex = Index
                end,

                onSelected = function(Index)
                    TriggerServerEvent('ambulance:server:startRadiography', radioLimbs[radioIndex])
                end
            }) 
        end)

        if not RageUI.Visible(menu) or #(Player.coords - coords) > 2.0 then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

Citizen.CreateThread(function()
    for k,v in pairs(kayscoreAmulance.Ambulance.radiographs) do
        AddZones(("radiography_zone_%s"):format(k), {
            Position = v.menu,
            Dist = 10,
            Public = false,
            Job = {['ambulance'] = true},
            Job2 = {['ambulance'] = true},
            GradesJob = {},
            InVehicleDisable = true,
            Blip = {
                Active = false,
            },
            marker = true,
            ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
            Action = function()
                openRadiographyMenu(k)
            end
        })
    end
end)

local function startRadiographyParticle(position)
    ESX.Streaming.RequestNamedPtfxAsset('core')
    UseParticleFxAssetNextCall("core")
    StartParticleFxNonLoopedAtCoord("ent_anim_paparazzi_flash", position.x, position.y, position.z, 1.0, 1.0, 1.0, 1.0, false, false)
    RemoveNamedPtfxAsset("core")
end

RegisterNetEvent('ambulance:client:startRadiography', function(job)
    local preset = kayscoreAmulance.Ambulance.radiographs[job]
    if preset == nil then return end 

    local pos = preset.bed
    if pos == nil then return end

    if #(Player.coords - pos) > 5.0 then 
        return 
    end
    
    Citizen.SetTimeout(17000, function()
        SetArtificialLightsState(false)
    end)

    SetArtificialLightsState(true)
    Wait(2500)
    startRadiographyParticle(pos)
    Wait(5000)
    startRadiographyParticle(pos)
    Wait(5000)
    startRadiographyParticle(pos)
    Wait(2500)
    SetArtificialLightsState(false)
end)