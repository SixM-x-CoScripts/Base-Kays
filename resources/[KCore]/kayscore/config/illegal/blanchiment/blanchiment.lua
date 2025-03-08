Blanchiment = {
    admin = {
        permissions_command = {['fondateur'] = true},
        create = {},
        selectedBlanchiment = {},
        selectedBlanchimentId = 0,
    },

    data = {
        blanchiment = {},
        load = false,
        interval = 2000,
        location = {'12 heures', '24 heures', '48 heures'},
        locationData = 1,
        percent = {'-40%', '-30%', '-20%', '-10%'},
        percentData = 1,
        paid = {'Liquide', 'Banque'},
        paidData = 1,

        Price = {
            [1] = {
                [1] = 25000,
                [2] = 30000,
                [3] = 40000,
                [4] = 50000
            },
            [2] = {
                [1] = 35000,
                [2] = 40000,
                [3] = 50000,
                [4] = 60000
            },
            [3] = {
                [1] = 50000,
                [2] = 60000,
                [3] = 80000,
                [4] = 100000
            }
        }
    }
}