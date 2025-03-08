kayscoreConfigSafe = {}

kayscoreConfigSafe.SafeZone = {
    list = {},
    bypassJob = {
        ['police'] = true,
        ['bcso'] = true,
    },
    bypassGroup = {
        ['fondateur'] = true,
        ['responsable'] = true,
    },
    disabledKeys = {
        {group = 2, key = 37, message = '~r~Vous ne pouvez pas sortir d\'arme en SafeZone'},
        {group = 0, key = 24, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 69, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 92, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 106, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 168, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 160, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 160, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
        {group = 0, key = 45, message = '~r~Vous ne pouvez pas faire ceci en SafeZone'},
    }
}

if not IsDuplicityVersion() then
    kayscoreConfigSafe.SafeZone.list["POLICE"] = PolyZone:Create({
  vector2(396.8025817871, -955.23315429688),
  vector2(501.48361206054, -955.4697265625),
  vector2(496.54092407226, -1066.2922363282),
  vector2(398.0982055664, -1067.5915527344)
}, {
  name="POLICE",
  --minZ = 32.612880706788,
  --maxZ = 34.144115447998
})

    kayscoreConfigSafe.SafeZone.list["parkingcentral"] = PolyZone:Create({
        vector2(199.521194458, -813.53454589844),
        vector2(192.72145080566, -808.97424316406),
        vector2(224.9353942871, -715.60900878906),
        vector2(298.66357421875, -737.85205078125),
        vector2(273.97326660156, -832.8129272461),
        vector2(272.03454589844, -838.08770751954)
    }, {
        name = "parkingcentral",
    })

    kayscoreConfigSafe.SafeZone.list["pillboxhospital"] = PolyZone:Create({
        vector2(289.92468261718, -553.318359375),
        vector2(266.95156860352, -610.62219238282),
        vector2(352.4035949707, -638.67095947266),
        vector2(401.11291503906, -561.54309082032),
        vector2(351.0446472168, -551.4013671875)
    }, {
        name = "pillboxhospital",
    })
    kayscoreConfigSafe.SafeZone.list["MOTORCYCLE"] = PolyZone:Create({
        vector2(1230.2526855468, 2708.423828125),
        vector2(1256.3366699218, 2707.2175292968),
        vector2(1257.2348632812, 2751.4152832032),
        vector2(1183.2436523438, 2747.2277832032),
        vector2(1206.911743164, 2687.9541015625)
      }, {
        name="MOTORCYCLE",
        --minZ = 38.00601196289,
        --maxZ = 63.2336769104
      })
    kayscoreConfigSafe.SafeZone.list["jail"] = PolyZone:Create({
        vector2(1658.9306640625, 2384.2368164062),
        vector2(1534.8377685546, 2462.2387695312),
        vector2(1525.1419677734, 2592.6286621094),
        vector2(1564.8588867188, 2688.9208984375),
        vector2(1647.9149169922, 2767.3798828125),
        vector2(1779.564819336, 2772.0065917968),
        vector2(1860.9484863282, 2696.3425292968),
        vector2(1856.2764892578, 2512.4711914062),
        vector2(1833.2403564454, 2468.8208007812),
        vector2(1763.8461914062, 2401.0869140625)
    }, {
        name = "jail",
    })

    kayscoreConfigSafe.SafeZone.list["accessoireshop"] = PolyZone:Create({
        vector2(-788.6459350586, -594.89556884766),
        vector2(-807.30090332032, -584.16979980468),
        vector2(-818.25500488282, -602.31420898438),
        vector2(-796.8890991211, -614.05950927734)
    }, {
        name = "accessoireshop",
    })

--[[     kayscoreConfigSafe.SafeZone.list["missionrow"] = PolyZone:Create({
        vector2(411.09060668945, -1027.8759765625),
        vector2(410.75390625, -1032.5220947266),
        vector2(411.28112792969, -1034.2032470703),
        vector2(489.94839477539, -1025.9582519531),
        vector2(490.58227539062, -966.05688476562),
        vector2(418.62188720703, -965.51043701172),
        vector2(411.10641479492, -965.48272705078)
    }, {
        name = "bcsoewMR",
        data = {
            canAfk = false
        }
    }) ]]

    
    kayscoreConfigSafe.SafeZone.list["LSCUSTOM"] = PolyZone:Create({
  vector2(-436.2699584961, -81.489143371582),
  vector2(-413.57348632812, -41.356582641602),
  vector2(-273.31518554688, -116.09303283692),
  vector2(-290.89022827148, -211.34228515625),
  vector2(-349.56579589844, -229.77104187012)
}, {
  name="LSCUSTOM",
  --minZ = 53.50645828247,
  --maxZ = 86.838035583496
})

--[[     kayscoreConfigSafe.SafeZone.list["newhospitalsud"] = PolyZone:Create({
        vector2(340.65075683594, -1352.2066650391),
        vector2(264.84451293945, -1441.6983642578),
        vector2(322.88009643555, -1489.6768798828),
        vector2(331.28134155273, -1488.7485351562),
        vector2(425.60372924805, -1434.1495361328),
        vector2(426.30163574219, -1423.9556884766)
    }, {
        name = "EMSSUDnew"
    }) ]]

    kayscoreConfigSafe.SafeZone.list["BENNYS"] = PolyZone:Create({
        vector2(172.06079101562, -2957.6511230468),
        vector2(193.10916137696, -2979.0363769532),
        vector2(203.93151855468, -3084.7805175782),
        vector2(107.24276733398, -3066.9147949218),
        vector2(111.85256958008, -2964.2692871094)
}, {
  name="BENNYS",
  --minZ = 37.202911376954,
  --maxZ = 72.555305480958
})

    kayscoreConfigSafe.SafeZone.list["GOUVERNEMENT"] = PolyZone:Create({
  vector2(-1217.8177490234, -607.58935546875),
  vector2(-1292.1008300782, -502.68963623046),
  vector2(-1361.3139648438, -526.27770996094),
  vector2(-1286.392944336, -635.67462158204)
}, {
  name="GOUVERNEMENT",
  --minZ = 37.564834594726,
  --maxZ = 58.422340393066
})

    kayscoreConfigSafe.SafeZone.list["fairyfest"] = PolyZone:Create({
        vector2(-1516.1966552734, -982.99011230469),
        vector2(-1567.2458496094, -919.45373535156),
        vector2(-1596.9106445312, -955.18359375),
        vector2(-1655.9489746094, -1028.4013671875),
        vector2(-1595.4392089844, -1077.0234375)
    }, {
        name = "safezone_fairyfest",
        --minZ = 13.017392158508,
        --maxZ = 13.220920562744
    })

    kayscoreConfigSafe.SafeZone.list["boatshop"] = PolyZone:Create({
        vector2(-880.98901367188, -1322.197265625),
        vector2(-842.23132324219, -1425.0317382812),
        vector2(-812.10772705078, -1409.4064941406),
        vector2(-726.46887207031, -1306.7999267578),
        vector2(-716.02575683594, -1315.4958496094),
        vector2(-711.14581298828, -1310.5892333984),
        vector2(-677.47790527344, -1293.4482421875),
        vector2(-698.5849609375, -1250.4819335938),
        vector2(-709.11236572266, -1233.9093017578),
        vector2(-757.16479492188, -1278.1768798828),
        vector2(-834.44311523438, -1264.5726318359)
      }, {
        name = "boatshop",
        --minZ = -0.47470313310623,
        --maxZ = 13.813310623169
      })
        kayscoreConfigSafe.SafeZone.list["carshop"] = PolyZone:Create({
            vector2(-79.570686340332, -1122.4066162109),
            vector2(-79.580078125, -1118.0633544922),
            vector2(-75.544746398926, -1106.5394287109),
            vector2(-60.747806549072, -1066.1281738281),
            vector2(-52.312152862549, -1065.7122802734),
            vector2(-1.7009418010712, -1081.669921875),
            vector2(-15.327857017517, -1126.1683349609),
            vector2(-66.529991149902, -1128.1381835938),
            vector2(-75.314659118652, -1127.6893310547),
            vector2(-77.998542785645, -1125.2204589844)
        }, {
            name = "carshop",
        })

   -- kayscoreConfigSafe.SafeZone.list["hayesmotors"] = PolyZone:Create({
    --    vector2(-1443.6075439454, -447.47311401368),
    --    vector2(-1412.2078857422, -426.92391967774),
   --     vector2(-1398.8228759766, -450.32745361328),
  --      vector2(-1430.0572509766, -468.94171142578)
  --  }, {
 --       name = "hayesmotors",
 --   })

 --   kayscoreConfigSafe.SafeZone.list["hardtuned"] = PolyZone:Create({
  --      vector2(116.82713317872, -3053.9606933594),
  --      vector2(172.27926635742, -3054.2414550782),
  --      vector2(172.04010009766, -3001.1672363282),
  --      vector2(115.650390625, -3000.7221679688)
  --  }, {
 --       name = "hardtuned",
 --   })

 --   kayscoreConfigSafe.SafeZone.list["bennysnord"] = PolyZone:Create({
 --       vector2(26.328569412232, 6426.0576171875),
  --      vector2(-8.115267753601, 6458.12109375),
 --       vector2(39.071422576904, 6504.2631835938),
 --       vector2(70.333892822266, 6469.9609375)
  --  }, {
  --      name = "bennysnord",
    --})

    kayscoreConfigSafe.SafeZone.list["bahamas"] = PolyZone:Create({
        vector2(-1380.0032958984, -572.60223388672),
        vector2(-1351.4575195312, -622.26098632812),
        vector2(-1423.5815429688, -669.48016357422),
        vector2(-1458.2937011718, -615.29345703125)
    }, {
        name = "bahamas",
    })

   -- kayscoreConfigSafe.SafeZone.list["bennys"] = PolyZone:Create({
    --    vector2(-259.54614257812, -1298.642578125),
   --     vector2(-259.86560058594, -1362.1743164062),
    --    vector2(-177.29469299316, -1347.4581298828),
   --     vector2(-177.71577453614, -1310.9255371094),
   --     vector2(-152.51434326172, -1310.9067382812),
   --     vector2(-152.29783630372, -1300.6392822266),
   --     vector2(-120.08348846436, -1300.2930908204),
   --     vector2(-121.02216339112, -1293.9128417968),
  --      vector2(-174.40641784668, -1293.4669189454),
  --      vector2(-174.51176452636, -1256.429321289),
        vector2(-192.4314880371, -1258.4776611328)
 --   }, {
 --       name = "bennys",
 --   })

    kayscoreConfigSafe.SafeZone.list["unicorn"] = PolyZone:Create({
        vector2(129.55494689942, -1354.4171142578),
        vector2(172.16995239258, -1271.8287353516),
        vector2(129.1371307373, -1268.5946044922),
        vector2(72.21134185791, -1278.2708740234),
        vector2(95.653633117676, -1320.9764404296)
    }, {
        name = "unicorn",
    })

    kayscoreConfigSafe.SafeZone.list["spawn"] = PolyZone:Create({
        vector2(-136.41268920898, -297.11434936524),
        vector2(-144.6170349121, -323.23818969726),
        vector2(-182.45324707032, -308.50909423828),
        vector2(-174.90101623536, -285.2360534668)
    }, {
        name = "spawn",
    })

--    kayscoreConfigSafe.SafeZone.list["afk"] = PolyZone:Create({
--        vector2(540.47003173828, 4749.4814453125),
 --       vector2(453.56060791016, 4749.3286132812),
 --       vector2(437.39358520508, 4864.1591796875),
--        vector2(513.20220947266, 4866.1225585938)
 --   }, {
  --      name = "afk",
   -- })

 --   kayscoreConfigSafe.SafeZone.list["lscustom"] = PolyZone:Create({
  --      vector2(-361.23852539062, -183.17805480958),
 --       vector2(-300.58267211914, -164.18208312988),
 ---       vector2(-290.75857543946, -97.74772644043),
 --       vector2(-400.7643737793, -57.823066711426),
 --       vector2(-420.0294494629, -78.479179382324)
 --   }, {
 --       name = "lscustom",
   -- })

 --   kayscoreConfigSafe.SafeZone.list["dreamworks"] = PolyZone:Create({
--        vector2(-713.95642089844, -1517.2741699218),
--        vector2(-762.48602294922, -1537.3729248046),
 --       vector2(-770.82775878906, -1512.4567871094),
--        vector2(-722.24224853516, -1492.8325195312)
 --   }, {
--        name = "dreamworks",
  --  })

    kayscoreConfigSafe.SafeZone.list["parking2"] = PolyZone:Create({
        vector2(93.722282409668, -1081.2595214844),
        vector2(110.24654388428, -1045.9522705078),
        vector2(126.81996154786, -1051.484008789),
        vector2(152.103805542, -1059.6330566406),
        vector2(150.75733947754, -1064.6048583984),
        vector2(172.82382202148, -1072.1990966796),
        vector2(172.84558105468, -1084.1561279296),
        vector2(172.85539245606, -1089.1826171875),
        vector2(166.35578918458, -1089.2010498046),
        vector2(166.34977722168, -1086.8347167968),
        vector2(115.17276763916, -1088.9927978516)
    }, {
        name = "parking2",
    })

  --  kayscoreConfigSafe.SafeZone.list["uwucoffe"] = PolyZone:Create({
  --      vector2(-562.291015625, -1132.4627685546),
  --      vector2(-564.890625, -973.11163330078),
  --      vector2(-618.58190917968, -976.27844238282),
  --      vector2(-601.89221191406, -1132.8211669922)
  --  }, {
--        name = "uwucoffe",
 --   })

 --   kayscoreConfigSafe.SafeZone.list["autoexotic"] = PolyZone:Create({
 --       vector2(523.64825439454, -163.82279968262),
 --       vector2(555.26678466796, -163.98693847656),
 --       vector2(554.3745727539, -207.86770629882),
 --       vector2(546.68249511718, -225.42895507812),
 --       vector2(539.69177246094, -224.8332824707)
 --   }, {
 --       name = "autoexotick",
 --   })

 --   kayscoreConfigSafe.SafeZone.list["paleto_carshop"] = PolyZone:Create({
  --      vector2(-270.76846313476, 6214.7866210938),
  --      vector2(-229.2082977295, 6171.111328125),
 --       vector2(-172.9981842041, 6226.2827148438),
  --      vector2(-230.97917175292, 6284.3666992188),
  --      vector2(-258.61889648438, 6257.2045898438),
  ---      vector2(-243.81562805176, 6243.05078125)
  --  }, {
  --      name = "paleto_carshop"
 --   })

--kayscoreConfigSafe.SafeZone.list["ambulancenord"] = PolyZone:Create({
 --     vector2(-254.88670349121, 6290.5727539062),
  --    vector2(-222.57437133789, 6323.0170898438),
 --     vector2(-256.55554199219, 6354.6977539062),
 --     vector2(-287.67810058594, 6324.1611328125)
 --   }, {
 --       name = "ambulancenord",
  --  })

    kayscoreConfigSafe.SafeZone.list["pacificbluffs"] = PolyZone:Create({
        vector2(-3042.0219726562, 178.96754455566),
        vector2(-3112.8166503906, 177.7352142334),
        vector2(-3111.2014160156, 83.933776855469),
        vector2(-3079.1350097656, 25.945672988892),
        vector2(-3020.4560546875, -4.9522819519043),
        vector2(-2983.6743164062, 37.394359588623),
        vector2(-2963.9072265625, 81.781364440918),
        vector2(-3000.9743652344, 114.37630462646),
        vector2(-3019.919921875, 137.8900604248)
    }, {
        name = "pacific",
    })

    kayscoreConfigSafe.SafeZone.list["burgershot"] = PolyZone:Create({
        vector2(-1216.5672607422, -888.57421875),
        vector2(-1197.8731689453, -918.33166503906),
        vector2(-1154.1174316406, -893.01556396484),
        vector2(-1171.0653076172, -866.30145263672),
        vector2(-1175.0283203125, -861.05010986328)
    }, {
        name = "burgershot",
    })

    kayscoreConfigSafe.SafeZone.list["ltd_littleseoul"] = PolyZone:Create({
        vector2(-734.03094482422, -906.44714355469),
        vector2(-696.51068115234, -906.29364013672),
        vector2(-696.73089599609, -945.62475585938),
        vector2(-743.3330078125, -946.14392089844)
    }, {
        name = "ltdsud"
    })

    kayscoreConfigSafe.SafeZone.list["ltd_paletobay"] = PolyZone:Create({
        vector2(155.30856323242, 6551.2592773438),
        vector2(211.8172302246, 6577.5556640625),
        vector2(210.59815979004, 6634.158203125),
        vector2(180.88749694824, 6641.4814453125),
        vector2(159.99603271484, 6667.4506835938),
        vector2(146.7547302246, 6656.4370117188),
        vector2(137.23132324218, 6664.1552734375),
        vector2(87.921852111816, 6613.4047851562)
    }, {
        name = "ltd_paleto"
    })

    kayscoreConfigSafe.SafeZone.list["bcso_paleto"] = PolyZone:Create({
        vector2(-445.47882080078, 6064.5424804688),
        vector2(-490.37161254882, 6024.7875976562),
        vector2(-481.34213256836, 6013.9711914062),
        vector2(-502.98571777344, 5992.0083007812),
        vector2(-473.09716796875, 5960.7739257812),
        vector2(-449.3152770996, 5983.826171875),
        vector2(-439.58279418946, 5973.4545898438),
        vector2(-419.7462463379, 5993.3803710938),
        vector2(-427.11618041992, 6024.0756835938)
    }, {
        name = "bcso_paleto",
        data = {
            canAfk = false
        }
    })

 --  kayscoreConfigSafe.SafeZone.list["bikeshop"] = PolyZone:Create({
    --    vector2(365.58755493164, -1144.0299072266),
    --    vector2(365.86813354492, -1168.2608642578),
   --     vector2(305.37350463868, -1167.896850586),
   --     vector2(304.99057006836, -1177.7608642578),
   --     vector2(238.085647583, -1177.1469726562),
   --     vector2(231.18893432618, -1143.3465576172)
  --  }, {
 --       name = "bikeshop"
 --   })

   -- kayscoreConfigSafe.SafeZone.list["ambulancesandy"] = PolyZone:Create({
   --     vector2(1706.0994873046, 3647.7241210938),
   --     vector2(1675.6904296875, 3703.0522460938),
   --     vector2(1614.154663086, 3668.0239257812),
  --      vector2(1644.569946289, 3615.2849121094),
  --      vector2(1649.3708496094, 3614.5104980468)
 --   }, {
 --       name = "ambulancesandy"
--    })

  --  for k,v in pairs(fishing.zones) do
  --      kayscoreConfigSafe.SafeZone.list[k] = v.zone
 --   end

    local canAfk = true
    local isinsafezone = false

    function GetSafeZone()
        if isinsafezone == true or notifIn == true then
            if canAfk then
                return true
            end

            return false
        end

        return false
    end

    function GetSafeZoneLocation(position)
        local result = false

        for k,v in pairs(kayscoreConfigSafe.SafeZone.list) do  
            if not v:isPointInside(position) then goto continue end

            result = true
            break

            ::continue::
        end

        return result
    end

    exports('getSafeZone', GetSafeZone)
    exports('inSafeZone', GetSafeZone)
    exports('inSafeZoneLoc', GetSafeZoneLocation)

    Citizen.CreateThread(function()
        while not NetworkIsPlayerActive(Player.playerId) do
            Citizen.Wait(0)
        end

        for k,v in pairs(kayscoreConfigSafe.SafeZone.list) do
            kayscoreConfigSafe.SafeZone.list[k]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                if isPointInside then
                    NetworkSetFriendlyFireOption(false)
                    SetCurrentPedWeapon(Player.playerPed, `WEAPON_UNARMED`, true)
                    ESX.ShowNotification("Vous entrez en ~g~SafeZone.")
                    isinsafezone = true

                    if v.data.canAfk ~= nil and v.data.canAfk == false then
                        canAfk = false
                    else
                        canAfk = true
                    end

                    Citizen.CreateThread(function()
                        while isinsafezone do
                            Wait(0)

                            DisablePlayerFiring(Player.playerPed, true)
                            SetCurrentPedWeapon(Player.playerPed, `WEAPON_UNARMED`, true)

                            for i = 1, #kayscoreConfigSafe.SafeZone.disabledKeys, 1 do
                                DisableControlAction(kayscoreConfigSafe.SafeZone.disabledKeys[i].group, kayscoreConfigSafe.SafeZone.disabledKeys[i].key, true)
                            end
                        end
                    end)
                else
                    isinsafezone = false
                    canAfk = true

                    for vehicle in EnumerateVehicles() do
                        if not IsVehicleSeatFree(vehicle, -1) then
                            SetEntityNoCollisionEntity(Player.playerPed, vehicle, false)
                            SetEntityNoCollisionEntity(vehicle, Player.playerPed, false)
                        end
                    end

                    NetworkSetFriendlyFireOption(true)
                    ESX.ShowNotification("Vous sortez de ~r~SafeZone")
                end
            end)
        end
    end)
else
    exports('getSafeZone', function(source, position)
        return rpc_Native('getSafeZoneLocation', source, position)
    end)
    exports('inSafeZoneLoc', function(source, position)
        return rpc_Native('getSafeZoneLocation', source, position)
    end)
    exports('inSafeZone', GetSafeZone)
end