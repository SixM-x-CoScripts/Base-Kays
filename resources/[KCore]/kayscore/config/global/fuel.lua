--[[FuelConfig = {
    pumpModels = {
		`prop_gas_pump_old2`,
		`prop_gas_pump_1a`,
		`prop_vintage_pump`,
		`prop_gas_pump_old3`,
		`prop_gas_pump_1c`,
		`prop_gas_pump_1b`,
		`prop_gas_pump_1d`,
	}
}]]--

CFGcxFuel = {}

CFGcxFuel = {
    WaitForFuel = 20000, -- Temps d'attente avant la perte d'essence en ms ( CFGcxFueluré de base à : 15s )
    FuelPrice = 3, -- Prix de l'essence/L
    QuantityWithdraw = 1.0, -- Nombre de L perdu par x Temps ( CFGcxFuel.WaitForFuel )
    PrefixMoney = {Index = 1, "~p~Liquide~s~", "~q~Banque~s~"},
    ColourStatistic_1 = {255, 255, 255, 255},
    ColourStatistic_2 = {20, 255, 20, 255},
    SliderPannel = {Minimum = 0, Index = 1},
    ShowBlips = false, -- Affiche ou non les blips
    FuelStation = {
        {pos = vector3(72.254, -1399.102, 28.376)},
        {pos = vector3(49.4187, 2778.793, 58.043)},
        {pos = vector3(263.894, 2606.463, 44.983)},
        {pos = vector3(1039.958, 2671.134, 39.550)},
        {pos = vector3(1207.260, 2660.175, 37.899)},
        {pos = vector3(2539.685, 2594.192, 37.944)},
        {pos = vector3(2679.858, 3263.946, 55.240)},
        {pos = vector3(2005.055, 3773.887, 32.403)},
        {pos = vector3(1687.156, 4929.392, 42.078)},
        {pos = vector3(1701.314, 6416.028, 32.763)},
        {pos = vector3(179.857, 6602.839, 31.868)},
        {pos = vector3(-94.4619, 6419.594, 31.489)},
        {pos = vector3(-2554.996, 2334.40, 33.078)},
        {pos = vector3(-1800.375, 803.661, 138.651)},
        {pos = vector3(-1437.622, -276.747, 46.207)},
        {pos = vector3(-2096.243, -320.286, 13.168)},
        {pos = vector3(-724.619, -935.1631, 19.213)},
        {pos = vector3(-526.019, -1211.003, 18.184)},
        {pos = vector3(-70.2148, -1761.792, 29.534)},
        {pos = vector3(265.648, -1261.309, 29.292)},
        {pos = vector3(819.653, -1028.846, 26.403)},
        {pos = vector3(1208.951, -1402.567,35.224)},
        {pos = vector3(1181.381, -330.847, 69.316)},
        {pos = vector3(620.843, 269.100, 103.089)},
        {pos = vector3(2581.321, 362.039, 108.468)},
        {pos = vector3(176.631, -1562.025, 29.263)},
        {pos = vector3(176.631, -1562.025, 29.263)},
        {pos = vector3(-319.292, -1471.715, 30.549)},
        {pos = vector3(1784.324, 3330.55, 41.253)}
    },
}