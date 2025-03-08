Config_Fournisseur = {}

Config_Fournisseur.Jobs = {
    ['burgershot'] = {
        { item = 'burgershot_painburger', label = 'Pain Burger', price = 5 },
        { item = 'burgershot_viandeburger', label = 'Viande Burger', price = 5 },
        { item = 'burgershot_salade', label = 'Salade', price = 5 },
        { item = 'burgershot_tomate', label = 'Tomate', price = 5 },
        { item = 'burgershot_cheddar', label = 'Cheddar', price = 5 },
        { item = 'burgershot_bacon', label = 'Bacon', price = 5 },
        { item = 'burgershot_sauce', label = 'Frite', price = 5 },
        { item = 'burgershot_coca', label = 'Coca Cola', price = 5 },
        { item = 'burgershot_sprite', label = 'Sprite', price = 5 },
        { item = 'burgershot_biere', label = 'Bière', price = 5 },
        { item = 'burgershot_frite', label = 'Frite', price = 5 },
        { item = 'burgershot_oignonrings', label = 'Onion Rings', price = 5 },
        { item = 'burgershot_poulet', label = 'Nuggets de poulet', price = 5 },
        { item = 'burgershot_milkshake', label = 'Milkshake', price = 5 },
        { item = 'burgershot_cookie', label = 'Cookie', price = 5 },

    },

    ['pops'] = {
        { item = 'burgershot_milkshake', label = 'Milkshake', price = 5 },
        { item = 'pops_granité', label = 'Granité', price = 5 },
        { item = 'burgershot_pain', label = 'Pain', price = 5 },
        { item = 'props_saucisse', label = 'Saucisse', price = 5 },
        { item = 'pops_sauce', label = 'Sauce', price = 5 },
        { item = 'burgershot_oignonrings', label = 'Ognon Rings', price = 5 },
        { item = 'pops_donut', label = 'Donut ', price = 5 },
    },

    ['hornys'] = {
        { item = 'coca', label = 'Cola', price = 5 },
        { item = 'fanta', label = 'Fanta', price = 5 },
        { item = 'burgershot_pain', label = 'Pain', price = 5 },
        { item = 'burgershot_viandeburger', label = 'Viande', price = 5 },
        { item = 'burgershot_salade', label = 'Salade', price = 5 },
        { item = 'burgershot_tomate', label = 'Tomate', price = 5 },
        { item = 'burgershot_frite', label = 'Frite ', price = 5 },
        { item = 'hornys_glace', label = 'Glace ', price = 5 },

    },

    ['pearls'] = {
        { item = 'burgershot_biere', label = 'Bière', price = 5 },
        { item = 'burgershot_sprite', label = 'Sprite', price = 5 },
        { item = 'pearls_fish', label = 'Poisson', price = 5 },
        { item = 'pearls_frite', label = 'Frite', price = 5 },
        { item = 'pops_sauce', label = 'Sauce', price = 5 },
        { item = 'pearls_moule', label = 'Moule', price = 5 },
        { item = 'pearls_frite', label = 'Frite', price = 5 },
        { item = 'pearls_crevette', label = 'Crevette', price = 5 },

    },

    ['wiwang'] = {
        { item = 'wiwang_vin', label = 'Vin', price = 5 },
        { item = 'wiwang_donperignon', label = 'Don Perignon', price = 5 },
        { item = 'wiwang_ruinart', label = 'Ruinart', price = 5 },
        { item = 'wiwang_cocktail', label = 'Cocktail', price = 5 },
        { item = 'wiwang_juspassion', label = 'Jus Passion Mangue', price = 5 },
        { item = 'wiwang_caviar', label = 'Caviar', price = 5 },
        { item = 'wiwang_macarons', label = 'Macaron', price = 5 },
    },

    ['pacific'] = {
        { item = 'pacific_pina', label = 'Piña Colada', price = 5 },
        { item = 'pacific_mojito', label = 'Mojito', price = 5 },
        { item = 'pacific_margarita', label = 'Margarita', price = 5 },
        { item = 'pacific_coco', label = 'Eau de coco', price = 5 },
        { item = 'pacific_smoothie', label = 'Smoothie tropical', price = 5 },
        { item = 'pacific_chips', label = 'Chips de banane plantain', price = 5 },
        { item = 'pacific_brochettes', label = 'Brochettes de fruits frais', price = 5 },
    },

    ['unicorn'] = {
        { item = 'unicorn_wisky', label = 'Wisky Sour', price = 5 },
        { item = 'unicorn_tequila', label = 'Tequila Sunrise', price = 5 },
        { item = 'unicorn_vodka', label = 'Vodka Martini', price = 5 },
        { item = 'unicorn_pepsi', label = 'Pepsi', price = 5 },
        { item = 'unicorn_jusorange', label = "Jus d'orange pressé", price = 5 },
        { item = 'unicorn_poulet', label = 'Ailes de poulet épicées', price = 5 },
        { item = 'unicorn_miniburger', label = 'Mini-burgers sliders', price = 5 },
    },
    -- Ajoutez plus de jobs et items ici
}



