local locksound = false
local pillUsed = false
local scaleform RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

local interval = 2000

RegisterNetEvent('dix-oblivionpill:oblivionPill')
AddEventHandler('dix-oblivionpill:oblivionPill', function()
    pillUsed = true

    Citizen.CreateThread(function()
        while pillUsed do
            Citizen.Wait(interval)
    
            interval =  2000
    
            if not pillUsed then goto continue end
    
            interval = 1
    
            if pillUsed == true then
                StartScreenEffect("DeathFailOut", 0, 0)
    
                if not locksound then
                    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
                    locksound = true
                    pillUsed = true
                end
    
                ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
    
                if HasScaleformMovieLoaded(scaleform) then
                    Citizen.Wait(0)
                    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                    BeginTextComponent("STRING")
                    AddTextComponentString(_U('oblivionPill_fall'))
                    EndTextComponent()
                    PopScaleformMovieFunctionVoid()
                    Citizen.Wait(100)
                    PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
    
                    while pillUsed == true do
                        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
                        DisablePlayerFiring(PlayerId(), true)
                        Citizen.Wait(0)
                    end
    
                    StopScreenEffect("DeathFailOut")
                    locksound = false
                end
            end
    
            ::continue::

            if not pillUsed then
                break
            end
        end
    end)
    
end)

RegisterNetEvent('dix-oblivionpill:stopPill')
AddEventHandler('dix-oblivionpill:stopPill', function()
    pillUsed = false
end)