-- local _wheel = nil
-- local _lambo = nil
-- local _isShowCar = false
-- local _wheelPos = vector3(239.557, -877.9077, 29.49209)
-- local _baseWheelPos = vector3(239.557, -877.9077, 29.49209)
-- local _gotoPos = vector3(240.7053, -877.4836, 30.49212)
-- local _wheelHeading = 90.0
-- local _vehPos = vector3(229.2026, -875.4765, 30.4921)

-- local asTurned = false

-- local casinoprops = {}

-- local _isRolling = false

-- CreateThread(function()
--     while not ESXLoaded do Wait(1) end

--     function spawnveh()
--         Zones = {
--             VehicleSpawnPoint = {
--                 Pos   = _vehPos,
--                 Heading = 182.73
--             }
--         }
    
--         local carmodel = GetHashKey('furia')
--         RequestModel(carmodel)
--         while not HasModelLoaded(carmodel) do
--             Citizen.Wait(0)
--         end
    
--         ESX.Game.SpawnLocalVehicle(carmodel,  Zones.VehicleSpawnPoint.Pos, Zones.VehicleSpawnPoint.Heading, function(vehicle)
--             Citizen.Wait(10)
--             SetEntityAsMissionEntity(vehicle, true, true)
--             SetVehicleHasBeenOwnedByPlayer(vehicle, true)
--             SetVehicleOnGroundProperly(vehicle)
--             Citizen.Wait(10)
--             FreezeEntityPosition(vehicle, true)
--             SetEntityInvincible(vehicle, true)
--             SetVehicleDoorsLocked(vehicle, 2)
--             _lambo = vehicle
--             table.insert(casinoprops, _lambo)
--         end)
--     end

--     function doRoll()
--         if not _isRolling then
--             _isRolling = true
--             local playerPed = PlayerPedId()
--             local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
--             if IsPedMale(playerPed) then
--                 _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
--             end
--             local lib, anim = _lib, 'enter_right_to_baseidle'
--             ESX.Streaming.RequestAnimDict(lib, function()
--                 local _movePos = _gotoPos
--                 TaskGoStraightToCoord(playerPed, _movePos.x, _movePos.y, _movePos.z+0.25, 1.0, -1, 158.01226806641, 0.0)
--                 local _isMoved = false
--                 while not _isMoved do
--                     local coords = GetEntityCoords(PlayerPedId())
--                     if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
--                         _isMoved = true
--                     end
--                     Citizen.Wait(0)
--                 end
--                 TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
--                 while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
--                     Citizen.Wait(0)
--                     DisableAllControlActions(0)
--                 end
--                 TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
--                 while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
--                     Citizen.Wait(0)
--                     DisableAllControlActions(0)
--                 end
--                 TriggerServerEvent("esx_tpnrp_luckywheel:getLucky")
--                 TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
--             end)
--         end
--     end

--     RegisterNetEvent("esx_tpnrp_luckywheel:doRoll")
--     AddEventHandler("esx_tpnrp_luckywheel:doRoll", function(_priceIndex)
--         _isRolling = true
    
--         Citizen.CreateThread(function()
--             local speedIntCnt = 1
--             local rollspeed = 1.0
--             local _winAngle = (_priceIndex - 1) * 18
--             local _rollAngle = _winAngle + (360 * 8)
--             local _midLength = (_rollAngle / 2)
--             local intCnt = 0
--             while speedIntCnt > 0 do
--                 SetEntityHeading(_wheel, 158.01226806641)
--                 local retval = GetEntityRotation(_wheel, 1)
--                 if _rollAngle > _midLength then
--                     speedIntCnt = speedIntCnt + 1
--                 else
--                     speedIntCnt = speedIntCnt - 1
--                     if speedIntCnt < 0 then
--                         speedIntCnt = 0
                        
--                     end
--                 end
--                 intCnt = intCnt + 1
--                 rollspeed = speedIntCnt / 10
--                 local _y = retval.y - rollspeed
--                 _rollAngle = _rollAngle - rollspeed
--                 SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)
--                 SetEntityHeading(_wheel, 158.01226806641)
--                 Citizen.Wait(0)
--             end
--         end)
--     end)

--     RegisterNetEvent("esx_tpnrp_luckywheel:rollFinished")
--     AddEventHandler("esx_tpnrp_luckywheel:rollFinished", function()
--         _isRolling = false
--     end)

--     local model = GetHashKey('vw_prop_vw_luckywheel_02a')
--     local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')

--     RequestModel(baseWheelModel)
--     while not HasModelLoaded(baseWheelModel) do
--         Citizen.Wait(0)
--     end

--     _basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, false, false, true)
--     SetEntityHeading(_basewheel, 158.01226806641)
--     SetModelAsNoLongerNeeded(baseWheelModel)
--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         Citizen.Wait(0)
--     end

--     _wheel = CreateObject(model, _wheelPos.x, _wheelPos.y, _wheelPos.z+0.25, false, false, true)
--     SetEntityHeading(_wheel, 158.01226806641)
--     SetModelAsNoLongerNeeded(model)
--     spawnveh()
--     table.insert(casinoprops, _wheel)
--     table.insert(casinoprops, _basewheel)


--     CreateThread(function()
--         local interval = 2000
--         while true do
--             Wait(interval)
--             interval = 2000

--             if _lambo ~= nil then
--                 local _heading = GetEntityHeading(_lambo)
--                 local _z = _heading - 0.3
--                 SetEntityHeading(_lambo, _z)
--             end

--             local coords = Player.coords

--             if(GetDistanceBetweenCoords(coords, _wheelPos.x, _wheelPos.y, _wheelPos.z, true) < 1.5) and not _isRolling then
--                 interval = 1

--                 if asTurned then
--                     ESX.ShowHelpNotification('Appuyez ~INPUT_CONTEXT~ pour tourner la roue $100000')
--                 else

--                     ESX.ShowHelpNotification('Appuyez ~INPUT_CONTEXT~ pour tourner la roue')
--                 end

--                 if IsControlJustReleased(0, 54) then
--                     asTurned = true
--                     doRoll()
--                 end
--             end
--         end
--     end)

--     AddEventHandler('onResourceStop', function(resource)
--         if resource == GetCurrentResourceName() then
--             for _,wheel in pairs(casinoprops) do
--                 DeleteEntity(_wheel)
--                 DeleteEntity(_basewheel)
--                 DeleteEntity(_lambo)
--             end
--         end
--     end)    
-- end)