----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


Config_craftjob = {}

Config_craftjob.CraftPoints = {
    ['burgershot'] = {x = -1196.009521, y = -898.430664, z = 13.886161},
    ['pops'] = {x = 1587.468140, y = 6458.186035, z = 26.014011},
    ['hornys'] = {x = 1252.426758, y = -355.046417, z = 69.082123},
    ['pearls'] = {x = -1846.936401, y = -1195.856567, z = 14.305080},
}

Config_craftjob.Recipes = {
    ['burgershot'] = {
        ['burgershot_burger'] = {
            label = 'Burger',
            ingredients = {
                { item = 'burgershot_painburger', label = 'Pain Burger', count = 1 },
                { item = 'burgershot_viandeburger', label = 'Viande Burger', count = 1 },
                { item = 'burgershot_salade', label = 'Salade', count = 1 },
                { item = 'burgershot_tomate', label = 'Tomate', count = 1 },
            }
        },
        ['burgershot_chesseburger'] = {
            label = 'Cheeseburger',
            ingredients = {
                { item = 'burgershot_painburger', label = 'Pain Burger', count = 1 },
                { item = 'burgershot_viandeburger', label = 'Viande Burger', count = 1 },
                { item = 'burgershot_salade', label = 'Salade', count = 1 },
                { item = 'burgershot_tomate', label = 'Tomate', count = 1 },
                { item = 'burgershot_cheddar', label = 'Cheddar', count = 1 },
            }
        },
        ['burgershot_baconburger'] = {
            label = 'Bacon Burger',
            ingredients = {
                { item = 'burgershot_painburger', label = 'Pain Burger', count = 1 },
                { item = 'burgershot_viandeburger', label = 'Viande Burger', count = 1 },
                { item = 'burgershot_salade', label = 'Salade', count = 1 },
                { item = 'burgershot_tomate', label = 'Tomate', count = 1 },
                { item = 'burgershot_cheddar', label = 'Cheddar', count = 1 },
                { item = 'burgershot_bacon', label = 'Bacon', count = 1 },
                { item = 'burgershot_sauce', label = 'Sauce BurgerShot', count = 1 },
            }
        },
    },

    ['pops'] = {
        ['pops_hotdog'] = {
            label = 'HotDog',
            ingredients = {
                { item = 'burgershot_painburger', label = 'Pain', count = 1 },
                { item = 'pops_saucisse', label = 'Saucisse', count = 1 },
                { item = 'pops_sauce', label = 'Sauce', count = 1 },
            }
        },
    },

    ['hornys'] = {
        ['burgershot_burger'] = {
            label = 'Hamburger',
            ingredients = {
                { item = 'burgershot_pain', label = 'Pain', count = 1 },
                { item = 'burgershot_viandeburger', label = 'Viande', count = 1 },
                { item = 'burgershot_salade', label = 'Salade', count = 1 },
                { item = 'burgershot_tomate', label = 'Tomate', count = 1 },
            }
        },
    },

    ['pearls'] = {
        ['pearls_fishandchips'] = {
            label = 'Fish and Chips',
            ingredients = {
                { item = 'pearls_fish', label = 'Poisson', count = 1 },
                { item = 'pearls_frite', label = 'Frite', count = 1 },
                { item = 'pops_sauce', label = 'Sauce', count = 1 },
            }
        },
        ['pearls_moulefrite'] = {
            label = 'Moule Frite',
            ingredients = {
                { item = 'pearls_moule', label = 'Moule', count = 1 },
                { item = 'pearls_frite', label = 'Frite', count = 1 },
            }
        },
    },
    -- ['police'] = {
    --     ['test'] = {
    --         label = 'ARA',
    --         ingredients = {
    --             { item = 'yest', label = 'Pain test', count = 1 },

    --         }
    --     },
    -- },


}

